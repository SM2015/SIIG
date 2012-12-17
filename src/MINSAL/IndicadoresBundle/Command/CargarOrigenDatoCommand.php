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

    protected function execute(InputInterface $input, OutputInterface $output) {
        $em = $this->getContainer()->get('doctrine')->getEntityManager();

        //Recuperar todos las fichas técnicas de indicadores
        $indicadores = $em->getRepository('IndicadoresBundle:FichaTecnica')->findAll();

        foreach ($indicadores as $ind) {

            $ahora = new \DateTime("now");

            if ($ind->getUltimaLectura() == '')
                $dif = 1; // No se ha realizado carga de datos antes, mandar a cargarlos
            else {
                $ultima_lectura = $ind->getUltimaLectura()->getTimestamp();
                $periocidad = $ind->getPeriodo()->getCodigo();

                $intervalo = $ahora->diff($ultima_lectura);
                $dif_dias = $intervalo->format('%a');

                if ($periocidad == 'd') //Diario?
                    $dif = $dif_dias;
                elseif ($periocidad == 'sm') //semanal?
                    $dif = $dif_dias / 7;
                elseif ($periocidad == 'm')
                    $dif = $dif_dias / 30; //mensual?
                elseif ($periocidad == 't')
                    $dif = $dif_dias / 30 * 3; //trimestral?
                elseif ($periocidad == 's')
                    $dif = $dif_dias / 30 * 6; //semestral?
                elseif ($periocidad == 'a')
                    $dif = $dif_dias / 365; //Anual?
                else
                    $dif = 1; // No tiene periocidad, cargarlo
            }
            if ($dif >= 1) {
                //Es necesaria realizar la carga de datos
                // Recuperar los orígenes de datos asociados a las variables del indicador                
                foreach ($ind->getVariables() as $var) {
                    $origenDato = $var->getOrigenDatos();

                    $msg = array('id_origen_dato' => $origenDato->getId());
                    $msg['sql'] = $origenDato->getSentenciaSql();
                    $msg['total_registros'] = $em->getRepository('IndicadoresBundle:OrigenDatos')->getTotalRegistros($origenDato);

                    $carga_directa = $origenDato->getEsCatalogo();
                    // No mandar a la cola de carga los que son catálogos, Se cargarán directamente                    
                    if ($carga_directa)
                        $em->getRepository('IndicadoresBundle:OrigenDatos')->cargarCatalogo($origenDato);
                    else
                        $this->getContainer()->get('old_sound_rabbit_mq.cargar_origen_datos_producer')
                                ->publish(serialize($msg));
                }
                $ind->setUltimaLectura($ahora);
                $em->flush();
            }
        }
    }

}