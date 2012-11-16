<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

class IndicadorController extends Controller {

    /**
     * @Route("/indicador/dimensiones/{id}", name="indicador_dimensiones", options={"expose"=true})
     */
    public function getDimensiones($id) {

        $resp = array();
        $em = $this->getDoctrine()->getEntityManager();

        $fichaTec = $em->find('IndicadoresBundle:FichaTecnica', $id);
        if ($fichaTec) {
            $resp['nombre_indicador'] = $fichaTec->getNombre();
            $resp['id_indicador'] = $id;
            $campos = explode(',', str_replace("'", '', $fichaTec->getCamposIndicador()));
            
            foreach ($campos as $campo){
                $significado = $em->getRepository('IndicadoresBundle:SignificadoCampo')
                        ->findOneByCodigo($campo);
                $dimensiones[$significado->getCodigo()] = $significado->getDescripcion();
            }
            $resp['dimensiones'] = $dimensiones;
            $resp['resultado'] = 'ok';
        }
        else
            $resp['resultado'] = 'error';
        return new Response(json_encode($resp));
    }

    /**
     * @Route("/indicador/datos/{id}/{dimension}", name="indicador_datos", options={"expose"=true})
     */
    public function getDatos($id, $dimension) {

        $resp = array();
        $em = $this->getDoctrine()->getEntityManager();
        
        $fichaTec = $em->find('IndicadoresBundle:FichaTecnica', $id);
        $fichaRepository = $em->getRepository('IndicadoresBundle:FichaTecnica');
        
        
        $fichaRepository->crearTablaIndicador($fichaTec);        
        $resp['datos'] = $fichaRepository->calcularIndicador($fichaTec, $dimension);
        
        return new Response(json_encode($resp));
    }
}
