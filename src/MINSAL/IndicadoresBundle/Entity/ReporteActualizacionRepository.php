<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\ReporteActualizacion;

class ReporteActualizacionRepository extends EntityRepository {

    public function getUltimaActualizacion($idOrigenDatos)
    {
        $em = $this->getEntityManager();

        $result = $em->getConnection()->executeQuery('SELECT MAX(fecha) AS ultima_actualizacion FROM reporte_actualizacion WHERE '.
                                       'id_origen_datos='.$idOrigenDatos.' AND id_estatus_act=1')->fetch();

        if($result['ultima_actualizacion'] == '')
            return null;
        else
            return new \DateTime($result['ultima_actualizacion']);
    }

}
