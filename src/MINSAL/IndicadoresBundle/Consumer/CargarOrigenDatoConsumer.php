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
        $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos();

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
            foreach ($datos as $fila) {
                $nueva_fila = array();
                foreach ($fila as $k => $v) {
                    $nueva_fila[$campos_sig[$k]] = $v;
                }
                $msg_guardar = array('id_origen_dato' => $msg['id_origen_dato'],
                    'datos' => $nueva_fila);
                $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                        ->publish(serialize($msg_guardar));
            }

            return new Response('');
        }
        else
            return false;
    }

}

?>
