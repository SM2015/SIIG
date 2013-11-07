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
        $datos[1]['campos'] = array('Codigo'=>'a','Descripcion'=>'Anual');
        $datos[2]['campos'] = array('Codigo'=>'s','Descripcion'=>'Semestral');
        $datos[3]['campos'] = array('Codigo'=>'t','Descripcion'=>'Trimestral');
        $datos[4]['campos'] = array('Codigo'=>'m','Descripcion'=>'Mensual');
        $datos[5]['campos'] = array('Codigo'=>'sm','Descripcion'=>'Semanal');
        $datos[6]['campos'] = array('Codigo'=>'d','Descripcion'=>'Diario');
        $datos[7]['campos'] = array('Codigo'=>'b','Descripcion'=>'Bimestral');
        $datos[8]['campos'] = array('Codigo'=>'q','Descripcion'=>'Quincenal');
        $datos[9]['campos'] = array('Codigo'=>'c','Descripcion'=>'Cuatrimestral');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
