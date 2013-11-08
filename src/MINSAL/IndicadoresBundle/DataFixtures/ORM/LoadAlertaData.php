<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadAlertaData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('codigo'=>'green', 'Color'=>'Verde');
        $datos[2]['campos'] = array('codigo'=>'orange', 'Color'=>'Naranja');
        $datos[3]['campos'] = array('codigo'=>'red', 'Color'=>'Rojo');
        $datos[4]['campos'] = array('codigo'=>'black', 'Color'=>'Negro');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
