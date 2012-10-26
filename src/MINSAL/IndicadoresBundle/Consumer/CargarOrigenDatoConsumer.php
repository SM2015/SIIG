<?php

namespace MINSAL\IndicadoresBundle\Consumer;


use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;

use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\Conexion;
use Doctrine\DBAL as DBAL;

use MINSAL\IndicadoresBundle\Excel\Excel as Excel;


class CargarOrigenDatoConsumer implements ConsumerInterface{
    protected $container;    

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }
    public function execute(AMQPMessage $msg)
    {        
        $msg = unserialize($msg->body);
        $em = $this->container->get('doctrine.orm.entity_manager');
        
        $origenDato = $em->find('IndicadoresBundle:OrigenDatos', $msg['id_origen_dato']);
        // Si se retorna falso se enviará un mensaje que le indicará al producer que no se pudo procesar
        // correctamente el mensaje y será enviado nuevamente
        $datos = array();
        $nombre_campos = array();
        if ($origenDato->getSentenciaSql() != '') {
            $conexion = $origenDato->getIdConexion();
            $conn = $this->getConexionGenerica($conexion);
            
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
                
                if ($primer_null==false)
                    foreach ($datos_aux as $fila)
                        $datos[] = $fila;
                else{
                    $nombre_campos = array_slice($nombre_campos, 0, $primer_null, true);
                    foreach ($datos_aux as $fila)
                        $datos[] = array_slice($fila, 0, $primer_null, true);
                }
                $fix_datos=array();
                foreach ($datos as $k=>$f){
                    foreach($f as $indice=>$campo){
                        $fix_datos[$k][$nombre_campos[$indice]] = trim($campo);
                    }
                }

            } catch (\Exception $e) {
                return false;
            }
            $datos = $fix_datos;
        }
        
        //Borrar los datos existentes por el momento así será pero debería haber una forma de ir a traer solo los nuevos
        $sql = "DELETE FROM fila_origen_dato WHERE id_origen_dato='$msg[id_origen_dato]' ";
        $em->getConnection()->exec($sql);
        
        //Esta cola la utilizaré solo para leer todos los datos y luego mandar uno por uno
        // a otra cola que se encarará de guardarlo en la base de datos
        // luego se puede probar a mandar por grupos       
        foreach($datos as $fila){
            $msg_guardar = array('id_origen_dato'=>$msg['id_origen_dato'],
                'datos'=>$fila);
            $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                 ->publish(serialize($msg_guardar));
        }
        
        return new Response('');
    }
    
    public function getConexionGenerica(Conexion $conexion) {        
        // Construir el Conector genérico
        $config = new DBAL\Configuration();

        $connectionParams = array(
            'dbname' => $conexion->getNombreBaseDatos(),
            'user' => $conexion->getUsuario(),
            'password' => $conexion->getClave(),
            'host' => $conexion->getIp(),
            'driver' => $conexion->getIdMotor()->getCodigo()
        );
        if ($conexion->getPuerto() != '' and $conexion->getIdMotor()->getCodigo() != 'pdo_sqlite')
            $connectionParams['port'] = $conexion->getPuerto();

        $conn = DBAL\DriverManager::getConnection($connectionParams, $config);
        return $conn;
    }
}

?>
