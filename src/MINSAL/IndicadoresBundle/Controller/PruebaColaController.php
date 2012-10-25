<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;
use Symfony\Component\HttpFoundation\Response;


class PruebaColaController extends Controller {

    /**
     * @Route("/prueba/cola", name="prueba_cola")
     */
    public function indexAction() {

         $msg = array('user_id' => 1235, 'image_path' => '/path/to/new/pic.png');
         $this->get('old_sound_rabbit_mq.cargar_origen_datos_producer')
                 ->publish(serialize($msg));
         return new Response('prueba');
    }
}
