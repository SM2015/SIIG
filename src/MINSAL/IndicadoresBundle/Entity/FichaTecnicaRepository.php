<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

class FichaTecnicaRepository extends EntityRepository {

    public function crearTablaIndicador(FichaTecnica $fichaTecnica, $dimension, $duracion = 10, $filtros = null) {
        
        $em = $this->getEntityManager();
        $ahora = new \DateTime("now");
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        
        //Verificar si existe la tabla
        $existe = true;
        $acumulado = $fichaTecnica->getEsAcumulado();
        try{
            $em->getConnection()->query("select count(*) from tmp_ind_$nombre_indicador");
        }  catch (\Doctrine\DBAL\DBALException $e){
            $existe = false;
        }
        if ($fichaTecnica->getUpdatedAt() != '' and $fichaTecnica->getUltimaLectura() !='' and $existe==true and $acumulado==false){
            if ($fichaTecnica->getUltimaLectura() < $fichaTecnica->getUpdatedAt())
                return true;
        }
        
        
        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());
        
        $tablas_variables = array();
        $sql = 'DROP TABLE IF EXISTS tmp_ind_' . $nombre_indicador . '; ';
        // Crear las tablas para cada variable
        foreach ($fichaTecnica->getVariables() as $variable) {
            //Recuperar la información de los campos para crear la tabla
            $tabla = strtolower($variable->getIniciales());                        
            $sql .= 'CREATE TEMP TABLE IF NOT EXISTS ' . $tabla . '(';
            foreach ($variable->getOrigenDatos()->getCampos() as $campo) {
                $sql .= $campo->getSignificado()->getCodigo() . ' ' . 'varchar(200)' . ', ';
            }
            $sql = trim($sql, ', ') . ');';

            //Llenar la tabla con los valores del hstore
            $sql .= "INSERT INTO $tabla
                SELECT (populate_record(null::$tabla, datos)).*                 
                FROM fila_origen_dato 
                WHERE id_origen_dato = " . $variable->getOrigenDatos()->getId() . '
                    ;';

            //Obtener solo los datos que se pueden procesar en el indicador
            $sql .= "SELECT  $campos, SUM(calculo::numeric) AS ".$tabla."
                INTO TEMP  $tabla" . "_var
                FROM $tabla                 
                GROUP BY $campos 
                HAVING  SUM(calculo::numeric) > 0
                    ;";
            $tablas_variables[] = $tabla;
        }        
        $formula = $fichaTecnica->getFormula();
        $denominador = explode('/', $formula);
        $evitar_div_0 = '';
        if (count($denominador) > 1){
            preg_match('/\{.{1,}\}/', $denominador[1], $variables_d);
            if (count($variables_d) > 0)
                $var_d = strtolower(str_replace(array('{','}'),array('',''),array_shift($variables_d)));
            $evitar_div_0 = ' WHERE '.$var_d. ' is not null';
        }        
                
