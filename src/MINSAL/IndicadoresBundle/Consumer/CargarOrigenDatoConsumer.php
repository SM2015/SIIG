<?php

namespace MINSAL\IndicadoresBundle\Consumer;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\Conexion;

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
            //Borrar los datos existentes por el momento así será pero debería haber una forma de ir a traer solo los nuevos
            $sql = "DELETE FROM fila_origen_dato WHERE id_origen_dato='$msg[id_origen_dato]' ";
            $em->getConnection()->exec($sql);

            //Leeré los datos en grupos de 100,000
            $tamanio = 100000;            
            if ($total_registros > $tamanio) {
                $partes = ceil($total_registros / $tamanio);
                $sql = $msg['sql'];
                for ($i = 0; $i < $partes; $i++) {
                    $sql_aux = $sql . ' LIMIT ' . $tamanio . ' OFFSET ' . $i * $tamanio;
                    $origenDato_aux->setSentenciaSql($sql_aux);
                    $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($origenDato_aux);
                    $this->enviarDatos($idOrigen, $datos, $campos_sig);
                }
            } else {
                $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($origenDato);                
                $this->enviarDatos($idOrigen, $datos, $campos_sig);
            }
            return true;
        }
        else
            return false;
    }

    public function enviarDatos($idOrigen, $datos, $campos_sig) {
        //Esta cola la utilizaré solo para leer todos los datos y luego mandar uno por uno
        // a otra cola que se encarará de guardarlo en la base de datos
        // luego se puede probar a mandar por grupos       
        $datos_a_enviar = array();
        $i = 0;
        $ii = 0;
        foreach ($datos as $fila) {
            $nueva_fila = array();
            foreach ($fila as $k => $v) {
                // pasar el nombre del campo a minúsculas y quitar comillas dobles que pueda tener en su valor
                $nueva_fila[$campos_sig[strtolower($k)]] = $v;
            }
            $datos_a_enviar[] = $nueva_fila;
            //Enviaré en grupos de 200
            if ($i == 200) {
                $msg_guardar = array('id_origen_dato' => $idOrigen,
                    'datos' => $datos_a_enviar,
                    'num_msj' => $ii++);
                $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                        ->publish(serialize($msg_guardar));
                unset($datos_a_enviar);
                $datos_a_enviar = array();
                $i = 0;
            }
            $i++;
        }
        //Verificar si quedaron pendientes de enviar
        if (count($datos_a_enviar) > 0) {
            $msg_guardar = array('id_origen_dato' => $idOrigen,
                'datos' => $datos_a_enviar,
                'num_msj' => $ii++);
            $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                    ->publish(serialize($msg_guardar));
        }
    }

}

?>
