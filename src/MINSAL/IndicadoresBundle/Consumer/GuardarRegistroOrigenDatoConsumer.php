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
        
        $sth = $this->em->getConnection()->prepare("INSERT INTO fila_origen_dato(id_origen_dato, datos) 
                    VALUES (:id_origen_dato, hstore(ARRAY[:llaves], ARRAY[:valores]))");
                
        $this->em->getConnection()->beginTransaction();
        foreach($msg['datos'] as $fila) {
            $llaves = "'".implode("','",array_keys($fila))."'";
            $valores = "'".implode("','",array_values($fila))."'";            
            $result = $sth->execute(array(':id_origen_dato'=>$msg['id_origen_dato'],':llaves'=>$llaves, ':valores'=>$valores));
            if (!$result)
                return false;
        }
        $this->em->getConnection()->commit();
        return true;        
    }

}
