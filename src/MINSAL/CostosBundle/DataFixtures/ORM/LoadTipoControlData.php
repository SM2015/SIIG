<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoControlData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'Number','Descripcion'=>'Número');
        $datos[2]['campos'] = array('Codigo'=>'datetimeinput','Descripcion'=>'Fecha/Hora');
        $datos[3]['campos'] = array('Codigo'=>'text','Descripcion'=>'Texto');
        $datos[4]['campos'] = array('Codigo'=>'dropdownlist','Descripcion'=>'Lista desplegable');
        $datos[5]['campos'] = array('Codigo'=>'checkbox','Descripcion'=>'Cuadro de verificación');
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 2; // the order in which fixtures will be loaded
    }
}
