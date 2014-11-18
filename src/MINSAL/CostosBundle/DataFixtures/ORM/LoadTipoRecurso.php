<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoRecursoData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'AUX','Descripcion'=>'Auxiliar de Enfermería');
        $datos[2]['campos'] = array('Codigo'=>'ENF','Descripcion'=>'Enfermera');
        $datos[3]['campos'] = array('Codigo'=>'MD','Descripcion'=>'Médico');
        $datos[4]['campos'] = array('Codigo'=>'OP','Descripcion'=>'Otros Profesionales');
        $datos[5]['campos'] = array('Codigo'=>'PI','Descripcion'=>'Practicantes Internos');
        $datos[6]['campos'] = array('Codigo'=>'RES','Descripcion'=>'Residentes');
        $datos[7]['campos'] = array('Codigo'=>'SG','Descripcion'=>'Servicios Generales');
        $datos[8]['campos'] = array('Codigo'=>'TA','Descripcion'=>'Técnico Administrativo');
        $datos[9]['campos'] = array('Codigo'=>'TC','Descripcion'=>'Técnico Calificado');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
