<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\Annotations\Get;


class IndicadorRESTController extends Controller
{
    

    /**
     * @param string $fichaTec Id of the thread
     * @param mixed $dimension Id of the comment
     * @Get("/indicador/{id}/{dimension}", options={"expose"=true})
     * @Rest\View
     */
    public function getIndicadorAction(FichaTecnica $fichaTec, $dimension)
    {
        $response = new Response();
        
        $response->setETag($fichaTec->getId());
        $response->setLastModified($fichaTec->getUltimaLectura());
    
        $response->setPublic();
        // verifica que la respuesta no se ha modificado para la petición dada
        if ($response->isNotModified($this->getRequest()) and $this->get('kernel')->getEnvironment() != 'dev') {
            // devuelve inmediatamente la respuesta 304 de la caché
            return $response;
        } else {
            $resp = array();            
            $filtro = $this->getRequest()->get('filtro');
            $verSql = ($this->getRequest()->get('ver_sql') == 'true') ? true : false;

            if ($filtro == null or $filtro == '')
                $filtros = null;
            else {

                $filtrObj = json_decode($filtro);
                foreach ($filtrObj as $f) {
                    $filtros_dimensiones[] = $f->codigo;
                    $filtros_valores[] = $f->valor;
                }
                $filtros = array_combine($filtros_dimensiones, $filtros_valores);
            }

            $em = $this->getDoctrine()->getManager();

            $fichaRepository = $em->getRepository('IndicadoresBundle:FichaTecnica');

            $fichaRepository->crearIndicador($fichaTec, $dimension, $filtros);
            $resp['datos'] = $fichaRepository->calcularIndicador($fichaTec, $dimension, $filtros, $verSql);
        
            $response->setContent(json_encode($resp));
            //Duración de la caché puesta en un año ya que antes se verifica si 
            //se han leido nuevos datos en el indicador, de ser así se actualiza
            // sin tomar en cuenta el valor de un año
            $response->setSharedMaxAge(31556926);
            
            return $response;            
        }
    }
}
