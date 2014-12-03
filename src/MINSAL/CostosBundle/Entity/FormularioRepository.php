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
                if ($dato[0] == 'anio_mes'){
                    $campos = split('_', $dato[0]);
                    $valores = split('%2F', $dato[1]);
                    $params_string .= " AND (datos->'" . $campos[0] . "')::integer = '" . $valores[1] . "'::integer ";
                    $params_string .= " AND (datos->'" . $campos[1] . "')::integer = '" . $valores[0] . "'::integer ";
                }
                elseif ($dato[1] != '' and $dato[0] != 'pk') {
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
        $datos = str_replace(array('{', '}', ':', 'null'), array('', '', '=>', '""'), $request->get('fila'));
        
        //Cambiar formato de fecha
        $datos = preg_replace('/([0-9]{4})-([0-9]{2})-([0-9]{2})T[0-9]{2}=>[0-9]{2}=>[0-9]{2}.[0-9]{3}Z/', '${3}/${2}/${1}', $datos);

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
            // Mandar los datos actualizados, para que muestre en el grid
            // los campos calculados por el procedimiento de la base de datos
            $sql = "
            SELECT datos 
            FROM costos.fila_origen_dato_$area
            WHERE id_origen_dato IN (" . implode(',', $origenes) . ")
                $params_string
            ;";
            return $em->getConnection()->executeQuery($sql)->fetchAll();
            //return true;
        } catch (\PDOException $e) {
            return false;
        }
    }

    public function getDatosCosteo($codigo) {
        $em = $this->getEntityManager();
        $sql1 = '';
        $sql2 = '';
        if ($codigo == 'rrhh') {
            $codigo_fuente_costos = 'rrhh';
            $otros_campos = " datos->'isss_patronal' AS ". '"Aporte Patronal ISSS", '.
                    " datos->'fondo_proteccion_patronal' AS ". '"Aporte Patronal Fondo Protección", '.
                    " datos->'costo_con_aporte_y_aguinaldo' AS ". '"Costo con aporte y aguinaldo", '.
                    " datos->'costo_hora_aporte_aguinaldo' AS ". '"Costo Hora con aporte y aguinaldo", '.
                    " datos->'costo_hora_no_trab_CG' AS ". '"Costo hora no trabajada con goce", '.
                    " datos->'costo_hora_no_trab_SG' AS ". '"Costo hora no trabajada SIN goce", '.
                    " datos->'salario_descuentos_permisos' AS ". '"Salario con descuentos y permisos", '.
                    " datos->'costo_hora_descuentos_permisos' AS ". '"Costo Hora con descuentos y permisos", '.
                    " datos->'dependencia' AS ". '"codigo_dependencia" '
                    ;
            
            $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo' => 'rrhhValorPagado')));
        
            $campos = '';
            foreach ($Frm->getCampos() as $c){
                if ($c->getOrigenPivote() == ''){
                    $campos .= "datos->'".$c->getSignificadoCampo()->getCodigo(). "' AS ". '"'. $c->getSignificadoCampo()->getDescripcion().'", ';
                }
            }
        } elseif ($codigo == 'rrhh_resumen') {
            $codigo_fuente_costos = 'rrhh';
            
            $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo' => 'rrhhDistribucionHora')));
            $Frm2 = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo' => 'rrhhValorPagado')));
            
            $campos = '';
            $campos2 = '';
            foreach($Frm2->getCampos() as $c){
                if ($c->getOrigenPivote() == '' and ($c->getTipoDato()->getCodigo() == 'string' or $c->getTipoDato()->getCodigo() == 'bool') ){
                    $campos .= "datos->'".$c->getSignificadoCampo()->getCodigo(). "' AS ". '"'. $c->getSignificadoCampo()->getDescripcion().'", ';
                    $campos2 .= '"'.$c->getSignificadoCampo()->getDescripcion().'", ';
                }
            }           
            $campos .= " datos->'costo_hora_descuentos_permisos' AS costo_hora_recurso, ".
                        " datos->'dependencia' AS codigo_dependencia, ";
            $campos2 .= 'costo_hora_recurso, codigo_dependencia, ';
            $pivotes = array();
            foreach($Frm->getCampos() as $c){
                if ($c->getOrigenPivote()){
                    $pivotes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c);
                }
            }
            $otros_campos = '';
            $nombre_pivote = array_pop(array_keys($pivotes));
            
            $piv1 = '';
            $piv2 = '';
            foreach (array_pop($pivotes) as $p){
                $cod = array_shift($p);
                $otros_campos .= "datos->'".$nombre_pivote."_". $cod."' AS ".'"'.strtolower($cod).'"'.", ";
                $piv1 .= "'".$cod."', ";
                $piv2 .= strtolower($cod).", ";
            }
            $piv1 = trim($piv1, ', ');
            $piv2 = trim($piv2, ', ');
            $sql1 = "SELECT *,  ((COALESCE(NULLIF(costo_hora_recurso,''),'0'))::numeric * (COALESCE(NULLIF(horas_centro,''),'0'))::numeric) AS CostoCentro "
                    . 'FROM (SELECT '.$campos2.' unnest(array['.$piv1.']) AS CentroCostos, '
                    . 'unnest(array['.$piv2.']) AS horas_centro FROM ( ';
            $sql2 = ') as A) AS B';
            $otros_campos = trim ($otros_campos, ', ');                        
            
        }
        
        
        $campos .= $otros_campos;
        
        $origenes = $this->getOrigenes($Frm->getOrigenDatos());

        $sql = $sql1 . " 
            SELECT $campos
            FROM costos.fila_origen_dato_".$codigo_fuente_costos.
            " WHERE id_origen_dato IN (" . implode(",", $origenes) . ")
            " . $sql2 ;
        // Leer desde la tabla temporal para poder establecer relaciones con otras tablas        
        $sql_resp = 'SELECT A.*, B.nombre AS  "Nombre dependencia", C.nombre AS "Establecimiento", C.codigo AS codigo_establecimiento
                FROM ('. $sql . ' ) AS A
                    INNER JOIN costos.estructura B ON (A.codigo_dependencia = B.codigo)
                    INNER JOIN costos.estructura C ON (substr(A.codigo_dependencia,1,2) = C.codigo)
                    ' ;
        
        try {
             $em->getConnection()->executeQuery($sql);
            return $em->getConnection()->executeQuery($sql_resp)->fetchAll();
        } catch (\PDOException $e) {
            return $e->getMessage();
        }
    }

}
