<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use MINSAL\IndicadoresBundle\Entity\OrigenDatos;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\DBAL as DBAL;
use MINSAL\IndicadoresBundle\Excel\Excel as Excel;
use MINSAL\IndicadoresBundle\Entity\Campo;

class OrigenDatoController extends Controller
{
    private $driver;

    /**
     * @Route("/conexion/probar", name="origen_dato_conexion_probar", options={"expose"=true})
     */
    public function probarConexionAction()
    {
        try {
            $conn = $this->getConexionGenerica('base_datos');
            if ($this->driver != 'pdo_dblib')
                $conn->connect();
            $mensaje = '<span style="color: green">' . $this->get('translator')->trans('conexion_success') . '</span>';
        } catch (\PDOException $e) {
            $mensaje = '<span style="color: red">' . $this->get('translator')->trans('conexion_error') . ': ' . $e->getMessage() . '</span>';
        }

        return new Response($mensaje);
    }

    /**
     * @Route("/sentencia/probar", name="origen_dato_conexion_probar_sentencia", options={"expose"=true})
     */
    public function probarSentenciaAction()
    {
        $resultado = array('estado' => 'error', 'mensaje' => '', 'datos' => array());
        $sql = $this->getRequest()->get('sentenciaSql');
        $conexiones = explode('-', trim($this->getRequest()->get('conexiones_todas'), '-'));

        // Verificar que no tenga UPDATE o DELETE
        $patron = '/\bUPDATE\b|\bDELETE\b|\bINSERT\b|\bCREATE\b|\bDROP\b/i';
        $conexion = '';
        if (preg_match($patron, $sql) == FALSE) {
            try {
                foreach ($conexiones as $cnx) {
                    $datos = array();
                    $cnxObj = $this->getDoctrine()->getManager()->find('IndicadoresBundle:Conexion', $cnx);
                    $conn = $this->getConexionGenerica('consulta_sql', $cnxObj);
                    $conexion = $cnxObj->getNombreConexion();
                    $sql = str_ireplace('FROM', ", '" . $cnxObj->getNombreConexion() . "' AS origen_datos FROM ", $sql);
                    if ($this->driver == 'pdo_dblib') {
                        $sql = str_ireplace('SELECT', 'SELECT TOP 20 ', $sql);
                        $query = mssql_query($sql, $conn);
                        if (mssql_num_rows($query) > 0)
                            while ($row = mssql_fetch_assoc($query))
                                $datos[] = $row;
                    } else {
                        $query = $conn->query($sql . ' LIMIT 20');
                        if ($query->rowCount() > 0)
                            $datos = $query->fetchAll();
                    }
                    $resultado['estado'] = 'ok';
                    $resultado['mensaje'] = '<span style="color: green">' . $this->get('translator')->trans('sentencia_success') . '</span>';
                    $resultado['datos'] = array_merge($resultado['datos'], $datos);
                }
            } catch (\PDOException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $conexion . ' ' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            } catch (DBAL\DBALException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $conexion . ' ' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            } catch (\Exception $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $conexion . ' ' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            }
        } else {
            $resultado['mensaje'] = $this->get('translator')->trans('solo_select');
        }

        //verificar que no hayan problemas con codificación de caracteres
        $datos_aux = array();
        foreach ($resultado['datos'] as $fila) {
            $nueva_fila = array();
            foreach ($fila as $k => $v)
                $nueva_fila[$k] = trim(mb_check_encoding($v, 'UTF-8') ? $v : utf8_encode($v));
            $datos_aux[] = $nueva_fila;
        }
        $resultado['datos'] = $datos_aux;

        return new Response(json_encode($resultado));
    }

