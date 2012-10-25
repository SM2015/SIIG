<?php

namespace MINSAL\IndicadoresBundle\Consumer;


use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;

use Doctrine\ORM\EntityManager;

use MINSAL\IndicadoresBundle\Excel\Excel as Excel;

class CargarOrigenDatoConsumer implements ConsumerInterface{
    protected $em;

    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }
    public function execute(AMQPMessage $msg)
    {        
        $msg = unserialize($msg->body);
        
        $origenDato = $this->em->find('IndicadoresBundle:OrigenDatos', $msg['id_origen_dato']);
        
        $datos = array();
        $nombre_campos = array();
        if ($origenDato->getSentenciaSql() != '') {
            $conexion = $origenDato->getIdConexion();
            $conn = $this->getConexionGenerica($conexion);
            
            try {
                $query = $conn->query($origenDato->getSentenciaSql());
                if ($query->rowCount() > 0) {
                    $datos = $query->fetchAll();
                    $nombre_campos = array_keys($resultado['datos'][0]);
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
            } catch (\Exception $e) {
                return false;
            }            
        }
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
