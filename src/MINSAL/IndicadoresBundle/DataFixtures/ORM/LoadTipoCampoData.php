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
        $datos[1]['campos'] = array('Codigo'=>'float','Descripcion'=>'Número flotante');
        $datos[2]['campos'] = array('Codigo'=>'text','Descripcion'=>'Texto');
        $datos[3]['campos'] = array('Codigo'=>'date','Descripcion'=>'Fecha');
        $datos[4]['campos'] = array('Codigo'=>'varchar(255)','Descripcion'=>'Cadena de texto');
        $datos[5]['campos'] = array('Codigo'=>'integer','Descripcion'=>'Entero');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
