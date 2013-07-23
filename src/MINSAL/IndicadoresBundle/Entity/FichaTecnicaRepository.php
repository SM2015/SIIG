<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

class FichaTecnicaRepository extends EntityRepository {

    public function crearIndicador(FichaTecnica $fichaTecnica, $dimension = null, $filtros = null) {
        $em = $this->getEntityManager();
        $ahora = new \DateTime("now");
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());

        //Verificar si existe la tabla
        $existe = true;
        $acumulado = $fichaTecnica->getEsAcumulado();
        try {
            $em->getConnection()->query("select count(*) from tmp_ind_$nombre_indicador");
        } catch (\Doctrine\DBAL\DBALException $e) {
            $existe = false;
        }
        if ($fichaTecnica->getUpdatedAt() != '' and $fichaTecnica->getUltimaLectura() != '' and $existe == true and $acumulado == false) {
            if ($fichaTecnica->getUltimaLectura() < $fichaTecnica->getUpdatedAt())
                return true;
        }

        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());

        $tablas_variables = array();
        $sql = 'DROP TABLE IF EXISTS tmp_ind_' . $nombre_indicador . '; ';
        // Crear las tablas para cada variable
        foreach ($fichaTecnica->getVariables() as $variable) {
            //Recuperar la información de los campos para crear la tabla            
            $origen = $variable->getOrigenDatos();
            $diccionarios = array();

            // Si es pivote crear las tablas para los origenes relacionados 
            if ($origen->getEsPivote()) {
                $campos_pivote = explode(",", str_replace("'", '', $origen->getCamposFusionados()));
                $pivote = array();
                $campos_regulares = array();
                $tablas_piv = array();
                foreach ($origen->getFusiones() as $or) {
                    $or_id = $or->getId();
                    $sql .= " CREATE TEMP TABLE IF NOT EXISTS od_$or_id ( ";
                    foreach ($or->getCampos() as $campo) {
                        $tipo = $campo->getTipoCampo()->getCodigo();
                        $sig = $campo->getSignificado()->getCodigo();
                        $sql .= $sig . ' ' . $tipo . ', ';
                        if (in_array($sig, $campos_pivote))
                            $pivote[$sig] = $tipo;
                        else
                            $campos_regulares[$sig] = $tipo;
                    }
                    $sql = trim($sql, ', ');
                    $tablas_piv[] = 'od_' . $or_id;
                    $campos_piv = array_merge($pivote, $campos_regulares);
                    $sql .= ' ); ';
                    $sql .= "INSERT INTO od_$or_id
                    SELECT (populate_record(null::od_$or_id, datos)).*
                    FROM fila_origen_dato 
                        WHERE id_origen_dato = '$or_id'
                    ;";
                }
            }

            //Crear la estructura de la tabla asociada a la variable
            $tabla = strtolower($variable->getIniciales());
            $sql .= ' CREATE TEMP TABLE IF NOT EXISTS ' . $tabla . '(';

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
            } elseif ($origen->getEsPivote()) {
                foreach ($campos_piv as $campo => $tipo)
                    $sql .= $campo . ' ' . $tipo . ', ';
            } else {
                foreach ($origen->getCampos() as $campo) {
                    $sql .= $campo->getSignificado()->getCodigo() . ' ' . $campo->getTipoCampo()->getCodigo() . ', ';
                    if ($campo->getDiccionario() != null)
                        $diccionarios[$campo->getSignificado()->getCodigo()] = $campo->getDiccionario()->getId();
                }
            }
            $sql = trim($sql, ', ') . ');';

            // Recuperar los datos desde los orígenes            
            //Llenar la tabla con los valores del hstore
            if ($origen->getEsPivote()) {
                $tabla1 = array_shift($tablas_piv);
                $sql .= " INSERT INTO $tabla SELECT " . implode(', ', array_keys($campos_piv)) . " FROM $tabla1 ";
                foreach ($tablas_piv as $t) {
                    $sql .= " FULL OUTER JOIN $t USING (" . implode(', ', array_keys($pivote)) . ') ';
                }
                $sql .='; ';
            } else {
                // Si es fusionado recuperar los orígenes que están contenidos
                $origenes = array();
                if ($origen->getEsFusionado())
                    foreach ($origen->getFusiones() as $of)
                        $origenes[] = $of->getId();
                else
                    $origenes[] = $origen->getId();
                $sql .= "INSERT INTO $tabla
                    SELECT (populate_record(null::$tabla, datos)).*                 
                    FROM fila_origen_dato 
                        WHERE id_origen_dato IN (" . implode(',', $origenes) . ") 
                    ;";
            }
            //Obtener los campos que son calculados
            $campos_calculados = array();
            foreach ($origen->getCamposCalculados() as $campo) {
                $campos_calculados[$campo->getSignificado()->getCodigo()] = str_replace(array('{', '}'), '', $campo->getFormula()) . ' AS ' . $campo->getSignificado()->getCodigo();
            }
            $campos_calculados_nombre = '';

            if (count($campos_calculados) > 0) {
                //Quitar los campos calculados del listado campos del indicador sino da error
                $campos_aux = explode(',', str_replace(' ', '', $campos));
                $campos = implode(',', array_diff($campos_aux, array_keys($campos_calculados)));
                
                $campos_calculados_nombre = ', ' . implode(', ', array_keys($campos_calculados));
                $campos_calculados = ', ' . implode(', ', $campos_calculados);
                
            }
            else
                $campos_calculados = '';
            //Obtener solo los datos que se pueden procesar en el indicador
            $sql .= "DROP TABLE IF EXISTS $tabla" . "_var; ";
            $sql .= "SELECT  $campos, SUM(calculo::numeric) AS  $tabla $campos_calculados
                INTO TEMP  $tabla" . "_var
                FROM $tabla                 
                GROUP BY $campos $campos_calculados_nombre 
                HAVING  SUM(calculo::numeric) > 0
                    ;";

            //aplicar transformaciones si las hubieran
            foreach ($diccionarios as $campo => $diccionario) {
                $sql .= " 
                        UPDATE $tabla" . "_var SET $campo = regla.transformacion 
                            FROM regla_transformacion AS regla
                            WHERE $tabla" . "_var.$campo = regla.limite_inferior
                                AND id_diccionario = $diccionario
                    ;";
            }
            $tablas_variables[] = $tabla;
        }

        if ($acumulado != true) {
            $sql .= $this->crearTablaIndicador($fichaTecnica, $tablas_variables);
        }
        try {
            $em->getConnection()->exec($sql);
            if ($acumulado == true)
                $this->crearIndicadorAcumulado($fichaTecnica, $dimension, $filtros);
            $fichaTecnica->setUpdatedAt($ahora);
            $em->persist($fichaTecnica);
            $em->flush();
        } catch (\PDOException $e) {
            return $e->getMessage();
        }
    }

    public function crearIndicadorAcumulado(FichaTecnica $fichaTecnica, $dimension, $filtros = null) {
        $em = $this->getEntityManager();
        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());
        $tablas_variables = array();

        //Cambiar el orden de los campos, los filtros y la dimensión que se esté usando debe estar primero
        // y serán los campos para realizar la
        $campos_aux = array();
        if ($filtros != null) {
            foreach ($filtros as $campo => $valor)
                $campos_aux[] = $campo;
        }
        $campos_aux[] = $dimension;
        $campos_condicion = $campos_aux;
        foreach (explode(', ', $campos) as $c) {
            if (!in_array($c, $campos_aux))
                $campos_aux[] = $c;
        }

        $campos2 = implode(', ', $campos_aux);
        $sql = '';
        // Hacer coincidir las tablas en las filas que tenga una y la otra no, agregarla 
        // y ponerle 0 para que se acumule
        foreach ($fichaTecnica->getVariables() as $v) {
            $tablas = $fichaTecnica->getVariables();
            $campo_calculo = strtolower($v->getIniciales());
            $t1 = $campo_calculo . '_var';
            foreach ($tablas as $t) {
                if ($v == $t)
                    continue;
                $sql .= "
                    INSERT INTO $t1 ($campos, $campo_calculo)
                        SELECT $campos, 0 FROM " . strtolower($t->getIniciales()) . "_var
                            WHERE ($campos) NOT IN (SELECT $campos FROM $t1);
                                ";
            }
        }
        foreach ($fichaTecnica->getVariables() as $variable) {
            $tabla = strtolower($variable->getIniciales());
            $tablas_variables[] = $tabla;
            //leer la primera fila para determinar el tipo de dato de cada campo
            $sql2 = "SELECT * FROM $tabla" . '_var';
            $fila = $em->getConnection()->executeQuery($sql2)->fetch();

            // De acuerdo al tipo de dato será el signo de la relación 
            $condiciones = array();
            foreach ($fila as $k => $v) {
                if (in_array($k, $campos_condicion)) {
                    $signo = (is_numeric($v)) ? '<=' : '=';
                    $condiciones[$k] = 'TT.' . $k . ' ' . $signo . ' T.' . $k;
                }
            }
            //Crear la tabla acumulada
            $sql .= "
                    SELECT $campos2, 
                        (SELECT SUM(TT.$tabla) 
                            FROM $tabla" . "_var TT 
                            WHERE " . implode(' AND ', $condiciones) . "
                        ) AS $tabla
                    INTO TEMP $tabla" . "_var_acum
                    FROM $tabla" . "_var T  
                    ORDER BY $campos2 ;
                    ";
        }
        $sql .= $this->crearTablaIndicador($fichaTecnica, $tablas_variables);

        $em->getConnection()->exec($sql);
    }

    public function crearTablaIndicador(FichaTecnica $fichaTecnica, $tablas_variables) {
        $sql = '';
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $campos = str_replace("'", '', $fichaTecnica->getCamposIndicador());
        $formula = $fichaTecnica->getFormula();

        $denominador = explode('/', $formula);
        $evitar_div_0 = '';
        if (count($denominador) > 1) {
            preg_match('/\{.{1,}\}/', $denominador[1], $variables_d);
            if (count($variables_d) > 0)
                $var_d = strtolower(str_replace(array('{', '}'), array('', ''), array_shift($variables_d)));
            $evitar_div_0 = ' WHERE ' . $var_d . ' is not null';
        }

        $sufijoTablas = 'var';
        if ($fichaTecnica->getEsAcumulado() == true)
            $sufijoTablas = 'var_acum';
        $sql .= 'SELECT  ' . $campos . ',' . implode(',', $tablas_variables) .
                " INTO tmp_ind_" . $nombre_indicador . " FROM  " . array_shift($tablas_variables) . '_' . $sufijoTablas . ' ';
        foreach ($tablas_variables as $tabla) {
            $sql .= " FULL OUTER JOIN " . $tabla . "_" . $sufijoTablas . " USING ($campos) " . $evitar_div_0;
        }

        return $sql;
    }

    public function calcularIndicador(FichaTecnica $fichaTecnica, $dimension, $filtro_registros = null, $ver_sql = false) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $acumulado = $fichaTecnica->getEsAcumulado();
        $formula = strtolower($fichaTecnica->getFormula());

        //Recuperar las variables
        $variables = array();
        preg_match_all('/\{[a-z0-9\_]{1,}\}/', strtolower($formula), $variables, PREG_SET_ORDER);

        $oper = 'SUM';
        if ($acumulado) {
            $formula = str_replace(array('{', '}'), array('MAX(', ')'), $formula);
            $oper = 'MAX';
        }
        else
            $formula = str_replace(array('{', '}'), array('SUM(', ')'), $formula);

        $denominador = explode('/', $fichaTecnica->getFormula());
        $evitar_div_0 = '';
        $variables_d = array();
        if (count($denominador) > 1) {
            preg_match('/\{.{1,}\}/', $denominador[1], $variables_d);
            if (count($variables_d) > 0)
                $var_d = strtolower(str_replace(array('{', '}'), array('(', ')'), array_shift($variables_d)));
            $evitar_div_0 = 'AND ' . $var_d . ' > 0';
        }

        // Formar la cadena con las variables para ponerlas en la consulta
        $variables_query = '';
        foreach ($variables as $var) {
            $v = str_replace(array('{', '}'), array('', ''), $var[0]);
            $variables_query .= " $oper($v) as $v, ";
        }
        $variables_query = trim($variables_query, ', ');

        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tabla_indicador = 'tmp_ind_' . $nombre_indicador;

        //Verificar si es un catálogo
        $rel_catalogo = '';
        $otros_campos = '';
        $grupo_extra = '';
        if (preg_match('/^id_/i', $dimension)) {
            $significado = $this->getEntityManager()->getRepository('IndicadoresBundle:SignificadoCampo')
                    ->findOneBy(array('codigo' => $dimension));
            $catalogo = $significado->getCatalogo();
            if ($catalogo != '') {
                $rel_catalogo = " INNER JOIN  $catalogo  B ON (A.$dimension::text = B.id::text) ";
                $dimension = 'B.descripcion';
                $otros_campos = ' B.id AS id_category, ';
                $grupo_extra = ', B.id ';
            }
        }

        $sql = "SELECT $dimension AS category, $otros_campos $variables_query, round(($formula)::numeric,2) AS measure
            FROM $tabla_indicador A" . $rel_catalogo;
        $sql .= ' WHERE 1=1 ' . $evitar_div_0;
        if ($filtro_registros != null) {
            foreach ($filtro_registros as $campo => $valor) {
                //Si el filtro es un catálogo, buscar su id correspondiente
                if (preg_match('/^id_/i', $campo)) {
                    $significado = $this->getEntityManager()->getRepository('IndicadoresBundle:SignificadoCampo')
                            ->findOneBy(array('codigo' => $campo));
                    $catalogo = $significado->getCatalogo();
                    $sql_ctl = '';
                    if ($catalogo != '') {
                        $sql_ctl = "SELECT id FROM $catalogo WHERE descripcion ='$valor'";
                        $reg = $this->getEntityManager()->getConnection()->executeQuery($sql_ctl)->fetch();
                        $valor = $reg['id'];
                    }
                }
                $sql .= " AND A." . $campo . " = '$valor' ";
            }
        }
        $sql .= "            
            GROUP BY $dimension $grupo_extra            
            HAVING (($formula)::numeric) > 0 
            ORDER BY $dimension";
        try {
            if ($ver_sql == true)
                return $sql;
            else
                return $this->getEntityManager()->getConnection()->executeQuery($sql)->fetchAll();
        } catch (\PDOException $e) {
            return $e->getMessage();
        } catch (\Doctrine\DBAL\DBALException $e) {
            return $e->getMessage();
        }
    }

}