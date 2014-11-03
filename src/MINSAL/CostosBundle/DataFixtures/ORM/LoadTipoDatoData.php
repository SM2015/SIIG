<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoDatoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'float','Descripcion'=>'Número flotante');
        $datos[3]['campos'] = array('Codigo'=>'date','Descripcion'=>'Fecha');
        $datos[4]['campos'] = array('Codigo'=>'string','Descripcion'=>'Cadena de texto');
        $datos[5]['campos'] = array('Codigo'=>'int','Descripcion'=>'Entero');
        $datos[5]['campos'] = array('Codigo'=>'bool','Descripcion'=>'Falso/Verdadero');        

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
