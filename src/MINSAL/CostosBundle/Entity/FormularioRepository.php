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

    private $parametros = array();
    public function getDatos(Formulario $Frm, Request $request) {
        $em = $this->getEntityManager();
        $area = $Frm->getAreaCosteo();

        $parametros = $request->get('datos_frm');
        
        $params_string = $this->getParameterString($parametros);
        if ($area != 'ga_variables' and $area != 'ga_compromisosFinancieros' and 
                $area != 'ga_distribucion' and $area != 'ga_costos'){
            $origenes = $this->getOrigenes($Frm->getOrigenDatos());
        }
        $campo = 'id_origen_dato';
        if ($area == 'ga_variables' or $area == 'ga_distribucion'){
            $origenes = array($Frm->getId());
            $campo = 'id_formulario';
            $area = 'ga';
            
            //Cargar las dependencias que no estén en el mes y año elegido
            $sql = "INSERT INTO costos.fila_origen_dato_".strtolower($area)."(id_formulario, area_costeo, datos)
                    (SELECT ".$Frm->getId()." AS id_formulario, '".$Frm->getAreaCosteo()."' AS area_costeo, hstore(ARRAY['dependencia', 'mes', 'anio', 'establecimiento'], 
                            ARRAY[codigo , '".$this->parametros['mes']."', '".$this->parametros['anio']."', '".$this->parametros['establecimiento']."']) 
                        FROM costos.estructura
                        WHERE parent_id 
                            IN
                            (SELECT A.id FROM costos.estructura A
                                INNER JOIN costos.estructura B ON (A.parent_id = B.id )
                                WHERE B.codigo = '".$this->parametros['establecimiento']."'
                            )
                            AND (".$Frm->getId(). ", codigo, '".$this->parametros['mes']."', '".$this->parametros['anio']."', '".$this->parametros['establecimiento']."' )
                                NOT IN 
                                (SELECT id_formulario, datos->'dependencia', datos->'mes', datos->'anio', datos->'establecimiento'
                                    FROM costos.fila_origen_dato_ga 
                                    WHERE id_formulario = ".$Frm->getId()."
                                        AND datos->'establecimiento' = '".$this->parametros['establecimiento']."'
                                        AND datos->'anio' = '".$this->parametros['anio']."'
                                        AND datos->'mes' = '".$this->parametros['mes']."'
                                )                            
                    )";
            $em->getConnection()->executeQuery($sql);
        }
        
        if ($area == 'ga_compromisosFinancieros'){
            $origenes = array($Frm->getId());
            $campo = 'id_formulario';
            $area = 'ga';
                                    
            //Cargar los contratos que no están en el año elegido
            $sql = "INSERT INTO costos.fila_origen_dato_".strtolower($area)."(id_formulario, area_costeo, datos)
                    (SELECT ".$Frm->getId()." AS id_formulario, '".$Frm->getAreaCosteo()."' AS area_costeo, 
                            hstore(
                                ARRAY['codigo_contrato', 'anio', 'establecimiento', 'descripcion_contrato',
                                        'criterio_distribucion', 'categoria_contrato'], 
                                ARRAY[A.codigo , '".$this->parametros['anio']."', '".$this->parametros['establecimiento']."', A.descripcion,
                                    B.descripcion, C.descripcion]
                            ) 
                        FROM costos.contratos_fijos_ga A 
                            INNER JOIN costos.criterios_distribucion_ga B ON (A.criteriodistribucion_id = B.id) 
                            INNER JOIN costos.categorias_contratos_fijos_ga C ON (A.categoria_id = C.id) 
                            INNER JOIN estructura_contratosfijosga D ON (A.id = D.contratosfijosga_id) 
                            INNER JOIN costos.estructura E ON (D.estructura_id = E.id)
                        WHERE E.codigo = '".$this->parametros['establecimiento']."'
                            AND (".$Frm->getId(). ", '".$Frm->getAreaCosteo(). "', A.codigo, '".$this->parametros['anio']."', '".$this->parametros['establecimiento']."' )
                                NOT IN 
                                (SELECT id_formulario, area_costeo, datos->'codigo_contrato', datos->'anio', datos->'establecimiento'
                                    FROM costos.fila_origen_dato_ga 
                                    WHERE id_formulario = ".$Frm->getId()."
                                        AND datos->'establecimiento' = '".$this->parametros['establecimiento']."'
                                        AND datos->'anio' = '".$this->parametros['anio']."'
                                )                            
                    )";
            $em->getConnection()->executeQuery($sql);
        }
        
        if ($area == 'ga_costos' ){
            $area = 'ga';
            $origenes = array($Frm->getId());
            $campo = 'id_formulario';
            list($mes, $anio) = explode('/',$request->get('anio_mes'));
            $this->parametros = array('anio'=>$anio, 'mes'=>$mes, 'establecimiento'=>$request->get('establecimiento'));
            
            //Recuperar las variables de los gastos administrativos
            $FrmVar = $em->getRepository('CostosBundle:Formulario')->findOneBy(array('codigo'=>'gaVariables'));
            // Agregar acá las variables de los elevadores, porque daría error si ninguna dependencia tiene alguno de estos elevadores
            // Así se pondrán en null y no dará error por no existir los campos
            $campos_gaVar = "datos->'elevadores_personas' AS elevadores_personas, datos->'elevadores_verdes' AS elevadores_verdes,
                                datos->'elevadores_quemados' AS elevadores_quemados, ";
            $campos_gaVar = "";
            $campos_gaVar2 = " B.elevadores_personas, B.elevadores_verdes, B.elevadores_quemados, ";
            $campos_gaVar2 = "";
            foreach($FrmVar->getCampos() as $c){
                if ($c->getOrigenPivote() == ''){
                    $codigo = $c->getSignificadoCampo()->getCodigo();
                    //if (!in_array($codigo, array('elevadores_personas', 'elevadores_verdes', 'elevadores_quemados')))
                        $campos_gaVar .= "datos->'".$codigo. "' AS ". $codigo.', ';
                    
                    if (!in_array($codigo, array('dependencia')))
                        $campos_gaVar2 .= 'B.'.$codigo.', ';
                }
            }
            $campos_gaVar = trim ($campos_gaVar, ', ');
            $campos_gaVar2 = trim ($campos_gaVar2, ', ');
            
            
            $campos = "datos->'establecimiento' AS establecimiento, datos->'anio' AS anio, 
                        datos->'mes' AS mes, datos->'dependencia' AS dependencia, ";
            
            $pivotes = array();
            
            foreach($Frm->getCampos() as $c){
                if ($c->getOrigenPivote()){
                    $pivotes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c, $this->parametros);
                }
            }
            
            $otros_campos = '';            
            $piv1 = '';
            $piv2 = '';
            
            foreach ($pivotes as $nombre_pivote=>$p){
                foreach ($p as $piv){
                    $cod = array_shift($piv);
                    $otros_campos .= "datos->'".$nombre_pivote."_". $cod."' AS ".'"'.strtolower($cod).'"'.", ";
                    $piv1 .= "'".$cod."', ";
                    $piv2 .= strtolower($cod).", ";
                }
            }

            $piv1 = trim($piv1, ', ');
            $piv2 = trim($piv2, ', ');
            $otros_campos = trim($otros_campos, ', ');
            
            $campos .=  $otros_campos;
            $campos = trim($campos, ', ');
            
            
            /**************************************************************
             * Agregar todos los gastos que se han puesto en el formulario 
             * de distribución de compromisos
            ****************************************************************/
            $sql = "SELECT B.*, B1.codigo AS criterio_distribucion "
                    . "INTO TEMP ini_gastos_administrativos_tmp "
                    . 'FROM (SELECT establecimiento, dependencia, anio, mes, unnest(array['.$piv1.']) AS codigo_compromiso, '
                                    . 'unnest(array['.$piv2.']) AS consumo_dependencia 
                                FROM 
                                    ( '.
                                        "SELECT $campos
                                            FROM costos.fila_origen_dato_".strtolower($area)." 
                                            WHERE $campo IN (" . implode(',', $origenes) . ")
                                                $params_string
                                    ) as A
                            ) AS B 
                                INNER JOIN costos.contratos_fijos_ga A1 ON (B.codigo_compromiso = A1.codigo)
                                INNER JOIN costos.criterios_distribucion_ga B1 ON (A1.criteriodistribucion_id = B1.id)
                    ";
            
            $em->getConnection()->executeQuery($sql);
            
            
            /**************************************************************
             * Agregar otros compromisos que no están en el formulario 
             * de distribución de compromisos
             * y no fueron agregadas por la consulta sql anterior
            *****************************************************************/
            $sql = "INSERT INTO ini_gastos_administrativos_tmp 
                        SELECT  D.establecimiento, D.dependencia, 
                            '".$this->parametros['anio']."' AS anio , 
                            '".$this->parametros['mes']."' AS mes, 
                            A.codigo AS codigo_compromiso, '0' AS consumo_dependencia,
                            E.codigo AS criterio_distribucion 
                        FROM costos.contratos_fijos_ga A 
                            INNER JOIN estructura_contratosfijosga B ON (A.id = B.contratosfijosga_id) 
                            INNER JOIN costos.estructura C ON (B.estructura_id = C.id) 
                            INNER JOIN (
                                SELECT A.codigo AS dependencia, C.codigo AS establecimiento 
                                    FROM costos.estructura A  
                                    INNER JOIN costos.estructura B ON (A.parent_id = B.id) 
                                    INNER JOIN costos.estructura C ON (B.parent_id = C.id) 
                            ) AS D ON (C.codigo = D.establecimiento) 
                            INNER JOIN costos.criterios_distribucion_ga E ON (A.criteriodistribucion_id = E.id) 
                        WHERE (D.establecimiento, D.dependencia, '".$this->parametros['anio']."' , '".$this->parametros['mes']."' , A.codigo)
                            NOT IN (SELECT establecimiento, dependencia, anio, mes, codigo_compromiso FROM ini_gastos_administrativos_tmp)
                     ";
            $em->getConnection()->executeQuery($sql);
            
            
            /**************************************************************
             * El monto de cada compromiso mensual del establecimiento
            *****************************************************************/
            $sqlMontoCompromiso = "
                ( SELECT SUM(importe::numeric) 
                    FROM 
                        -- **************************************************************** 
                        -- * Compromisos financieros por cada mes
                        -- *****************************************************************
                        (SELECT establecimiento, anio, codigo_contrato, 
                            unnest(array['m01', 'm02', 'm03', 'm04', 'm05', 'm06', 'm07', 'm08', 'm08', 'm10', 'm11', 'm12']) as mes,
                            unnest(array[m01, m02, m03, m04, m05, m06, m07, m08, m08, m10, m11, m12]) as importe                                        
                            FROM 
                                (SELECT datos->'establecimiento' AS establecimiento, datos->'anio' AS anio, 
                                            datos->'codigo_contrato' AS codigo_contrato, 
                                            datos->'importe_mensual_01' as ".'"m01"'. ", datos->'importe_mensual_02' as ".'"m02",'.
                                            "datos->'importe_mensual_03' as ".'"m03"'. " , datos->'importe_mensual_04' as ". '"m04", '.
                                            "datos->'importe_mensual_05' as ".'"m05"'. " , datos->'importe_mensual_06' as ". '"m06", '.
                                            "datos->'importe_mensual_07' as ".'"m07"'. " , datos->'importe_mensual_08' as ". '"m08", '.
                                            "datos->'importe_mensual_09' as ".'"m09"'. " , datos->'importe_mensual_11' as ". '"m10", '.
                                            "datos->'importe_mensual_11' as ".'"m11"'. " , datos->'importe_mensual_12' as ". '"m12" '.
                                        "FROM costos.fila_origen_dato_ga 
                                        WHERE datos->'establecimiento' = A.establecimiento
                                            AND datos->'anio' = A.anio
                                            AND datos->'codigo_contrato' = A.codigo_compromiso
                                ) AS SS
                        ) AS AA
                    WHERE establecimiento = A.establecimiento
                        AND anio = A.anio
                        AND codigo_contrato = A.codigo_compromiso
                        AND mes = 'm'||A.mes
                ) AS compromiso
                     ";
            
            /**************************************************************
             * Agregar todas las variables del establecimiento 
             * (Las que se capturan en el formulario gaVariables)
            *****************************************************************/
            $sql = " SELECT A.*, $campos_gaVar2, $sqlMontoCompromiso
                        INTO  TEMP gastos_administrativos_tmp
                        FROM ini_gastos_administrativos_tmp A
                            LEFT JOIN (SELECT datos->'establecimiento' AS establecimiento, datos->'anio' AS anio, datos->'mes' as mes,
                                            $campos_gaVar                                
                                            FROM costos.fila_origen_dato_ga
                                            WHERE area_costeo = 'ga_variables'
                                        ) AS B ON (A.establecimiento = B.establecimiento AND A.anio = B.anio 
                                            AND A.mes = B.mes AND A.dependencia = B.dependencia)
                     ";
            $em->getConnection()->executeQuery($sql);
            
            
            /**************************************************************
             * Se agregan los cálculos para ciertos compromisos
            *****************************************************************/
            $sql = "
                    SELECT *,
                            CASE 
                                -- **************************************************************** 
                                -- * DEL CONSUMO DEL AGUA
                                -- *****************************************************************
                                WHEN (codigo_compromiso = 'h2o' AND tot_personal::numeric = 0 AND prom_usuarios_dia::numeric = 0) THEN 0
                                WHEN (codigo_compromiso = 'h2o' AND (tipo_centro::numeric = 5 OR tipo_centro::numeric = 6)) 
                                    THEN (cant_camas::numeric * 0.18) + (tot_personal::numeric *0.06) + (prom_usuarios_dia::numeric * 0.03) + (area_tot::numeric * 0.006)
                                WHEN (codigo_compromiso = 'h2o' AND tipo_centro::numeric <> 5 AND tipo_centro::numeric <> 6) 
                                    THEN (tot_personal::numeric * 0.06) + (prom_usuarios_dia::numeric * 0.03) + (area_tot::numeric * 0.006 / 3)                                
                        
                                -- **************************************************************** 
                                -- * Cuando es criterio de distribución es dependencia (ubicación) 
                                -- * como los elevadores 
                                -- *****************************************************************
                                WHEN (criterio_distribucion = 'dependencia' 
                                            AND (SELECT COUNT(datos->'area_tot')  
                                                                FROM costos.fila_origen_dato_ga 
                                                                WHERE area_costeo = 'ga_variables' 
                                                                    AND datos->'establecimiento' = A.establecimiento 
                                                                    AND datos->'dependencia' = A.dependencia 
                                                                    AND datos->'mes' = A.mes 
                                                                    AND datos->'anio' = A.anio 
                                                                    AND datos->A.codigo_compromiso = 'true'
                                                            )::numeric > 0
                                        ) THEN
                                            (area_tot::numeric) / (SELECT SUM((datos->'area_tot')::numeric)  
                                                                FROM costos.fila_origen_dato_ga 
                                                                WHERE area_costeo = 'ga_variables' 
                                                                    AND datos->'establecimiento' = A.establecimiento 
                                                                    AND datos->'mes' = A.mes 
                                                                    AND datos->'anio' = A.anio 
                                                                    AND datos->A.codigo_compromiso = 'true'
                                                            )::numeric                                
                                ";
                      $sql .= " 
                                ELSE
                                    consumo_dependencia::numeric
                            END AS consumo_dependencia_final
                        INTO TEMP ga_tmp 
                        FROM 
                            (SELECT A.*,
                                -- El area de todo el establecimiento
                                (SELECT SUM(area_tot::numeric)
                                    FROM (SELECT datos->'area_tot' AS area_tot
                                        FROM costos.fila_origen_dato_ga
                                        WHERE area_costeo = 'ga_variables'
                                            AND datos->'establecimiento' = A.establecimiento
                                            AND datos->'anio' = A.anio
                                            AND datos->'mes' = A.mes
                                        ) AS CC
                                )  AS area_tot_establecimiento
                                
                            FROM gastos_administrativos_tmp A
                    ) AS A                                        
                    ";
            $em->getConnection()->executeQuery($sql);
            $em->getConnection()->executeQuery('UPDATE ga_tmp SET consumo_dependencia = consumo_dependencia_final ');
            
            /**********************************************************
             * Se hace la distribución del compromiso financiero 
             * del establecimiento 
             * de acuerdo el consumo de cada dependencia
             **********************************************************/
            $sql = "SELECT *, CASE 
                                WHEN (criterio_distribucion = 'consumo' OR criterio_distribucion = 'asignacion_directa' 
                                    OR criterio_distribucion = 'personas' OR criterio_distribucion = 'dependencia') 
                                    THEN compromiso::numeric * consumo_dependencia::numeric / consumo_establecimiento::numeric
                                WHEN criterio_distribucion = 'area_mt2' THEN compromiso::numeric * area_tot::numeric / area_tot_establecimiento::numeric
                            END AS total_gasto
                    FROM (SELECT A.*,
                                B.nombre AS nombre_dependencia, C.descripcion AS nombre_criterio_distribucion, D.descripcion AS nombre_compromiso,
                                (SELECT SUM(consumo_dependencia::numeric) 
                                    FROM ga_tmp 
                                    WHERE establecimiento = A.establecimiento
                                        AND anio = A.anio
                                        AND mes = A.mes
                                        AND codigo_compromiso = A.codigo_compromiso
                                ) AS consumo_establecimiento
                            FROM ga_tmp A
                               INNER JOIN costos.estructura B ON (A.dependencia = B.codigo)
                               INNER JOIN costos.criterios_distribucion_ga C ON (A.criterio_distribucion = C.codigo)
                               INNER JOIN costos.contratos_fijos_ga D ON (A.codigo_compromiso = D.codigo)
                        ) AS A
                    ORDER BY A.establecimiento, A.dependencia, A.anio, A.mes, A.criterio_distribucion, A.codigo_compromiso";
            
        }
        else{ 
            $sql = "
            SELECT datos
            FROM costos.fila_origen_dato_".strtolower($area)." 
            WHERE $campo IN (" . implode(',', $origenes) . ")
                $params_string
            ;";
        }
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
                    $campos = explode('_', $dato[0]);
                    if ($dato[1] != ''){
                        $valores = explode('%2F', $dato[1]);
                        $params_string .= " AND (datos->'" . $campos[0] . "')::integer = '" . $valores[1] . "'::integer ";
                        $params_string .= " AND (datos->'" . $campos[1] . "')::integer = '" . $valores[0] . "'::integer ";
                        $this->parametros['mes'] = $valores[0];
                        $this->parametros['anio'] = $valores[1];
                    }else {
                        $params_string .= " AND (datos->'anio')::integer = '-222'::integer ";
                    }
                }
                elseif ($dato[1] != '' and $dato[0] != 'pk') {
                    $params_string .= " AND datos->'" . $dato[0] . "' = '" . $dato[1] . "' ";
                    $this->parametros[$dato[0]] = $dato[1];
                }
            }
        }
        return $params_string;
    }

    public function setDatos(Formulario $Frm, Request $request) {
        $em = $this->getEntityManager();

        $params_string = $this->getParameterString($request->get('datos_frm'));
        $area = $Frm->getAreaCosteo();
        
        if ($area != 'ga_variables' and $area != 'ga_compromisosFinancieros' and $area != 'ga_distribucion'){
            $origenes = $this->getOrigenes($Frm->getOrigenDatos());
            $campo = 'id_origen_dato';
        } else {
            $origenes = array($Frm->getId());
            $campo = 'id_formulario';
            $area = 'ga';
        }

        $datosObj = json_decode($request->get('fila'));        
        $datos = str_replace(array('{', '}', ':', 'null'), array('', '', '=>', '""'), $request->get('fila'));
        
        //Cambiar formato de fecha
        $datos = preg_replace('/([0-9]{4})-([0-9]{2})-([0-9]{2})T[0-9]{2}=>[0-9]{2}=>[0-9]{2}.[0-9]{3}Z/', '${3}/${2}/${1}', $datos);

        $params_string .= "AND datos->'" . $request->get('pk') . "' = '" . $datosObj->{$request->get('pk')} . "'";
        
        $sql = "
            UPDATE costos.fila_origen_dato_".strtolower($area)."
            SET datos = datos || '" . $datos . "'::hstore
            WHERE $campo IN (" . implode(',', $origenes) . ")
                $params_string
            ;";

        try {
            $em->getConnection()->executeQuery($sql);
            // Mandar los datos actualizados, para que muestre en el grid
            // los campos calculados por el procedimiento de la base de datos
            $sql = "
            SELECT datos 
            FROM costos.fila_origen_dato_$area
            WHERE $campo IN (" . implode(',', $origenes) . ")
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