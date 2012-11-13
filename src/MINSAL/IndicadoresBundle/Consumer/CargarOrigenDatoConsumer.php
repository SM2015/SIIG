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

        $origenDato = $em->find('IndicadoresBundle:OrigenDatos', $msg['id_origen_dato']);
        $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($origenDato);

        if ($datos != false) {
            //Borrar los datos existentes por el momento así será pero debería haber una forma de ir a traer solo los nuevos
            $sql = "DELETE FROM fila_origen_dato WHERE id_origen_dato='$msg[id_origen_dato]' ";
            $em->getConnection()->exec($sql);

            // Recuperar el nombre y significado de los campos del origen de datos
            foreach ($origenDato->getCampos() as $campo) {
                $campos_sig[$campo->getNombre()] = $campo->getSignificado()->getCodigo();
            }
            //Esta cola la utilizaré solo para leer todos los datos y luego mandar uno por uno
            // a otra cola que se encarará de guardarlo en la base de datos
            // luego se puede probar a mandar por grupos       
            $datos_a_enviar = array();
            $i = 0;
            $ii=0;
            foreach ($datos as $fila) {
                $nueva_fila = array();
                foreach ($fila as $k => $v) {
                    $nueva_fila[$campos_sig[$k]] = $v;
                }
                $datos_a_enviar[] = $nueva_fila;
                //Enviaré en grupos de 200
                if ($i == 200) {                                        
                    $msg_guardar = array('id_origen_dato' => $msg['id_origen_dato'],
                        'datos' => $datos_a_enviar,
                        'num_msj'=>$ii++);
                    $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                            ->publish(serialize($msg_guardar));
                    unset($datos_a_enviar);
                    $datos_a_enviar = array();
                    $i=0;                    
                } 
                $i++;
            }
            //Verificar si quedaron pendientes de enviar
            if (count($datos_a_enviar) > 0) {
                $msg_guardar = array('id_origen_dato' => $msg['id_origen_dato'],
                    'datos' => $datos_a_enviar,
                    'num_msj'=>$ii++);
                $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                        ->publish(serialize($msg_guardar));
            }

            return true;
        }
        else
            return false;
    }

}

?>
