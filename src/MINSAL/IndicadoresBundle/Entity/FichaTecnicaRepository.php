<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

class FichaTecnicaRepository extends EntityRepository {

    public function crearTablaIndicador(FichaTecnica $fichaTecnica, $duracion=10, $dimension, $filtros=null) {
        
        $em = $this->getEntityManager();
        $ahora = new \DateTime("now");
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        
        //Verificar si existe la tabla
        $existe = true;
        $acumulado = true;
        try{
            $em->getConnection()->query("select count(*) from tmp_ind_$nombre_indicador");
        }  catch (\Doctrine\DBAL\DBALException $e){
            $existe = false;
        }
        if ($fichaTecnica->getUpdatedAt() != '' and $existe==true and $acumulado==false){
            $ultimo_calculo = $fichaTecnica->getUpdatedAt()->getTimestamp();
            $diff_minutos = ($ahora->getTimestamp() - $ultimo_calculo) / 60;
            if ($diff_minutos <= $duracion)
                return;
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
        
        
        if ($acumulado != true){                   
            $sql .= 'SELECT  '.$campos.','.  implode(',', $tablas_variables).
                " INTO tmp_ind_".$nombre_indicador." FROM  ".array_shift($tablas_variables).'_var ';
            foreach ($tablas_variables as $tabla){
                $sql .= " FULL OUTER JOIN ".$tabla."_var USING ($campos) ";
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
        $campos_aux = array();
        if ($filtros != null){
            foreach ($filtros as $campo => $valor)
                 $campos_aux[] = $campo;
        }
        $campos_aux[] = $dimension;
        foreach (explode(', ',$campos) as $c){            
            if (!in_array($c, $campos_aux))
                $campos_aux[] = $c;
        }
        
        $campos2= implode(', ', $campos_aux);
        $sql='';
        foreach ($fichaTecnica->getVariables() as $variable){
            $tabla = strtolower($variable->getIniciales());
            $tablas_variables[] = $tabla;
            //leer la primera fila para determinar el tipo de dato de cada campo
            $sql2 = "SELECT * FROM $tabla".'_var';
            $fila = $em->getConnection()->executeQuery($sql2)->fetch();

            // De acuerdo al tipo de dato será el signo de la relación 
            $signo='';
            foreach ($fila as $k=>$v){
                if ($k==$dimension)
                    $signo= (is_numeric($v))?'<=':'=';                
            }
            //$campos3 = str_replace('T.', '', $campos2);
            //Crear la tabla acumulada
            $sql .= "
                    SELECT $campos2, 
                        (SELECT SUM(TT.$tabla) 
                            FROM (SELECT row_number() OVER (ORDER BY $campos2) corr, $campos2, $tabla 
                                    FROM $tabla"."_var) AS TT 
                                    WHERE TT.corr <= T.corr AND TT.".$dimension.' '. $signo.' '." T.".$dimension."
                                  ) AS $tabla
                    INTO TEMP $tabla"."_var_acum
                    FROM (SELECT row_number() OVER (ORDER BY $campos2) corr, $campos2, $tabla 
                            FROM $tabla"."_var
                         ) AS T  
                    ORDER BY $campos2 ;
                    ";
        }
        
        $sql .= 'SELECT  '.str_replace('T.', '', $campos2).','.  implode(',', $tablas_variables).
                " INTO tmp_ind_".$nombre_indicador." FROM  ".array_shift($tablas_variables).'_var_acum ';
        foreach ($tablas_variables as $tabla){
            $sql .= " FULL OUTER JOIN ".$tabla."_var_acum USING ($campos) ";
        }
        
        $em->getConnection()->exec($sql);
        
    }
    
    public function calcularIndicador(FichaTecnica $fichaTecnica, $dimension, $filtro_registros=null) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $acumulado = true;
        if ($acumulado){
            $formula = str_replace(array('{','}'), array('MAX(',')'), $fichaTecnica->getFormula());
        }
        else
            $formula = str_replace(array('{','}'), array('SUM(',')'), $fichaTecnica->getFormula());
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tabla_indicador = 'tmp_ind_'.$nombre_indicador;
        
        $sql = "SELECT $dimension as category, round(($formula)::numeric,2) as measure
            FROM $tabla_indicador ";
        if ($filtro_registros != null){
            $sql .= ' WHERE 1=1 ';
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
