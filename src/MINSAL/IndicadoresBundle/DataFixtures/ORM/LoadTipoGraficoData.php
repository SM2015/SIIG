<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoCampoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'column','Descripcion'=>'Columnas');
        $datos[2]['campos'] = array('Codigo'=>'pie','Descripcion'=>'Pastel');
        $datos[3]['campos'] = array('Codigo'=>'line','Descripcion'=>'Lineas');
        $datos[4]['campos'] = array('Codigo'=>'map','Descripcion'=>'Mapa');
        
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}