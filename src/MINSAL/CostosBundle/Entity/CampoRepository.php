<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\CostosBundle\Entity\Campo;

class CampoRepository extends EntityRepository {

    public function getOrigenCampo(Campo $campo) {
        if ($campo->getOrigen() !== null) {
            //Verificar si el origen ya está en json
            $esSql = preg_match("/^SELECT/i", $campo->getOrigen());
            $datos = array();
            if ($esSql) {
                $q = $this->getEntityManager()->getConnection()->query($campo->getOrigen());
                $datos = $q->fetchAll();
            } else {
                $datos = json_decode($campo->getOrigen(), true);
            }
            $datos_ = array();
            foreach ($datos as $f) {
                $datos_[] = array('id' => array_shift($f), 'descripcion' => array_shift($f));
            }

            return json_encode($datos_);
        }   
    }
    
    public function getOrigenPivote(Campo $campo) {
        if ($campo->getOrigenPivote() !== null) {
            //Verificar si el origen ya está en json
            $esSql = preg_match("/^SELECT/i", $campo->getOrigenPivote());
            $datos = array();
            if ($esSql) {
                $q = $this->getEntityManager()->getConnection()->query($campo->getOrigenPivote());
                $datos = $q->fetchAll();
            } else {
                $datos = json_decode($campo->getOrigenPivote(), true);
            }
            $datos_ = array();
            foreach ($datos as $f) {
                $datos_[] = array('id' => array_shift($f), 'descripcion' => array_shift($f));
            }

            return $datos_;
        }
        
        
    }

}
