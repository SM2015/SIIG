<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\OrigenDatos;
use MINSAL\IndicadoresBundle\Excel\Excel as Excel;
use Doctrine\DBAL as DBAL;

class OrigenDatosRepository extends EntityRepository {

    /**
     * Verifica que el origen de datos esté totalmente configurado
     * 1) Que no tenga ningún campo sin significado
     * 2) Que tenga un campo con significado "calculo"
     */
    public function estaConfigurado(OrigenDatos $origen) {
        $tiene_campo_calculo = false;
        $tiene_null = false;
        $campos = $origen->getCampos();
        foreach ($campos as $campo){
            $sig = $campo->getSignificado();
            if ($sig != null){
                $significado = $sig->getCodigo();            
                if ($significado=='calculo')
                    $tiene_campo_calculo = true;
            } else
                $tiene_null = true;
            
        }
        if (!$tiene_campo_calculo or $tiene_null)
            return false;
        else
            return true;
    }
    public function getTotalRegistros(OrigenDatos $origenDato) {
        if ($origenDato->getSentenciaSql() != '') {
            $conexion = $origenDato->getConexion();
            $conn = $this->getEntityManager()
                    ->getRepository('IndicadoresBundle:Conexion')
                    ->getConexionGenerica($conexion);
            return $conn->query($origenDato->getSentenciaSql())->rowCount();
        }
        else return 1;
        
    }
    public function getDatos(OrigenDatos $origenDato) {
        $datos = array();
        $nombre_campos = array();
        if ($origenDato->getSentenciaSql() != '') {
            $conexion = $origenDato->getConexion();
            $conn = $this->getEntityManager()
                    ->getRepository('IndicadoresBundle:Conexion')
                    ->getConexionGenerica($conexion);

            try {
                $query = $conn->query($origenDato->getSentenciaSql());
                if ($query->rowCount() > 0) {
                    $datos = $query->fetchAll();
                    $nombre_campos = array_keys($datos[0]);
                }
            } catch (\PDOException $e) {
                return false;
            } catch (DBAL\DBALException $e) {
                return false;
            }
        } else {
            $reader = new Excel();
            try {
                $reader->loadFile($origenDato->getAbsolutePath());
                $datos_aux = $reader->getSheet()->toArray(null, false, false, false);
                $nombre_campos = array_values(array_shift($datos_aux));

                // Buscar por columnas que tengan null en el título
                $primer_null = array_search(null, $nombre_campos);

                if ($primer_null == false)
                    foreach ($datos_aux as $fila)
                        $datos[] = $fila;
                else {
                    $nombre_campos = array_slice($nombre_campos, 0, $primer_null, true);
                    foreach ($datos_aux as $fila)
                        $datos[] = array_slice($fila, 0, $primer_null, true);
                }
                $fix_datos = array();
                foreach ($datos as $k => $f) {
                    foreach ($f as $indice => $campo) {
                        $fix_datos[$k][$nombre_campos[$indice]] = trim($campo);
                    }
                }
            } catch (\Exception $e) {
                return false;
            }
            $datos = $fix_datos;
        }

        return $datos;
    }

    public function crearTablaCatalogo(OrigenDatos $origenDato, array $datos) {
        //Recuperar la información para construir la tabla
        $em = $this->getEntityManager();
        $nombre_tabla = $origenDato->getNombreCatalogo();
        $campos = $origenDato->getCampos();
        //Verificar si existe la tabla
        $sql = "CREATE TABLE IF NOT EXISTS $nombre_tabla (";
        foreach ($campos as $campo) {
            $sql .= $campo->getNombre() . " " . $campo->getTipoCampo()->getCodigo();
            if ($campo->getSignificado()->getCodigo() == 'pk'){
                $sql .= ' PRIMARY KEY ';
                $pk = $campo->getNombre();
            }
            $sql .= ', ';
        }

        $sql = trim($sql, ', ') . '); ';
        //Crear tabla temporal para hacer un puente y validar antes de subir al catálogo
        $nombre_temp = $nombre_tabla.time();
        $sql .= ' 
                SELECT * INTO TEMP '.$nombre_temp.' FROM '.$nombre_tabla.' LIMIT 0;';
        $nombre_campos = implode(", ",array_keys($datos[0]));                
        
        $sql .= "
          INSERT INTO $nombre_temp($nombre_campos) VALUES ";
        
        foreach ($datos as $fila){
            $sql .= "('".implode("','", $fila)."'), ";
        }
        $sql = trim($sql,', ');
        // Si tiene llave primaria
        if ($pk != ''){
            //Insertar las que no están
            $sql .= "; INSERT INTO $nombre_tabla SELECT * FROM $nombre_temp WHERE $pk NOT IN (SELECT $pk FROM $nombre_tabla)";
            //Actualizar las que estaban
            $sql .= "; UPDATE $nombre_tabla SET";
            foreach(array_keys($datos[0]) as $campo){
                $sql .= " $campo = $nombre_temp.$campo, ";
            }
            $sql = trim($sql,', ');
            $sql .=" FROM $nombre_temp WHERE $nombre_tabla.$pk IN (SELECT $pk FROM $nombre_tabla) 
                    AND $nombre_tabla.$pk = $nombre_temp.$pk";
        }
        
        try {
            $em->getConnection()->exec($sql);
        } catch (\PDOException $e) {
            return $e->getMessages();
        }
        return true;
    }
    
    public function cargarCatalogo(OrigenDatos $origenDato) {
        $datos = $this->getDatos($origenDato);
        return $this->crearTablaCatalogo($origenDato, $datos);
    }
    
    public function getCatalogos() {
        
        //Consulta directa sobre el gestor postgresql, no funcionará en otro
        // Recupero todas las tablas cuyo nombre empieza con ctl_
        $sql = "SELECT relname AS nombre, relname AS nombre_tabla  
            FROM pg_stat_user_tables 
            WHERE relname LIKE 'ctl_%'
            ORDER BY relname";
        
        $datos = $this->getManager()->getConnection()->executeQuery($sql)->fetchAll();
        $result= array();
        foreach ($datos as $fila){
            $result[$fila['nombre']] = $fila['nombre'];
        }
        return $result;
    }
}