        if ($acumulado != true){                   
            $sql .= 'SELECT  '.$campos.','.  implode(',', $tablas_variables).
                " INTO tmp_ind_".$nombre_indicador." FROM  ".array_shift($tablas_variables).'_var ';
            foreach ($tablas_variables as $tabla){
                $sql .= " FULL OUTER JOIN ".$tabla."_var USING ($campos) " . $evitar_div_0;
            }
        }
        try{
            $em->getConnection()->exec($sql);                        
            if ($acumulado==true)
                $this->crearTablaIndicadorAcumulado($fichaTecnica, $dimension, $filtros);            
            $fichaTecnica->setUpdatedAt($ahora);
            $em->persist($fichaTecnica);
            $em->flush();
        }  catch (\PDOException $e){
            return $e->getMessage();
        }        
    }
    
    public function crearTablaIndicadorAcumulado(FichaTecnica $fichaTecnica, $dimension, $filtros= null){
        $em = $this->getEntityManager();
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());
        $tablas_variables = array();                
        
        //Cambiar el orden de los campos, los filtros y la dimensión que se esté usando debe estar primero
        // y serán los campos para realizar la
        $campos_aux = array();
        if ($filtros != null){
            foreach ($filtros as $campo => $valor)
                 $campos_aux[] = $campo;
        }
        $campos_aux[] = $dimension;
        $campos_condicion= $campos_aux;
        foreach (explode(', ',$campos) as $c){            
            if (!in_array($c, $campos_aux))
                $campos_aux[] = $c;
        }
        
        $campos2= implode(', ', $campos_aux);
        $sql='';
        // Hacer coincidir las tablas en las filas que tenga una y la otra no, agregarla 
        // y ponerle 0 para que se acumule
        foreach ($fichaTecnica->getVariables() as $v){
            $tablas = $fichaTecnica->getVariables();            
            $campo_calculo = strtolower($v->getIniciales());
            $t1 = $campo_calculo.'_var';
            foreach ($tablas as $t){
                if ($v==$t)
                    continue;
                $sql .= "
                    INSERT INTO $t1 ($campos, $campo_calculo)
                        SELECT $campos, 0 FROM ".strtolower($t->getIniciales())."_var
                            WHERE ($campos) NOT IN (SELECT $campos FROM $t1);
                                ";
            }
        }
        foreach ($fichaTecnica->getVariables() as $variable){
            $tabla = strtolower($variable->getIniciales());
            $tablas_variables[] = $tabla;
            //leer la primera fila para determinar el tipo de dato de cada campo
            $sql2 = "SELECT * FROM $tabla".'_var';
            $fila = $em->getConnection()->executeQuery($sql2)->fetch();

            // De acuerdo al tipo de dato será el signo de la relación 
            $condiciones=array();
            foreach ($fila as $k=>$v){
                if (in_array($k, $campos_condicion)){
                    $signo= (is_numeric($v))?'<=':'=';
                    $condiciones[$k] = 'TT.'.$k.' '.$signo.' T.'.$k;
                }
            }            
            //Crear la tabla acumulada
            $sql .= "
                    SELECT $campos2, 
                        (SELECT SUM(TT.$tabla) 
                            FROM $tabla"."_var TT 
                            WHERE ".implode(' AND ', $condiciones)."
                        ) AS $tabla
                    INTO TEMP $tabla"."_var_acum
                    FROM $tabla"."_var T  
                    ORDER BY $campos2 ;
                    ";
        }
        $formula = $fichaTecnica->getFormula();
        $denominador = explode('/', $formula);
        $evitar_div_0 = '';
        if (count($denominador) > 1){
            preg_match('/\{.{1,}\}/', $denominador[1], $variables_d);
            if (count($variables_d) > 0)
                $var_d = strtolower(str_replace(array('{','}'),array('',''),array_shift($variables_d)));
            $evitar_div_0 = ' WHERE '.$var_d. ' is not null';
        }
        $sql .= 'SELECT  '.str_replace('T.', '', $campos2).','.  implode(',', $tablas_variables).
                " INTO tmp_ind_".$nombre_indicador." FROM  ".array_shift($tablas_variables).'_var_acum ';
        foreach ($tablas_variables as $tabla){
            $sql .= " FULL OUTER JOIN ".$tabla."_var_acum USING ($campos) " . $evitar_div_0;
        }
        
        $em->getConnection()->exec($sql);
        
    }
    
    public function calcularIndicador(FichaTecnica $fichaTecnica, $dimension, $filtro_registros=null) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $acumulado = $fichaTecnica->getEsAcumulado();
        $formula = $fichaTecnica->getFormula();
        
        //Recuperar las variables
        $variables = array();
        preg_match_all('/\{[a-z0-9\_]{1,}\}/', strtolower($formula), $variables, PREG_SET_ORDER);
        
        $oper = 'SUM';
        if ($acumulado){
            $formula = str_replace(array('{','}'), array('MAX(',')'), $formula);
            $oper = 'MAX';
        }
        else
            $formula = str_replace(array('{','}'), array('SUM(',')'), $formula);                
        
        // Formar la cadena con las variables para ponerlas en la consulta
        $variables_query = '';
        foreach($variables as $var){
            $v = str_replace(array('{','}'),array('',''),$var[0]);
            $variables_query .= " $oper($v) as $v, ";
        }
        $variables_query = trim($variables_query, ', ');
        
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tabla_indicador = 'tmp_ind_'.$nombre_indicador;
        
        $sql = "SELECT $dimension as category, $variables_query, round(($formula)::numeric,2) as measure
            FROM $tabla_indicador ";
        $sql .= ' WHERE 1=1 ';
        if ($filtro_registros != null){            
            foreach ($filtro_registros as $campo => $valor)
                $sql .= " AND $campo = '$valor' ";
        }
        $sql .= "            
            GROUP BY $dimension             
            HAVING (($formula)::numeric) > 0
            ORDER BY $dimension";                
        try{
            return $this->getEntityManager()->getConnection()->executeQuery($sql)->fetchAll();
        }  catch (\PDOException $e){
            return $e->getMessage();        
        }  catch (\Doctrine\DBAL\DBALException $e){
            return $e->getMessage();
        }
    }

}