    /**
     * Crear una conexión para realizar pruebas
     * @param type $objeto_prueba, puede ser 'base_datos' o 'consulta_sql'
     */
    public function getConexionGenerica($objeto_prueba, $conexion = null)
    {
        $req = $this->getRequest();
        $em = $this->getDoctrine()->getManager();

        try {
            if ($objeto_prueba == 'base_datos') {
                $motor = $em->find('IndicadoresBundle:MotorBd', $req->get('idMotor'));
                $datos = array('dbname' => $req->get('nombreBaseDatos'),
                    'user' => $req->get('usuario'),
                    'password' => $req->get('clavefirst'),
                    'host' => $req->get('ip'),
                    'driver' => $motor->getCodigo(),
                    'port' => $req->get('puerto')
                );
            } elseif ($objeto_prueba == 'consulta_sql') {
                //$conexion = $em->find('IndicadoresBundle:Conexion', $idConexion);

                $datos = array('dbname' => $conexion->getNombreBaseDatos(),
                    'user' => $conexion->getUsuario(),
                    'password' => $conexion->getClave(),
                    'host' => $conexion->getIp(),
                    'driver' => $conexion->getIdMotor()->getCodigo(),
                    'port' => $conexion->getPuerto()
                );
            }
        } catch (\Exception $e) {
            throw new \PDOException($e->getMessage());
        }

        //Debido a un bug en el controlador para mssqlserver usaré las funciones antiguas para conectarme
        // Estar pendiente de la resolución del bug para que se vuelva a utilizar PDO
        $this->driver = $datos['driver'];
        if ($datos['driver'] == 'pdo_dblib') {
            $servername = $datos['host'];
            if ($datos['port'] != '')
                $servername .= ',' . $datos['port'];
            $conn = mssql_connect($servername, $datos['user'], $datos['password']);
            mssql_select_db($datos['dbname'], $conn);
        } else {
            // Construir el Conector genérico
            $config = new DBAL\Configuration();

            $connectionParams = array(
                'dbname' => $datos['dbname'],
                'user' => $datos['user'],
                'password' => $datos['password'],
                'host' => $datos['host'],
                'driver' => $datos['driver']
            );
            if ($datos['port'] != '' and $datos['driver'] != 'pdo_sqlite')
                $connectionParams['port'] = $datos['port'];

            $conn = DBAL\DriverManager::getConnection($connectionParams, $config);
        }

        return $conn;
    }

