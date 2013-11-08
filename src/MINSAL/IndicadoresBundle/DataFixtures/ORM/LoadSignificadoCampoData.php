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
        $datos[3]['campos'] = array('Codigo'=>'establecimiento','Descripcion'=>'Establecimiento');
        $datos[4]['campos'] = array('Codigo'=>'municipio','Descripcion'=>'Municipio');
        $datos[5]['campos'] = array('Codigo'=>'area','Descripcion'=>'Área');
        $datos[6]['campos'] = array('Codigo'=>'calculo','Descripcion'=>'Campo para cálculos');
        $datos[7]['campos'] = array('Codigo'=>'departamento','Descripcion'=>'Departamento');
        $datos[8]['campos'] = array('Codigo'=>'region','Descripcion'=>'Región');
        $datos[9]['campos'] = array('Codigo'=>'mes','Descripcion'=>'Mes');
        $datos[10]['campos'] = array('Codigo'=>'anio','Descripcion'=>'Año');
        $datos[11]['campos'] = array('Codigo'=>'sibasi','Descripcion'=>'Sibasi');
        $datos[12]['campos'] = array('Codigo'=>'origen_dato','Descripcion'=>'Origen Dato');

        $datos[13]['campos'] = array('Codigo'=>'id_genero','Descripcion'=>'Identificador género');
        $datos[14]['campos'] = array('Codigo'=>'id_establecimiento','Descripcion'=>'Identificador establecimiento');
        $datos[15]['campos'] = array('Codigo'=>'id_municipio','Descripcion'=>'Identificador municipio');
        $datos[16]['campos'] = array('Codigo'=>'id_area','Descripcion'=>'Identificador Área');
        $datos[17]['campos'] = array('Codigo'=>'id_departamento','Descripcion'=>'Identificador departamento');
        $datos[18]['campos'] = array('Codigo'=>'id_region','Descripcion'=>'Identificador región');
        $datos[19]['campos'] = array('Codigo'=>'id_mes','Descripcion'=>'Identificador mes');

        $datos[20]['campos'] = array('Codigo'=>'pk','Descripcion'=>'Clave primaria', 'UsoEnCatalogo'=>true);
        $datos[21]['campos'] = array('Codigo'=>'fk','Descripcion'=>'Clave foránea', 'UsoEnCatalogo'=>true);
        $datos[23]['campos'] = array('Codigo'=>'descripcion','Descripcion'=>'Descripción', 'UsoEnCatalogo'=>true);
        $datos[24]['campos'] = array('Codigo'=>'otro','Descripcion'=>'Otro significado', 'UsoEnCatalogo'=>true);

        $datos[25]['campos'] = array('Codigo'=>'id_estado','Descripcion'=>'Identificador Estado');
        $datos[26]['campos'] = array('Codigo'=>'id_institucion','Descripcion'=>'Identificador Institucion');
        $datos[27]['campos'] = array('Codigo'=>'id_jurisdiccion','Descripcion'=>'Identificador Jurisdiccion');


        $master = new LoadMaster();
        $master->save($datos, $manager, $this);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
