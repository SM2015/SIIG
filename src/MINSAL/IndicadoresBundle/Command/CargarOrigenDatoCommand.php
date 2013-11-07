<?php

namespace MINSAL\IndicadoresBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

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
            $ultima_lectura = $em->getRepository('IndicadoresBundle:OrigenDatos')->getUltimaActualizacion($origenDato);

            if ($ultima_lectura == null)
                $dif = 1; // No se ha realizado carga de datos antes, mandar a cargarlos
            else {
                //print_r($ultima_lectura);
                // Agregar a la ultima lectura la ventana de actualizacion
                if($origenDato->getVentana()) {
                    //echo $origenDato->getVentana().PHP_EOL;
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

                //echo 'Ahora: '.$ahora->format('Y-m-d H:i:s').' Fecha: '.$ultima_lectura->format('Y-m-d H:i:s').' - Periodicidad: '.$periocidad.' - Dif: '.$dif.PHP_EOL;
            }

            //$dif = 1;
            if ($dif >= 1) {
                //Es necesaria realizar la carga de datos
                // Recuperar los orígenes de datos asociados a las variables del indicador                
                //foreach ($ind->getVariables() as $var) {
                    //$origenDato = $var->getOrigenDatos();
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

                        //print_r($campos);

                        $maxCampoSuperior = '';
                        $maxCampoInferior = '';

                        foreach ($ordenTiempo as $tiempo) {
                            //echo $tiempo.PHP_EOL;
                            if(empty($maxCampoSuperior)) {
                                if(array_key_exists($tiempo, $campos)) {
                                    $maxCampoSuperior = $tiempo;//$campos[$tiempo];
                                }
                            }

                            if(array_key_exists($tiempo, $campos)) {
                                $maxCampoInferior = $tiempo;//$campos[$tiempo];
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
                                //$maxValorSuperior++;
                                $maxValorInferior = 0;
                            }

                            if($maxCampoSuperior == $maxCampoInferior) {
                                $maxCampoInferior = null;
                                $maxValorInferior = null;
                            }

                            $limites = array(
                                'campoSuperior'=>$maxCampoSuperior,
                                'valorSuperior'=>$maxValorSuperior,
                                'campoInferior'=>$maxCampoInferior,
                                'valorInferior'=>$maxValorInferior,
                            );
                        }
                    }

                    $msg = array('id_origen_dato' => $origenDato->getId(), 
                                'sql'=> $origenDato->getSentenciaSql(),
                                'es_incremental'=>$origenDato->getActualizacionIncremental(),
                                'campos' => $campos,
                                'limites' => $limites,
                            );

                    $carga_directa = $origenDato->getEsCatalogo();

                    //if($origenDato->getActualizacionIncremental())
                    //    print_r($msg);

                    /*if(!empty($limites))
                        die();*/
                    // No mandar a la cola de carga los que son catálogos, Se cargarán directamente
                    if ($carga_directa)
                        $em->getRepository('IndicadoresBundle:OrigenDatos')->cargarCatalogo($origenDato);
                    else
                        $this->getContainer()->get('old_sound_rabbit_mq.cargar_origen_datos_producer')
                                ->publish(serialize($msg));

                    // La ultima actualizacion la establece el GuardarRegistroOrigenDatoConsumer
                    // lo guarda como un ReporteActualizacion
                    //$ind->setUltimaLectura($ahora);
                //}
            }
        }
        $em->flush();
    }

}