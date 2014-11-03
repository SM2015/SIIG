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
        $datos[3]['campos'] = array('Codigo'=>'DateTime','Descripcion'=>'Fecha/Hora');
        $datos[4]['campos'] = array('Codigo'=>'Text','Descripcion'=>'Texto');
        $datos[5]['campos'] = array('Codigo'=>'DropDownList','Descripcion'=>'Lista desplegable');
        $datos[5]['campos'] = array('Codigo'=>'checkbox','Descripcion'=>'Cuadro de verificación');
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 2; // the order in which fixtures will be loaded
    }
}
