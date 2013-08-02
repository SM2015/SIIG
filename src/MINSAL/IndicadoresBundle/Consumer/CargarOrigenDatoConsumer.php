<?php

namespace MINSAL\IndicadoresBundle\Consumer;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;
use Symfony\Component\DependencyInjection\ContainerInterface;

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

        // Recuperar el nombre y significado de los campos del origen de datos
        $campos_sig = array();
        $campos = $origenDato->getCampos();
        foreach ($campos as $campo) {
            $campos_sig[$campo->getNombre()] = $campo->getSignificado()->getCodigo();
        }

        $fecha = new \DateTime("now");
        $ahora = $fecha->format('Y-m-d H:i:s');

        //Leeré los datos en grupos de 10,000
        $tamanio = 10000;

        // Recorrer cada conexión que tenga asociado el origen de datos
        foreach ($origenDato->getConexiones() as $cnx) {
            $leidos = 10001;
            $i = 0;
            $nombre_conexion = $cnx->getNombreConexion();            
            if ($cnx->getIdMotor()->getCodigo() != 'pdo_dblib' or $origenDato->getSentenciaSql() != '') {
                $sql = $msg['sql'];
                while ($leidos >= $tamanio) {
                    $sql_aux = $sql . ' LIMIT ' . $tamanio . ' OFFSET ' . $i * $tamanio;

                    $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos($sql_aux, $cnx);

                    $this->enviarDatos($idOrigen, $datos, $campos_sig, $ahora, $nombre_conexion);
                    $leidos = count($datos);
                    $i++;
                }
            } else {
                $datos = $em->getRepository('IndicadoresBundle:OrigenDatos')->getDatos(null, $cnx, $origenDato->getAbsolutePath());
                $this->enviarDatos($idOrigen, $datos, $campos_sig, $ahora, $nombre_conexion);
            }
        }
        //Después de enviados todos los registros para guardar, mandar mensaje para borrar los antiguos
        $msg_guardar = array('id_origen_dato' => $idOrigen,
            'method' => 'DELETE',
            'ultima_lectura' => $ahora
        );
        $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                ->publish(serialize($msg_guardar));
        return true;
    }

    public function enviarDatos($idOrigen, $datos, $campos_sig, $ultima_lectura, $nombre_conexion) {
        //Esta cola la utilizaré solo para leer todos los datos y luego mandar uno por uno
        // a otra cola que se encarará de guardarlo en la base de datos
        // luego se puede probar a mandar por grupos       
        $datos_a_enviar = array();
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $i = 0;
        $ii = 0;
        if ($datos) {
            foreach ($datos as $fila) {
                $nueva_fila = array();
                foreach ($fila as $k => $v) {
                    // Quitar caracteres no permitidos que podrian existir en el nombre de campo (tildes, eñes, etc)
                    //Verificar si ya está en UTF-8, si no, codificarlo
                    $nueva_fila[$campos_sig[$util->slug($k)]] = trim(mb_check_encoding($v, 'UTF-8') ? $v : utf8_encode($v));
                }
                //Agregar el nombre de la conexión como campo
                $nueva_fila['origen_dato'] = $nombre_conexion;
                $datos_a_enviar[] = $nueva_fila;
                //Enviaré en grupos de 200
                if ($i == 200) {
                    $msg_guardar = array('id_origen_dato' => $idOrigen,
                        'method' => 'PUT',
                        'datos' => $datos_a_enviar,
                        'ultima_lectura' => $ultima_lectura,
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
                'method' => 'PUT',
                'datos' => $datos_a_enviar,
                'ultima_lectura' => $ultima_lectura,
                'num_msj' => $ii++);
            $this->container->get('old_sound_rabbit_mq.guardar_registro_producer')
                    ->publish(serialize($msg_guardar));
        }
    }

}
?>