<?php

namespace MINSAL\IndicadoresBundle\Consumer;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;
use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\DBAL\DBALException;

class GuardarRegistroOrigenDatoConsumer implements ConsumerInterface {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }

    public function execute(AMQPMessage $mensaje) {
        $msg = unserialize($mensaje->body);

        // Si se retorna falso se enviará un mensaje que le indicará al producer que no se pudo procesar
        // correctamente el mensaje y será enviado nuevamente
        
        $sql = "INSERT INTO fila_origen_dato(id, id_origen_dato, datos) 
                    VALUES ";
                
        foreach($msg['datos'] as $fila) {
            $llaves = "'".implode("','",array_keys($fila))."'";
            $valores = "'".implode("','",array_values($fila))."'";
            $sql .= "(nextval('fila_origen_dato_id_seq'::regclass), '$msg[id_origen_dato]', hstore(ARRAY[$llaves], ARRAY[$valores])), ";
        }    
        $sql = trim ($sql,', ');        
        
        try {
            if ($this->em->getConnection()->exec($sql) >0 )
                return true;
            else
                return false;
        } catch (\PDOException $e) {
            return false;
        } catch (Doctrine\DBAL\DBALException $e) {
            return false;
        }
        return true;
    }

}
