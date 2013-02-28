<?php

namespace MINSAL\IndicadoresBundle\Consumer;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;
use Symfony\Component\DependencyInjection\ContainerInterface;
//use Symfony\Component\HttpFoundation\Response;
//use MINSAL\IndicadoresBundle\Entity\Conexion;

class CargarOrigenDatoConsumer implements ConsumerInterface {

    protected $container;

    public function __construct(ContainerInterface $container) {
        $this->container = $container;
    }

    public function execute(AMQPMessage $msg) {
        $msg = unserialize($msg->body);
        $em = $this->container->get('doctrine.orm.entity_manager');

        $idOrigen = $msg['id_origen_dato'];
        $origenDato = $em->find('IndicadoresBundle:OrigenDatos', $idOrigen);        
        
        $origenDato_aux = $origenDato;
        $total_registros = $msg['total_registros'];

        // Recuperar el nombre y significado de los campos del origen de datos
        $campos_sig = array();
        $campos = $origenDato->getCampos();
        foreach ($campos as $campo) {
            $campos_sig[$campo->getNombre()] = $campo->getSignificado()->getCodigo();
        }        
        if ($total_registros > 0) {
            $fecha = new \DateTime("now");
            $ahora = $fecha->format('Y-m-d H:i:s');

            //Leeré los datos en grupos de 100,000
            $tamanio = 100000;            
            if ($total_registros > $tamanio and $origenDato->getConexion()->getIdMotor()->getCodigo() != 'pdo_dblib') {
                $partes = ceil($total_registros / $tamanio);
                $sql = $msg['sql'];
                for ($i = 0; $i < $partes; $i++) {
                    $sql_aux = $sql . ' LIMIT ' . $tamanio . ' OFFSET ' . $i * $tamanio;
                    $origenDato_aux->setSentenciaSql($sql_aux);
                    $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($origenDato_aux);
                    $this->enviarDatos($idOrigen, $datos, $campos_sig, $ahora);
                }
            } else {
                $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($origenDato);                
                $this->enviarDatos($idOrigen, $datos, $campos_sig, $ahora);
            }
            //Después de enviados todos los registros para guardar, mandar mensaje para borrar los antiguos
            $msg_guardar = array('id_origen_dato' => $idOrigen,
                'method'=>'DELETE',
                'ultima_lectura'=>$ahora
                );
            $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                    ->publish(serialize($msg_guardar));
            return true;
        }
        else
            return false;
    }

    public function enviarDatos($idOrigen, $datos, $campos_sig, $ultima_lectura) {
        //Esta cola la utilizaré solo para leer todos los datos y luego mandar uno por uno
        // a otra cola que se encarará de guardarlo en la base de datos
        // luego se puede probar a mandar por grupos       
        $datos_a_enviar = array();
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $i = 0;
        $ii = 0;
        if ($datos){
            foreach ($datos as $fila) {
                $nueva_fila = array();
                foreach ($fila as $k => $v) {
                    // Quitar caracteres no permitidos que podrian existir en el nombre de campo (tildes, eñes, etc)
                    //Verificar si ya está en UTF-8, si no, codificarlo
                    $nueva_fila[$campos_sig[$util->slug($k)]] =  trim(mb_check_encoding($v, 'UTF-8') ? $v : utf8_encode($v));
                }
                $datos_a_enviar[] = $nueva_fila;
                //Enviaré en grupos de 200
                if ($i == 200) {
                    $msg_guardar = array('id_origen_dato' => $idOrigen,
                        'method'=>'PUT',
                        'datos' => $datos_a_enviar,
                        'ultima_lectura'=>$ultima_lectura,
                        'num_msj' => $ii++);
                    $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                            ->publish(serialize($msg_guardar));
                    unset($datos_a_enviar);
                    $datos_a_enviar = array();
                    $i = 0;
                }
                $i++;
            }
        }
        //Verificar si quedaron pendientes de enviar
        if (count($datos_a_enviar) > 0) {
            $msg_guardar = array('id_origen_dato' => $idOrigen,
                'method'=>'PUT',
                'datos' => $datos_a_enviar,
                'ultima_lectura'=>$ultima_lectura,
                'num_msj' => $ii++);
            $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                    ->publish(serialize($msg_guardar));
        }
    }

}

?>