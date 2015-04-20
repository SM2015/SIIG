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
        if (count($data) > 0){
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
        $data_ = '';
        $response = new Response();
        $em = $this->getDoctrine()->getManager();
        
        $guardar = $em->getRepository('CostosBundle:Formulario')->setDatos($Frm, $request);
        
        if ($guardar == false){
            $response->setContent('{"estado" : "error", "msj": "' . $this->get('translator')->trans('_error_datos_no_guardados_') . '"}');
        }
        else{
            $fila = array_pop($guardar);            
            $data_ .= '{'.  str_replace('=>', ':', $fila['datos']). ', "local": "si"}';

            $response->setContent('{"estado" : "ok", "data": '. $data_. '}');
        }
        return $response;
    }
    
    /**
     * @Route("/estructura/establecimiento/{codigo_establecimiento}/dependencias", name="get_dependencias", options={"expose"=true})
     */
    public function getDependencias($codigo_establecimiento, Request $request)
    {
        $response = new Response();
        $em = $this->getDoctrine()->getManager();
        
        // Dejaré las consultas aquí porque aún no está definido cómo será la 
        // estructura de tablas que tendrán estos datos
        $sql = "SELECT A.codigo, A.nombre, B.nombre as nombre_unidad_organizativa
                    FROM costos.estructura A
                    INNER JOIN costos.estructura B ON (A.parent_id = B.id)                    
                    WHERE B.parent_id IN 
                        (SELECT id FROM costos.estructura
                            WHERE codigo = '$codigo_establecimiento' 
                        )
                    ORDER BY B.nombre, A.nombre
                        ";
        $dependencias = $em->getConnection()->executeQuery($sql)->fetchAll();
        
        $dependencias_html = "<OPTION VALUE=''>".$this->get('translator')->trans('_seleccione_dependencia_')."</option>";
        foreach ($dependencias as $d){
            $dependencias_html .= "<OPTION VALUE='$d[codigo]'>$d[nombre_unidad_organizativa] -- $d[nombre]</OPTION>";
        }
        $response->setContent($dependencias_html);
        
        return $response;
        
    }
}
