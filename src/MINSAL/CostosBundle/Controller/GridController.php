<?php

namespace MINSAL\CostosBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use MINSAL\CostosBundle\Entity\Formulario;

class GridController extends Controller
{
    /**
     * @Route("/grid/{id}", name="get_grid_data", options={"expose"=true})
     * @Template()
     */
    public function getGridDataAction(Formulario $Frm, Request $request)
    {
        $response = new Response();
        $em = $this->getDoctrine()->getManager();        
        
        $data = $em->getRepository('CostosBundle:Formulario')->getDatos($Frm, $request);

        if (count($data) == 0){
            $response->setContent('{"estado" : "error", "msj": "' . $this->get('translator')->trans('_no_datos_') . '"}');
        }
        else {
            $data_ = '';
            $ultimo = array_pop($data);
            foreach ($data as $f){
                $data_ .= '{'.  str_replace('=>', ':', $f['datos']). '},';
            }
            $data_ .= '{'.  str_replace('=>', ':', $ultimo['datos']). '}';

            $response->setContent('{"estado" : "ok", "data": ['. $data_. ']}');
        }
        return $response;
    }
    
    /**
     * @Route("/grid/save/{id}", name="set_grid_data", options={"expose"=true})
     * @Template()
     */
    public function setGridDataAction(Formulario $Frm, Request $request)
    {
        $response = new Response();
        $em = $this->getDoctrine()->getManager();
        
        $guardar = $em->getRepository('CostosBundle:Formulario')->setDatos($Frm, $request);
        
        if ($guardar){
            $response->setContent('ok');
        }
        else{
            $response->setContent($this->get('translator')->trans('_error_datos_no_guardados_'));
        }
        return $response;
    }
}
