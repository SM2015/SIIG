<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\DBAL as DBAL;
use MINSAL\IndicadoresBundle\Excel\Excel as Excel;
use MINSAL\IndicadoresBundle\Entity\Campo;

class OrigenDatoController extends Controller {

    /**
     * @Route("/conexion/probar", name="origen_dato_conexion_probar", options={"expose"=true})
     */
    public function probarConexionAction() {

        $conn = $this->getConexionGenerica('base_datos');
        try {
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
    public function probarSentenciaAction() {

        $resultado = array('estado' => 'error', 'mensaje' => '', 'datos' => array());
        $sql = $this->getRequest()->get('sentenciaSql');
        // Verificar que no tenga UPDATE o DELETE
        $patron = '/\bUPDATE\b|\bDELETE\b|\bINSERT\b|\bCREATE\b|\bDROP\b/i';
        //
        if (preg_match($patron, $sql) == FALSE) {
            $conn = $this->getConexionGenerica('consulta_sql');
            try {
                $query = $conn->query($sql . ' LIMIT 50');
                if ($query->rowCount() > 0)
                    $resultado['datos'] = $query->fetchAll();
                $resultado['estado'] = 'ok';
                $resultado['mensaje'] = '<span style="color: green">' . $this->get('translator')->trans('sentencia_success') . '</span>';
            } catch (\PDOException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            } catch (DBAL\DBALException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            }
        } else {
            $resultado['mensaje'] = $this->get('translator')->trans('solo_select');
        }


        return new Response(json_encode($resultado));
    }

    /**
     * Crear una conexión para realizar pruebas
     * @param type $objeto_prueba, puede ser 'base_datos' o 'consulta_sql'
     */
    public function getConexionGenerica($objeto_prueba, $idConexion = null) {
        $req = $this->getRequest();
        $em = $this->getDoctrine()->getEntityManager();

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
            if ($idConexion == null)
                $conexion = $em->find('IndicadoresBundle:Conexion', $req->get('idConexion'));
            else
                $conexion = $em->find('IndicadoresBundle:Conexion', $idConexion);

            $datos = array('dbname' => $conexion->getNombreBaseDatos(),
                'user' => $conexion->getUsuario(),
                'password' => $conexion->getClave(),
                'host' => $conexion->getIp(),
                'driver' => $conexion->getIdMotor()->getCodigo(),
                'port' => $conexion->getPuerto()
            );
        }


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
        return $conn;
    }

    /**
     * @Route("/{id}/leer", name="origen_dato_leer", options={"expose"=true})
     */
    public function leerOrigenAction($id) {
        $resultado = array('estado' => 'error',
            'mensaje' => '',
            'tipos_datos' => array(),
            'tipo_origen' => '',
            'significados' => array(),
            'nombre_campos' => array(),
            'datos' => array());

        $em = $this->getDoctrine()->getEntityManager();

        $resultado['tipos_datos'] = $em->createQuery("SELECT tp FROM IndicadoresBundle:TipoCampo tp")->getArrayResult();
        $resultado['significados'] = $em->createQuery("SELECT sv FROM IndicadoresBundle:SignificadoCampo sv")->getArrayResult();

        $origenDato = $em->find("IndicadoresBundle:OrigenDatos", $id);
        
        //recuperar los campos ya existentes en el origen de datos
        $campos_existentes = $em->getRepository('IndicadoresBundle:Campo')->findBy(array('origenDato'=>$origenDato));        
        
        $campos = array();
        foreach ($campos_existentes as $campo){
            $campos[$campo->getNombre()]['id'] = $campo->getId();
            $campos[$campo->getNombre()]['significado'] = ($campo->getSignificado()) ? $campo->getSignificado()->getId() : null;
            $campos[$campo->getNombre()]['tipo'] = ($campo->getTipoCampo()) ? $campo->getTipoCampo()->getId() : null;
        }
        $resultado['campos'] = $campos;        
        if ($origenDato->getSentenciaSql() != '') {
            $resultado['tipo_origen'] = 'sql';
            $sentenciaSQL = $origenDato->getSentenciaSql();
            $idConexion = $origenDato->getIdConexion()->getId();

            $conn = $this->getConexionGenerica('consulta_sql', $idConexion);
            try {
                $query = $conn->query($sentenciaSQL . ' LIMIT 20');
                if ($query->rowCount() > 0) {
                    $resultado['datos'] = $query->fetchAll();
                    $resultado['nombre_campos'] = array_keys($resultado['datos'][0]);
                }
                $resultado['estado'] = 'ok';
                $resultado['mensaje'] = '<span style="color: green">' . $this->get('translator')->trans('sentencia_success') . '</span>';
            } catch (\PDOException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            } catch (DBAL\DBALException $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
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
                
                if ($primer_null==false)
                    foreach ($datos as $fila)
                        $resultado['datos'][] = $fila;
                else{
                    $resultado['nombre_campos'] = array_slice($resultado['nombre_campos'], 0, $primer_null, true);
                    foreach ($datos as $fila)
                        $resultado['datos'][] = array_slice($fila, 0, $primer_null, true);
                }
                $resultado['estado'] = 'ok';
            } catch (\Exception $e) {
                $resultado['mensaje'] = '<span style="color: red">' . $e->getMessage() . '</span>';
            }            
        }                
        // Guardar los campos
        if ($resultado['estado'] == 'ok') {
            $nombres_id = array();
            $campo = array();
            //Por defecto poner tipo texto
            $tipo_campo = $em->getRepository("IndicadoresBundle:TipoCampo")->findOneByCodigo('texto');
            foreach ($resultado['nombre_campos'] as $k => $nombre_campo) {
                // si existe no guardarlo                
                if (!array_key_exists($nombre_campo, $campos)){
                    $campo[$k] = new Campo();
                    $campo[$k]->setNombre($nombre_campo);
                    $campo[$k]->setOrigenDato($origenDato);
                    $campo[$k]->setTipoCampo($tipo_campo);
                    $em->persist($campo[$k]);
                    $nombres_id[$campo[$k]->getId()] = $nombre_campo;
                }
                else
                    $nombres_id[$campos[$nombre_campo]['id']] = $nombre_campo;
                
            }
            try{                                
                $em->flush();
            } catch (\Exception $e){
                $resultado = array('estado' => 'error', 'mensaje' => '<div class="alert alert-error"> '.$this->get('translator')->trans('camio_no_realizado').'</div>');
            }
            $resultado['nombre_campos'] = $nombres_id;
        }
        return new Response(json_encode($resultado));
    }

    /**
     * @Route("/configurar/campo", name="configurar_campo", options={"expose"=true})
     */
    public function configurarCampoAction() {
        $resultado = array('estado' => 'ok', 'mensaje' => '');

        $em = $this->getDoctrine()->getEntityManager();
        $req = $this->getRequest();
        list($tipo_cambio, $id) = explode('__', $req->get('control'));
        $valor = $req->get('valor');
        $campo = $em->find("IndicadoresBundle:Campo", $id);
        
        if ($tipo_cambio == 'tipo_campo') {
            $tipo_campo = $em->find("IndicadoresBundle:TipoCampo", $valor);
            $mensaje = $campo->getNombre().': '.$this->get('translator')->trans('tipo_campo_cambiado_a').' '.$tipo_campo->getDescripcion();
            $campo->setTipoCampo($tipo_campo);
        } else {
            $significado_variable = $em->find("IndicadoresBundle:SignificadoCampo", $valor);
            $mensaje = $campo->getNombre().': '.$this->get('translator')->trans('significado_campo_cambiado_a').' '.$significado_variable->getDescripcion();
            $campo->setSignificado($significado_variable);
        }
        $resultado['mensaje'] = '<div class="alert alert-success">'.$mensaje.'</div>';
        try{
            $em->flush();
        }  catch (\Exception $e){
            $resultado = array('estado' => 'error', 'mensaje' => '<div class="alert alert-error"> '.$this->get('translator')->trans('camio_no_realizado').'</div>');
        }
        return new Response(json_encode($resultado));
    }

}
