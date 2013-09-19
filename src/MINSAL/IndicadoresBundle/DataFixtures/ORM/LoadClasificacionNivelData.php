<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadClasificacionNivelData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'eco','Descripcion'=>'ECOS');
        $datos[2]['campos'] = array('Codigo'=>'municipio','Descripcion'=>'Municipio');
        $datos[3]['campos'] = array('Codigo'=>'sibasi','Descripcion'=>'SIBASI');
        $datos[4]['campos'] = array('Codigo'=>'region','Descripcion'=>'Región');
        $datos[5]['campos'] = array('Codigo'=>'nacional','Descripcion'=>'Nacional');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
