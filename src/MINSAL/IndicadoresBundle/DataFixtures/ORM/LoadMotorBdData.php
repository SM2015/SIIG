<?php

namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;

use MINSAL\IndicadoresBundle\DataFixtures\ORM\LoadMaster;

class LoadMotorBdData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $datos = array();
        $datos[1]['campos'] = array('Nombre'=>'MySQL', 'Codigo'=>'pdo_mysql');
        $datos[2]['campos'] = array('Nombre'=>'PostgreSQL', 'Codigo'=>'pdo_pgsql');
        $datos[3]['campos'] = array('Nombre'=>'SQLite', 'Codigo'=>'pdo_sqlite');
        $datos[4]['campos'] = array('Nombre'=>'SQL Server', 'Codigo'=>'pdo_dblib');
        $datos[5]['campos'] = array('Nombre'=>'Oracle', 'Codigo'=>'oci8');

        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
