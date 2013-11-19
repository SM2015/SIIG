<?php

namespace MINSAL\IndicadoresBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use MINSAL\IndicadoresBundle\Entity\ReporteActualizacion;

class CargarOrigenDatoCommand extends ContainerAwareCommand {

    protected function configure() {
        $this
                ->setName('origen-dato:cargar')
                ->setDescription('Cargar datos especificados en los orígenes')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $em = $this->getContainer()->get('doctrine')->getManager();
        $ahora = new \DateTime("now");
        //Recuperar todos los origenes de datos
        $origenesDatos = $em->getRepository('IndicadoresBundle:OrigenDatos')->findAll();

        foreach ($origenesDatos as $origenDato) {
            $ultima_lectura = $em->getRepository('IndicadoresBundle:ReporteActualizacion')->getUltimaActualizacion($origenDato->getId());

            if ($ultima_lectura == null)
                $dif = 1; // No se ha realizado carga de datos antes, mandar a cargarlos
            else {
                // Agregar a la ultima lectura la ventana de actualizacion
                if($origenDato->getVentana()) {
                    $days = $origenDato->getVentana()==1 ? 'day' : 'days';
                    $ultima_lectura->add(date_interval_create_from_date_string($origenDato->getVentana().' '.$days));
                }
                
                if ($origenDato->getPeriodicidad() != null)
                    $periocidad = $origenDato->getPeriodicidad()->getCodigo();
                else $periocidad='d';

                $intervalo = $ahora->diff($ultima_lectura);
                $dif_dias = $intervalo->format('%a');

                if ($periocidad == 'd') //Diario?
                    $dif = $dif_dias;
                elseif ($periocidad == 'sm') //semanal?
                    $dif = $dif_dias / 7;
                elseif ($periocidad == 'q')
                    $dif = $dif_dias / 15; //quincenal?
                elseif ($periocidad == 'm')
                    $dif = $dif_dias / 30; //mensual?
                elseif ($periocidad == 'b')
                    $dif = $dif_dias / 30 * 2; //bimestral?
                elseif ($periocidad == 't')
                    $dif = $dif_dias / 30 * 3; //trimestral?
                elseif ($periocidad == 'c')
                    $dif = $dif_dias / 30 * 4; //cuatrimestral?
                elseif ($periocidad == 's')
                    $dif = $dif_dias / 30 * 6; //semestral?
                elseif ($periocidad == 'a')
                    $dif = $dif_dias / 365; //Anual?
                else
                    $dif = 1; // No tiene periocidad, cargarlo
            }
            
            if ($dif >= 1) {
                // Recuperar el nombre y significado de los campos del origen de datos
                $campos_sig = array();
                $campos = $origenDato->getCampos();
                foreach ($campos as $campo) {
                    $campos_sig[$campo->getNombre()] = $campo->getSignificado()->getCodigo();
                }
                
                $campos = null;
                $limites = null;

                if($origenDato->getActualizacionIncremental()) {
                    $limites = null;

                    // Obtener todos los campos del origen de datos
                    // es necesario para la carga incremental
                    $objsCampos = $origenDato->getCampos();
                    $ordenTiempo = $this->getContainer()->getParameter('tiempo');
                    $campos = array();

                    foreach($objsCampos as $campo) {
                        $campos[$campo->getSignificado()->getCodigo()] = $campo->getNombre();
                    }

                    $maxCampoSuperior = '';
                    $maxCampoInferior = '';
                    $sqlCampoSuperior = '';
                    $sqlCampoInferior = '';

                    foreach ($ordenTiempo as $tiempo) {
                        if(empty($maxCampoSuperior)) {
                            if(array_key_exists($tiempo, $campos)) {
                                $maxCampoSuperior = $tiempo;
                                $sqlCampoSuperior = $campos[$tiempo];
                            }
                        }

                        if(array_key_exists($tiempo, $campos)) {
                            $maxCampoInferior = $tiempo;
                            $sqlCampoInferior = $campos[$tiempo];
                        }
                    }

                    $sql = 'SELECT
                                MAX(CAST (datos->\''.$maxCampoSuperior.'\' AS INTEGER)) AS val_superior,
                                MAX(CAST (datos->\''.$maxCampoInferior.'\' AS INTEGER)) AS val_inferior
                            FROM fila_origen_dato WHERE id_origen_dato = '.$origenDato->getId();

                    $result = $em->getConnection()->executeQuery($sql)->fetchAll();

                    if(!empty($result)) {
                        $maxValorSuperior = $result[0]['val_superior'];
                        $maxValorInferior = $result[0]['val_inferior'];

                        // Si el mes superior es 12 entonces tomamos datos del siguiente año
                        if($maxCampoSuperior == 'anio' && $maxCampoInferior == 'id_mes' && $maxValorInferior == 12) {
                            $maxValorInferior = 0;
                        }

                        if($maxCampoSuperior == $maxCampoInferior) {
                            $maxCampoInferior = null;
                            $maxValorInferior = null;
                        }

                        $limites = array(
                            'campoSuperior'=>$sqlCampoSuperior,
                            'valorSuperior'=>$maxValorSuperior,
                            'campoInferior'=>$sqlCampoInferior,
                            'valorInferior'=>$maxValorInferior,
                        );
                    }
                }

                $msg = array('id_origen_dato' => $origenDato->getId(), 
                            'sql'=> $origenDato->getSentenciaSql(),
                            'es_incremental'=>$origenDato->getActualizacionIncremental(),
                            'campos_significados' => $campos_sig,
                            'limites' => $limites,
                        );

                $carga_directa = $origenDato->getEsCatalogo();

                // No mandar a la cola de carga los que son catálogos, Se cargarán directamente
                if ($carga_directa) {
                    $respuesta = $em->getRepository('IndicadoresBundle:OrigenDatos')->cargarCatalogo($origenDato);
                    $reporteActualizacion = new ReporteActualizacion;
                    $reporteActualizacion->setOrigenDatos($origenDato);
                    $reporteActualizacion->setFecha(new \DateTime('now'));

                    if ($respuesta !== true) {
                        // Crear el registro para el reporte de actualizacion
                        $reporteActualizacion->setEstatusAct($em->find('IndicadoresBundle:EstatusActualizacion', 2));
                        $reporteActualizacion->setReporte($respuesta);
                    } else {
                        // Crear el registro para el reporte de actualizacion
                        $reporteActualizacion->setEstatusAct($em->find('IndicadoresBundle:EstatusActualizacion', 1));
                        $reporteActualizacion->setReporte('Actualizacion correcta');
                    }

                    $em->persist($reporteActualizacion);
                    $em->flush();
                }
                else
                    $this->getContainer()->get('old_sound_rabbit_mq.cargar_origen_datos_producer')
                            ->publish(serialize($msg));
            }
        }
        $em->flush();
    }

}