<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\CostosBundle\Entity\Campo;

class CampoRepository extends EntityRepository {

    public function getOrigenCampo(Campo $campo, $parametros) {
        $datos = array();
        if ($campo->getOrigen() !== null) {
            //Verificar si el origen ya está en json
            $esSql = preg_match("/^SELECT/i", $campo->getOrigen());
            $datos = array();
            if ($esSql) {
                $sql = $campo->getOrigen();                
                $sql = (array_key_exists('establecimiento', $parametros)) ? str_replace('{establecimiento}', $parametros['establecimiento'], $sql) : $sql;
                $q = $this->getEntityManager()->getConnection()->query($sql);
                $datos = $q->fetchAll();
            } else {
                $datos = json_decode($campo->getOrigen(), true);
            }            
        } else {           
            if ($campo->getSignificadoCampo()->getCatalogo() != ''){
                $sql = "SELECT codigo, descripcion FROM ".$campo->getSignificadoCampo()->getCatalogo();
                $q = $this->getEntityManager()->getConnection()->query( $sql );
                $datos = $q->fetchAll();
            }
        }
        $datos_ = array();
        foreach ($datos as $f) {
            $datos_[] = array('id' => array_shift($f), 'descripcion' => array_shift($f));
        }
        return json_encode($datos_);
    }
    
    public function getOrigenPivote(Campo $campo, $parametros) {
        if ($campo->getOrigenPivote() !== null) {
            //Verificar si el origen ya está en json
            $esSql = preg_match("/^SELECT/i", $campo->getOrigenPivote());
            $datos = array();
            if ($esSql) {
                $sql = $campo->getOrigenPivote();
                $sql = (array_key_exists('establecimiento', $parametros)) ? str_replace('{establecimiento}', $parametros['establecimiento'], $sql) : $sql;
                $q = $this->getEntityManager()->getConnection()->query($sql);
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
