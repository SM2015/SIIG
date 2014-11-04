<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadFormatoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'moneda','Descripcion'=>'Moneda', 'formato'=>'c2');        
        $datos[1]['foraneas'] = array('TipoDato'=>'TipoDato-1');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 2; // the order in which fixtures will be loaded
    }
}
