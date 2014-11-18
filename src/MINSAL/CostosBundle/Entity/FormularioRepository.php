<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\CostosBundle\Entity\Formulario;
use Symfony\Component\HttpFoundation\Request;

/**
 * FormularioRepository
 *
 */
class FormularioRepository extends EntityRepository
{
    public function getDatos(Formulario $Frm, Request $request) {
        $origen = $Frm->getOrigenDatos();
        $em = $this->getEntityManager();
        
        $params_string = '';
        if ($request->get('datos_frm') != ''){
            $params = explode('&', $request->get('datos_frm'));
            foreach ($params as $p){
                $dato = explode('=', $p);
                if ($dato[1] != '') {
                    $params_string .= " AND datos->'".$dato[0] . "' = '". $dato[1] . "' ";
                }
            }
        }
        $origenes = array();
        if ($origen->getEsFusionado()){
            foreach ($origen->getFusiones() as $of){
                $origenes[] = $of->getId();
            }
        } else {
            $origenes[] = $origen->getId();
        }
        $sql = "
            SELECT datos
            FROM fila_origen_dato
            WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
                $params_string
            ;";            

        try {
            return $em->getConnection()->executeQuery($sql)->fetchAll();
        } catch (\PDOException $e) {
            return $e->getMessage();
        }
    }    
}
