<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\DBAL as DBAL;

class OrigenDatoController extends Controller {

    /**
     * @Route("/origen_dato/conexion/probar", name="origen_dato_conexion_probar", options={"expose"=true})
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
     * @Route("/origen_dato/conexion/probar_sentencia", name="origen_dato_conexion_probar_sentencia", options={"expose"=true})
     */
    public function probarSentenciaAction() {
        
        $resultado = array('estado' => 'error', 'mensaje'=>'', 'datos' => array() );
        $sql = $this->getRequest()->get('sentenciaSql');
        // Verificar que no tenga UPDATE o DELETE
        $patron = '/\bUPDATE\b|\bDELETE\b|\bINSERT\b|\bCREATE\b|\bDROP\b/i';
        //
        if (preg_match($patron, $sql) == FALSE) {            
            $conn = $this->getConexionGenerica('consulta_sql');
            try {
                $query = $conn->query($sql.' LIMIT 50');
                if ( $query->rowCount() > 0)
                    $resultado['datos'] = $query->fetchAll();
                $resultado['estado'] = 'ok';
                $resultado['mensaje'] = '<span style="color: green">' . $this->get('translator')->trans('sentencia_success') . '</span>';
               
            } catch (\PDOException $e) {                
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            } catch (DBAL\DBALException $e) {                
                $resultado['mensaje'] = '<span style="color: red">' . $this->get('translator')->trans('sentencia_error') . ': ' . $e->getMessage() . '</span>';
            }
            
        }
        else{            
            $resultado['mensaje'] = $this->get('translator')->trans('solo_select');
        }

        
        return new Response(json_encode($resultado));
    }

    /**
     * Crear una conexión para realizar pruebas
     * @param type $objeto_prueba, puede ser 'base_datos' o 'consulta_sql'
     */
    public function getConexionGenerica($objeto_prueba) {
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
            $conexion = $em->find('IndicadoresBundle:Conexion', $req->get('idConexion'));
            
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
     * @Route("/origen_dato/conexion/origen/{id}/leer", name="origen_dato_leer", options={"expose"=true})
     */
    public function leerOrigenAction($id) {        
        $resultado = array('estado' => 'error', 'mensaje'=>'', 'datos' => array() );
        $em = $this->getDoctrine()->getEntityManager();
        $origenDato = $em->getRepository("IndicadoresBundle:OrigenDatos")->find($id);
        $resultado['datos'] = $origenDato->getSentenciaSql()->getSentenciaSql();
        
        return new Response(json_encode($resultado));
    }
}
