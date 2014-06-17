<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\Annotations\Get;

class IndicadorRESTController extends Controller {

    /**
     * @param integer $fichaTec
     * @param string $dimension
     * @Get("/rest-service/data/{id}/{dimension}", options={"expose"=true})
     * @Rest\View
     */
    public function getIndicadorAction(FichaTecnica $fichaTec, $dimension) {
        $response = new Response();

// crea una respuesta con una cabecera ETag y Last-Modified
// para determinar si se debe calcular el indicador u obtener de la caché
// para el modo de desarrollo (dev) nunca tomar de caché
        $response->setETag($fichaTec->getId());
        $response->setLastModified(($this->get('kernel')->getEnvironment() == 'dev') ? new \DateTime('NOW') : $fichaTec->getUltimaLectura() );

        $response->setPublic();
// verifica que la respuesta no se ha modificado para la petición dada
        if ($response->isNotModified($this->getRequest())) {
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

            return $response;
        }
    }
    
    /**
     * Obtener los datos del indicador sin aplicar la fórmula ni filtros
     * @param integer $fichaTec
     * @param string $dimension
     * @Get("/rest-service/data/{id}", options={"expose"=true})
     * @Rest\View
     */
    public function getDatosIndicadorAction(FichaTecnica $fichaTec) {
        $response = new Response();

        // crea una respuesta con una cabecera ETag y Last-Modified
        // para determinar si se debe calcular el indicador u obtener de la caché
        // para el modo de desarrollo (dev) nunca tomar de caché
        $response->setETag($fichaTec->getId().'_datos');
        $response->setLastModified(($this->get('kernel')->getEnvironment() == 'dev') ? new \DateTime('NOW') : $fichaTec->getUltimaLectura() );

        $response->setPublic();
        // verifica que la respuesta no se ha modificado para la petición dada
        if ($response->isNotModified($this->getRequest())) {
            // devuelve inmediatamente la respuesta 304 de la caché
            return $response;
        } else {
            $resp = array();            

            $em = $this->getDoctrine()->getManager();

            $fichaRepository = $em->getRepository('IndicadoresBundle:FichaTecnica');

            $fichaRepository->crearIndicador($fichaTec);
            $resp = $fichaRepository->getDatosIndicador($fichaTec);
            $respj = json_encode($resp);

            $response->setContent($respj);

            return $response;
        }
    }

    /**
     * @Get("/rest-service/indicadores", options={"expose"=true})
     * @Rest\View
     */
    public function getIndicadoresAction() {
        
        $response = new Response();
        $em = $this->getDoctrine()->getManager();

        $resp = array();
        

        //Recuperar todos los indicadores disponibles
        $indicadores = $em->getRepository("IndicadoresBundle:FichaTecnica")->findBy(array(), array('nombre' => 'ASC'));
        
        foreach($indicadores as $ind){
            $indicador = array();
            
            $indicador['id'] = $ind->getId();
            $indicador['nombre'] = $ind->getNombre();
            $indicador['unidadMedida'] = $ind->getUnidadMedida();
            $indicador['formula'] = $ind->getFormula();
            
            $variables = array();
            foreach($ind->getVariables() as $var){
                $variables[] = array('iniciales'=>$var->getIniciales(), 'nombre'=>$var->getNombre());
            }
            $indicador['variables'] = $variables;
                        
            $indicador['dimensiones'] = $ind->getCamposIndicador();
            
            $resp[] = $indicador;
        }        

        $response->setContent(json_encode($resp));

        return $response;
    }

}
