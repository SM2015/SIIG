<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadSignificadoVariableData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'genero','Descripcion'=>'Género');
        $datos[2]['campos'] = array('Codigo'=>'edad','Descripcion'=>'Edad');
        $datos[3]['campos'] = array('Codigo'=>'id_establecimiento','Descripcion'=>'Id Establecimiento');
        $datos[4]['campos'] = array('Codigo'=>'id_municipio','Descripcion'=>'Id Municipio');
        $datos[4]['campos'] = array('Codigo'=>'id_area','Descripcion'=>'Id Área');
        
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}