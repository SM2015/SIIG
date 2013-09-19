<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadClasificacionTecnicaData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'Demo','Descripcion'=>'Demográficos');
        $datos[2]['campos'] = array('Codigo'=>'Morta','Descripcion'=>'Mortalidad');
        $datos[3]['campos'] = array('Codigo'=>'Morbi','Descripcion'=>'Morbilidad');
        $datos[4]['campos'] = array('Codigo'=>'ReSeCo','Descripcion'=>'Recursos, Servicios y Cobertura');
        $datos[5]['campos'] = array('Codigo'=>'Socioeco','Descripcion'=>'Socioecónomicos');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
