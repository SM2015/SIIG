<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadPeriodosData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('codigo'=>'a','descripcion'=>'Anual');
        $datos[2]['campos'] = array('codigo'=>'m','descripcion'=>'Mensual');
        $datos[3]['campos'] = array('codigo'=>'t','descripcion'=>'Trimestral');
        $datos[4]['campos'] = array('codigo'=>'s','descripcion'=>'Semestral');
        
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}