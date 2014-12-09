<?php

namespace MINSAL\CostosBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\CostosBundle\DataFixtures\ORM\LoadMaster;

class LoadCategoriasContratosFijosGAData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Codigo'=>'alquileres','Descripcion'=>'Alquileres');
        $datos[2]['campos'] = array('Codigo'=>'servicios','Descripcion'=>'Servicios');
        $datos[3]['campos'] = array('Codigo'=>'Mantenimiento','Descripcion'=>'Mantenimiento');
        $datos[4]['campos'] = array('Codigo'=>'variables','Descripcion'=>'Variables');
        $datos[5]['campos'] = array('Codigo'=>'serv_gene_inst','Descripcion'=>'Servicios Generados por la institución');
 	
        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
