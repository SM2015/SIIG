<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

class FichaTecnicaRepository extends EntityRepository {

    public function crearTablaIndicador(FichaTecnica $fichaTecnica) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tablas_variables = array();
        $sql='';
        // Crear las tablas para cada variable
        foreach ($fichaTecnica->getVariables() as $variable) {
            //Recuperar la información de los campos para crear la tabla
            $tabla = strtolower($variable->getIniciales());            
            $sql .= 'CREATE TEMP TABLE ' . $tabla . '(';
            foreach ($variable->getOrigenDatos()->getCampos() as $campo) {
                $sql .= $campo->getSignificado()->getCodigo() . ' ' . $campo->getTipoCampo()->getCodigo() . ', ';
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
                    ;";
            $tablas_variables[] = $tabla;
        }        
        
        $sql .= 'SELECT  '.$campos.','.  implode(',', $tablas_variables).
                " INTO TEMP ind_".$nombre_indicador." FROM  ".array_shift($tablas_variables).'_var ';
        foreach ($tablas_variables as $tabla){
            $sql .= " INNER JOIN ".$tabla."_var USING ($campos) ";
        }        
        $this->getEntityManager()->getConnection()->executeQuery($sql);
    }
    
    public function calcularIndicador(FichaTecnica $fichaTecnica, $grupos, $filtro_registros=null, $filtro_grupo=null) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $formula = str_replace(array('{','}'), array('SUM(',')'), $fichaTecnica->getFormula());
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tabla_indicador = 'ind_'.$nombre_indicador;
        
        $sql = "SELECT $grupos, ($formula) as indicador
            FROM $tabla_indicador ";
        if ($filtro_registros!=null)
            $sql .= "
                WHERE $filtro_registros                
            ";
        $sql .= "
            GROUP BY $grupos ";
        if ($filtro_grupo!=null)
            $sql .= " HAVING $filtro_grupo
                ";
        
        $this->getEntityManager()->getConnection()->executeQuery($sql);
    }

}
