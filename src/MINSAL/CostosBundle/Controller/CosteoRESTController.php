<?php

namespace MINSAL\CostosBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\Annotations\Get;

class CosteoRESTController extends Controller {

    /**
     * Obtener los datos del costeo
     * @Get("/rest-service/costos/data/{codigo}", options={"expose"=true})
     * @Rest\View
     */
    public function getDatosCosteoAction($codigo) {
        $response = new Response();

        // crea una respuesta con una cabecera ETag y Last-Modified
        // para determinar si se debe calcular el indicador u obtener de la caché
        // para el modo de desarrollo (dev) nunca tomar de caché
        //$response->setETag($fichaTec->getId().'_datos');
        //$response->setLastModified(($this->get('kernel')->getEnvironment() == 'dev') ? new \DateTime('NOW') : $fichaTec->getUltimaLectura() );

        $response->setPublic();
        // verifica que la respuesta no se ha modificado para la petición dada
        //if ($response->isNotModified($this->getRequest())) {
        // devuelve inmediatamente la respuesta 304 de la caché
        //  return $response;
        //} else {
        $resp = array();

        $em = $this->getDoctrine()->getManager();

        $data = $em->getRepository('CostosBundle:Formulario')->getDatosCosteo($codigo);

        if (count($data) == 0) {
            $response->setContent('{"estado" : "error", "msj": "' . $this->get('translator')->trans('_no_datos_') . '"}');
        } else {
            $response->setContent(json_encode($data));
        }

        return $response;
        //}
    }

}
