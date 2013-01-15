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

        $fila1 = $msg['datos'][0];

        $llaves_aux1 = '';
        foreach ($fila1 as $k=>$campo) $llaves_aux1 .= "'$k', ";
        $llaves_aux1 = trim($llaves_aux1, ', ');

        $sql = "INSERT INTO fila_origen_dato(id_origen_dato, datos) 
                    VALUES ";
        $i=0;
        foreach ($msg['datos'] as $fila) {            
            $llaves_aux2 = '';
            foreach ($fila as $k=>$campo) $llaves_aux2 .= ":$k"."_$i, ";
            $llaves_aux2 = trim($llaves_aux2, ', ');
            
            $sql .= "(:id_origen_dato, hstore(ARRAY[$llaves_aux1], ARRAY[$llaves_aux2])), ";
            $i++;
        }
        $sql = trim($sql,', ');
        $sth = $this->em->getConnection()->prepare($sql);        
        $sth->bindParam(':id_origen_dato', $msg['id_origen_dato']);

        $this->em->getConnection()->beginTransaction();
        $i=0;
        foreach ($msg['datos'] as $fila) {                      
            foreach ($fila as $k => $value) { $llave = ':'.$k.'_'.$i; $sth->bindValue("$llave", trim($value)); }
            $i++;
        }
        $result = $sth->execute();
        if (!$result)
            return false;
        $this->em->getConnection()->commit();
        return true;
    }

}
