<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadCriteriosDistribucionGAData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'area_mt2','Descripcion'=>'Área en mt2');
        $datos[2]['campos'] = array('Codigo'=>'dependencia','Descripcion'=>'Dependencia');
        $datos[3]['campos'] = array('Codigo'=>'asignacion_directa','Descripcion'=>'Asignación Directa');
        $datos[4]['campos'] = array('Codigo'=>'consumo','Descripcion'=>'Consumo');
        $datos[5]['campos'] = array('Codigo'=>'personas','Descripcion'=>'Personas');
 	
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
