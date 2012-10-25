<?php

namespace MINSAL\IndicadoresBundle\Consumer;


use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;

use Doctrine\ORM\EntityManager;

class CargarOrigenDatoConsumer implements ConsumerInterface{
    protected $em;

    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }
    public function execute(AMQPMessage $msg)
    {
        //Process picture upload.
        //$msg will be an instance of `PhpAmqpLib\Message\AMQPMessage` with the $msg->body being the data sent over RabbitMQ.
        var_dump($msg->body);
        //$this->container->get('doctrine');
        /*$isUploadSuccess = someUploadPictureMethod();
        if (!$isUploadSuccess) {
            // If your image upload failed due to a temporary error you can return false
            // from your callback so the message will be rejected by the consumer and
            // requeued by RabbitMQ.
            // Any other value not equal to false will acknowledge the message and remove it
            // from the queue
            return false;
        }*/
    }
}

?>
