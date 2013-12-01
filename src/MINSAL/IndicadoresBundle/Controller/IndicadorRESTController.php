<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use MINSAL\IndicadoresBundle\Entity\ClasificacionUso;
use MINSAL\IndicadoresBundle\Entity\User;
use MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;
use MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores;

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
        //return $resp;
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));

        return $response;
    }
}//end class
