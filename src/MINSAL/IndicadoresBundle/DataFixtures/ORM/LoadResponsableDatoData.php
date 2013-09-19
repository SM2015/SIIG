<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadResponsableDatoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Establecimiento'=>'Establecimiento-lugar responsable de dato, ejemplo1','Contacto'=>'nombre persona contacto ejemplo 1', 'Correo'=>'correo persona contacto ejemplo1', 'Telefono'=>'9999-9999', 'Cargo'=>'cargo persona contacto ejemplo 1');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
