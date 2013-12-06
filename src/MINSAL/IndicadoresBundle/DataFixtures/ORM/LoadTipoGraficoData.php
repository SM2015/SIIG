<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoGraficoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'columnas','Descripcion'=>'Columnas');
        $datos[2]['campos'] = array('Codigo'=>'pastel','Descripcion'=>'Pastel');
        $datos[3]['campos'] = array('Codigo'=>'lineas','Descripcion'=>'Lineas');
        //$datos[4]['campos'] = array('Codigo'=>'mapa','Descripcion'=>'Mapa');
        $datos[5]['campos'] = array('Codigo'=>'gauge','Descripcion'=>'Odometro');
        $datos[6]['campos'] = array('Codigo'=>'lineargauge','Descripcion'=>'Termometro');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