    /**
     * @Route("/origen_dato/{id}/leer", name="origen_dato_leer", options={"expose"=true})
     */
    public function leerOrigenAction(OrigenDatos $origenDato)
    {
        $resultado = array('estado' => 'ok',
            'mensaje' => '',
            'tipo_origen' => '',
            'es_catalogo' => '',
            'nombre_campos' => array(),
            'datos' => array());
        $recargar = ($this->getRequest()->get('recargar')=='false') ? false : true;

        $em = $this->getDoctrine()->getManager();

        $resultado['es_catalogo'] = ($origenDato->getEsCatalogo()) ? true : false;

        $sql = "SELECT tp
                    FROM IndicadoresBundle:TipoCampo tp
                    ORDER BY tp.descripcion";
        $resultado['tipos_datos'] = $em->createQuery($sql)->getArrayResult();

        $sql = "SELECT dic
                    FROM IndicadoresBundle:Diccionario dic
                    ORDER BY dic.descripcion";
        $resultado['diccionarios'] = $em->createQuery($sql)->getArrayResult();

        $sql = "SELECT sv
                    FROM IndicadoresBundle:SignificadoCampo sv
                    WHERE sv.usoEnCatalogo = :uso_en_catalogo
                    ORDER BY sv.descripcion";
        $resultado['significados'] = $em->createQuery($sql)
                ->setParameter('uso_en_catalogo', $resultado['es_catalogo'] ? 'true' : 'false')
                ->getArrayResult();

        //recuperar los campos ya existentes en el origen de datos
        $campos_existentes = $em->getRepository('IndicadoresBundle:Campo')->findBy(array('origenDato' => $origenDato));

        $campos = array();
        foreach ($campos_existentes as $campo)
            $campos[$campo->getNombre()]['id'] = $campo->getId();

        $resultado['campos'] = $campos;
        if (count($campos_existentes) == 0 or $recargar == true) {
            if ($origenDato->getSentenciaSql() != '') {
                $resultado['tipo_origen'] = 'sql';
                $sentenciaSQL = $origenDato->getSentenciaSql();
                $conexiones = $origenDato->getConexiones();

                if ($conexiones[0] == null) {
                    $resultado['mensaje'] = $this->get('translator')->trans('sentencia_error') . ': ' . $this->get('translator')->trans('_no_conexion_configurada_');
                    $resultado['estado'] = 'error';
                } else {
                    $conn = $this->getConexionGenerica('consulta_sql', $conexiones[0]);
                    try {
                        if ($this->driver == 'pdo_dblib') {
                            $sentenciaSQL = str_ireplace('SELECT', 'SELECT TOP 20 ', $sentenciaSQL);
                            $query = mssql_query($sentenciaSQL, $conn);
                            if (mssql_num_rows($query) > 0) {
                                while ($row = mssql_fetch_assoc($query))
                                    $resultado['datos'][] = $row;
                                $resultado['nombre_campos'] = array_keys($resultado['datos'][0]);
                            }
                        } else {
                            $query = $conn->query($sentenciaSQL . ' LIMIT 20');
                            if ($query->rowCount() > 0) {
                                $resultado['datos'] = $query->fetchAll();
                                $resultado['nombre_campos'] = array_keys($resultado['datos'][0]);
                            }
                        }

                        $resultado['estado'] = 'ok';
                        $resultado['mensaje'] = '<span style="color: green">' . $this->get('translator')->trans('sentencia_success');
                    } catch (\PDOException $e) {
                        $resultado['mensaje'] = $this->get('translator')->trans('sentencia_error') . ' 1: ' . $e->getMessage();
                    } catch (DBAL\DBALException $e) {
                        $resultado['mensaje'] = $this->get('translator')->trans('sentencia_error') . ' 2: ' . $e->getMessage();
                    } catch (\Exception $e) {
                        $resultado['mensaje'] = $this->get('translator')->trans('sentencia_error') . ' 3: ' . $e->getMessage();
                    }
                }
            } else {
                $resultado['tipo_origen'] = 'archivo';
                $reader = new Excel();
                try {
                    $reader->loadFile($origenDato->getAbsolutePath());
                    $datos = $reader->getSheet()->toArray($nullValue = null, $calculateFormulas = false, $formatData = false, $returnCellRef = false);
                    $resultado['nombre_campos'] = array_values(array_shift($datos));

                    // Buscar por columnas que tengan null en el título
                    $primer_null = array_search(null, $resultado['nombre_campos']);

                    if ($primer_null == false)
                        foreach ($datos as $fila)
                            $resultado['datos'][] = $fila;
                    else {
                        $resultado['nombre_campos'] = array_slice($resultado['nombre_campos'], 0, $primer_null, true);
                        foreach ($datos as $fila)
                            $resultado['datos'][] = array_slice($fila, 0, $primer_null, true);
                    }
                    $resultado['estado'] = 'ok';

                    // Poner el nombre de la columna como indice del arreglo
                    $aux = array();
                    foreach ($resultado['datos'] as $fila)
                        $aux[] = array_combine($resultado['nombre_campos'], $fila);
                    $resultado['datos'] = $aux;
                } catch (\Exception $e) {
                    $resultado['estado'] = 'error';
                    $resultado['mensaje'] = $e->getMessage();
                }
            }
            // Guardar los campos
            if ($resultado['estado'] == 'ok') {
                $nombres_id = array();
                $campo = array();
                //Por defecto poner tipo entero
                $tipoCampo = $em->getRepository("IndicadoresBundle:TipoCampo")->findOneByCodigo('integer');
                $util = new \MINSAL\IndicadoresBundle\Util\Util();
                foreach ($resultado['nombre_campos'] as $k => $nombre) {
                    // si existe no guardarlo
                    $nombre_campo = $util->slug($nombre);
                    if (!array_key_exists($nombre_campo, $campos)) {
                        $campo[$k] = new Campo();
                        $campo[$k]->setNombre($nombre_campo);
                        $campo[$k]->setOrigenDato($origenDato);
                        $campo[$k]->setTipoCampo($tipoCampo);
                        $em->persist($campo[$k]);
                        $nombres_id[$campo[$k]->getId()] = $nombre_campo;
                    } else
                        $nombres_id[$campos[$nombre_campo]['id']] = $nombre_campo;
                }
                //Borrar algún campo que ya no se use
                foreach ($campos_existentes as $campo) {
                    if (!in_array($campo->getNombre(), $nombres_id))
                        $em->remove($campo);
                }
                try {
                    $em->flush();
                } catch (\Exception $e) {
                    $resultado = array('estado' => 'error', 'mensaje' => '<div class="alert alert-error"> ' . $this->get('translator')->trans('camio_no_realizado') . '</div>');
                }
                $resultado['nombre_campos'] = $nombres_id;
            }

            $campos_existentes = $em->getRepository('IndicadoresBundle:Campo')->findBy(array('origenDato' => $origenDato));
        } else {
            foreach ($campos_existentes as $campo) {
                $nombre_campos[$campo->getId()] = $campo->getNombre();
            }
            $resultado['nombre_campos'] = $nombre_campos;
        }
        $campos = array();
        foreach ($campos_existentes as $campo) {
            $campos[$campo->getNombre()]['id'] = $campo->getId();
            $campos[$campo->getNombre()]['significado'] = ($campo->getSignificado()) ? $campo->getSignificado()->getId() : null;
            $campos[$campo->getNombre()]['significado_codigo'] = ($campo->getSignificado()) ? $campo->getSignificado()->getCodigo() : null;
            $campos[$campo->getNombre()]['diccionario'] = ($campo->getDiccionario()) ? $campo->getDiccionario()->getId() : null;
            $campos[$campo->getNombre()]['tipo'] = ($campo->getTipoCampo()) ? $campo->getTipoCampo()->getId() : null;
        }
        $resultado['campos'] = $campos;

        //Cambiar la estructura
        $aux = array();
        foreach ($resultado['nombre_campos'] as $n)
            $aux[$n] = '';
        foreach (array_slice($resultado['datos'], 0, 10) as $fila)
            foreach ($fila as $k => $v)
                $aux[$util->slug($k)] .= trim(mb_check_encoding($v, 'UTF-8') ? $v : utf8_encode($v)) . ', ';
        $resultado['datos'] = $aux;

        return new Response(json_encode($resultado));
    }

