<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\CostosBundle\Entity\Formulario;
use Symfony\Component\HttpFoundation\Request;

/**
 * FormularioRepository
 *
 */
class FormularioRepository extends EntityRepository {

    public function getDatos(Formulario $Frm, Request $request) {
        $em = $this->getEntityManager();

        $params_string = $this->getParameterString($request->get('datos_frm'));
        $origenes = $this->getOrigenes($Frm->getOrigenDatos());
        $area = $Frm->getAreaCosteo();
        $sql = "
            SELECT datos
            FROM costos.fila_origen_dato_$area
            WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
                $params_string
            ;";

        try {
            return $em->getConnection()->executeQuery($sql)->fetchAll();
        } catch (\PDOException $e) {
            return $e->getMessage();
        }
    }

    private function getOrigenes($origen) {
        $origenes = array();
        if ($origen->getEsFusionado()) {
            foreach ($origen->getFusiones() as $of) {
                $origenes[] = $of->getId();
            }
        } else {
            $origenes[] = $origen->getId();
        }
        return $origenes;
    }

    private function getParameterString($parametros) {
        $params_string = '';
        if ($parametros != '') {
            $params = explode('&', $parametros);
            foreach ($params as $p) {
                $dato = explode('=', $p);
                if ($dato[1] != '' and $dato[0] != 'pk') {
                    $params_string .= " AND datos->'" . $dato[0] . "' = '" . $dato[1] . "' ";
                }
            }
        }
        return $params_string;
    }

    public function setDatos(Formulario $Frm, Request $request) {
        $em = $this->getEntityManager();

        $params_string = $this->getParameterString($request->get('datos_frm'));
        $origenes = $this->getOrigenes($Frm->getOrigenDatos());

        $datosObj = json_decode($request->get('fila'));
        $datos = str_replace(array('{', '}', ':'), array('', '', '=>'), $request->get('fila'));

        $params_string .= "AND datos->'" . $request->get('pk') . "' = '" . $datosObj->{$request->get('pk')} . "'";
        $area = $Frm->getAreaCosteo();
        $sql = "
            UPDATE costos.fila_origen_dato_$area
            SET datos = datos || '" . $datos . "'::hstore
            WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
                $params_string
            ;";

        try {
            $em->getConnection()->executeQuery($sql);
            return true;
        } catch (\PDOException $e) {
            return false;
        }
    }

    public function getDatosCosteo($codigo) {
        $em = $this->getEntityManager();
        if ($codigo == 'rrhhValorPagado') {
            $codigo_fuente_costos = 'rrhhValorPagado';
        }
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo' => $codigo_fuente_costos)));
/*
        $sql = 'DROP TABLE IF EXISTS temporales.' . $codigo_fuente_costos.'; '.
                ' CREATE TABLE temporales.' . $codigo_fuente_costos . '(';

        $origen = $Frm->getOrigenDatos();
        $diccionarios = array();
        if ($origen->getEsFusionado()) {
            $significados = explode(",", str_replace("'", '', $origen->getCamposFusionados()));
            //Los tipos de campos sacarlos de uno de los orígenes de datos que ha sido fusionado
            $fusionados = $origen->getFusiones();
            $fusionado = $fusionados[0];
            $tipos = array();
            foreach ($fusionado->getCampos() as $campo) {
                $tipos[$campo->getSignificado()->getCodigo()] = $campo->getTipoCampo()->getCodigo();
            }
            foreach ($significados as $campo) {
                $sql .= $campo . ' ' . $tipos[$campo] . ', ';
            }
            //$sql .= 'calculo numeric, ';
        } else {
            foreach ($origen->getCampos() as $campo) {
                $sql .= $campo->getSignificado()->getCodigo() . ' ' . $campo->getTipoCampo()->getCodigo() . ', ';
                if ($campo->getDiccionario() != null) {
                    $diccionarios[$campo->getSignificado()->getCodigo()] = $campo->getDiccionario()->getId();
                }
            }
        }
        $sql = trim($sql, ', ') . ');';

        // Si es fusionado recuperar los orígenes que están contenidos
        $origenes = array();
        if ($origen->getEsFusionado()){
            foreach ($origen->getFusiones() as $of){
                $origenes[] = $of->getId();
            }
        }
        else{
            $origenes[] = $origen->getId();
        }
        $sql .= "INSERT INTO temporales.$codigo_fuente_costos
                    SELECT (populate_record(null::temporales.$codigo_fuente_costos, datos)).*
                    FROM fila_origen_dato
                        WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
                    ;";
        $em->getConnection()->exec($sql);
        
        $sql = "
            SELECT *, (salario::numeric * 0.0675) as isss_patronal
            FROM temporales.$codigo_fuente_costos
            ;";

        try {
            return $em->getConnection()->executeQuery($sql)->fetchAll();                        
        } catch (\PDOException $e) {
            return $e->getMessage();
        }*/
        $origenes = $this->getOrigenes($Frm->getOrigenDatos());

        $sql = "
            SELECT datos,
            FROM fila_origen_dato
            WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
            ;";

        try {
            return $em->getConnection()->executeQuery($sql)->fetchAll();
        } catch (\PDOException $e) {
            return $e->getMessage();
        }
    }

}
