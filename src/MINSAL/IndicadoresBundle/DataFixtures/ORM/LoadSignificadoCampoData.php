<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadSignificadoCampoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'genero','Descripcion'=>'Género');
        $datos[2]['campos'] = array('Codigo'=>'edad','Descripcion'=>'Edad');
        $datos[3]['campos'] = array('Codigo'=>'id_establecimiento','Descripcion'=>'Id Establecimiento');
        $datos[4]['campos'] = array('Codigo'=>'id_municipio','Descripcion'=>'Id Municipio');
        $datos[5]['campos'] = array('Codigo'=>'id_area','Descripcion'=>'Id Área');
        $datos[6]['campos'] = array('Codigo'=>'calculo','Descripcion'=>'Campo para cálculos');
        $datos[7]['campos'] = array('Codigo'=>'area','Descripcion'=>'Área');
        $datos[8]['campos'] = array('Codigo'=>'departamento','Descripcion'=>'Departamento');
        $datos[9]['campos'] = array('Codigo'=>'region','Descripcion'=>'Región');
        $datos[10]['campos'] = array('Codigo'=>'mes','Descripcion'=>'Mes');
        $datos[11]['campos'] = array('Codigo'=>'anio','Descripcion'=>'Año');
        $datos[12]['campos'] = array('Codigo'=>'municipio','Descripcion'=>'Municipio');
        
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}