    /**
     * @Route("/configurar/campo", name="configurar_campo", options={"expose"=true})
     */
    public function configurarCampoAction()
    {
        $resultado = array('estado' => 'success', 'mensaje' => '');

        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();
        list($tipo_cambio, $id) = explode('__', $req->get('control'));
        $valor = $req->get('valor');
        $campo = $em->find("IndicadoresBundle:Campo", $id);
        $valido = true;
        if ($tipo_cambio == 'tipo_campo') {
            $tipo_campo = $em->find("IndicadoresBundle:TipoCampo", $valor);
            if (strlen($req->get('datos_prueba'))) {
                $datos_prueba = explode(', ', $req->get('datos_prueba'));

                $util = new \MINSAL\IndicadoresBundle\Util\Util();
                foreach ($datos_prueba as $dato) {
                    $valido = $util->validar($dato, $tipo_campo->getCodigo());
                    if (!$valido)
                        break;
                }
            }
            $mensaje = $campo->getNombre() . ': ' . $this->get('translator')->trans('tipo_campo_cambiado_a') . ' ' . $tipo_campo->getDescripcion();
            $campo->setTipoCampo($tipo_campo);
        } elseif ($tipo_cambio == 'significado_variable') {
            $significado_variable = $em->find("IndicadoresBundle:SignificadoCampo", $valor);
            $mensaje = $campo->getNombre() . ': ' . $this->get('translator')->trans('significado_campo_cambiado_a') . ' ' . $significado_variable->getDescripcion();
            $campo->setSignificado($significado_variable);
        } else {
            $diccionario = $em->find("IndicadoresBundle:Diccionario", $valor);
            $mensaje = $campo->getNombre() . ': ' . $this->get('translator')->trans('_diccionario_aplicado_') . ' ' . $diccionario->getDescripcion();
            $campo->setDiccionario($diccionario);
        }

        if ($valido) {
            $resultado['mensaje'] = $mensaje;
        } else {
            $resultado = array('estado' => 'error', 'mensaje' => $this->get('translator')->trans('_tipo_no_corresponde_con_datos_'));
        }
        try {
            $em->flush();
        } catch (\Exception $e) {
            $resultado = array('estado' => 'error', 'mensaje' => $this->get('translator')->trans('camio_no_realizado'));
        }

        return new Response(json_encode($resultado));
    }

    /**
     * @Route("/origen_dato/get_campos/{id}", name="origen_dato_get_campos", options={"expose"=true})
     */
    public function getCamposAction(OrigenDatos $origen)
    {
        $resp = '<h6>' . $this->get('translator')->trans('_campos_utilizables_en_campos_calculados_') . '</h6>
                <UL class="campos_disponibles">';
        if ($origen->getEsFusionado() or $origen->getEsPivote()) {
            $campos = explode(',', str_replace(array(' ', "'"), '', $origen->getCamposFusionados()));
            foreach ($campos as $campo)
                $resp .= '<LI><A href="javascript:funcion()">{' . $campo . '}</A></LI>';
        } else {
            $campos = $origen->getCampos();
            foreach ($campos as $campo) {
                if ($campo->getSignificado())
                    $resp .= '<LI><A href="javascript:funcion()">{' . $campo->getSignificado()->getCodigo() . '}</A></LI>';
            }
        }

        return new Response($resp . '</UL>');
    }

}
