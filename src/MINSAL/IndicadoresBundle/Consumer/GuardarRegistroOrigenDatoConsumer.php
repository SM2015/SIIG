<?php

namespace MINSAL\IndicadoresBundle\Consumer;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;
use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Response;

class GuardarRegistroOrigenDatoConsumer implements ConsumerInterface {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }

    public function execute(AMQPMessage $mensaje) {
        $msg = unserialize($mensaje->body);

        // Si se retorna falso se enviará un mensaje que le indicará al producer que no se pudo procesar
        // correctamente el mensaje y será enviado nuevamente
        $datos = str_replace(array('{', '}', ':'), array("'", "'", '=>'), json_encode($msg['datos']));
        $sql = "INSERT INTO fila_origen_dato(id, id_origen_dato, datos) 
                    VALUES (nextval('fila_origen_dato_id_seq'::regclass), '$msg[id_origen_dato]', $datos)";
        try {
            if ($this->em->getConnection()->exec($sql) == 1)
                return true;
            else
                return false;
        } catch (\PDOException $e) {
            return false;
        } catch (DBAL\DBALException $e) {
            return false;
        }
        return new Response('');
    }

}