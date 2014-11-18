<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadTipoContratacionData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'AD','Descripcion'=>'Adhonorem');
        $datos[2]['campos'] = array('Codigo'=>'CG','Descripcion'=>'Contrato GOES');
        $datos[3]['campos'] = array('Codigo'=>'DOI','Descripcion'=>'Destacados Otras instituciones');
        $datos[4]['campos'] = array('Codigo'=>'FP','Descripcion'=>'Fondos propios');
        $datos[5]['campos'] = array('Codigo'=>'LS','Descripcion'=>'Ley de Salarios');
        $datos[6]['campos'] = array('Codigo'=>'PRO','Descripcion'=>'Proyectos');
        $datos[7]['campos'] = array('Codigo'=>'TUR','Descripcion'=>'Turnos');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
