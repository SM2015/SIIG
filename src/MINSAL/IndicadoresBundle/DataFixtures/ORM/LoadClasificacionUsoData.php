<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadClasificacionUsoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'sala_situ','Descripcion'=>'Sala situacional');
        $datos[2]['campos'] = array('Codigo'=>'calidad','Descripcion'=>'Calidad');
        $datos[3]['campos'] = array('Codigo'=>'cigob','Descripcion'=>'CIGOB');
        $datos[4]['campos'] = array('Codigo'=>'bid','Descripcion'=>'BID');
        $datos[5]['campos'] = array('Codigo'=>'ppr','Descripcion'=>'PPR');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
