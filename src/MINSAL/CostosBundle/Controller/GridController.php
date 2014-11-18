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
        
        
        /*$nombre = array("Andrew", "Nancy", "Shelley", "Regina", "Yoshi", "Antoni", "Mayumi", "Ian","Peter", "Lars", "Petra", "Martin", "Sven", "Elio", "Beate", "Cheryl", "Michael", "Guylene");
	$subpartida = array("14", "19", "20", "24", "22", "31", "38", "34", "23", "12", "39", "20", "12", "33", "23", "13", "30", "11");        
        $tipo_recurso = array("E", "M", "AUX", "M", "M", "M", "A", "A", "A", "E", "E", "E", "E", "E", "A", "M", "M", "M");
	$partida = array("1", "8", "4", "3", "2", "9", "4", "9", "10", "14", "12", "10", "32", "43", "53", "53", "90", "11");
        $salario = array("1000", "800", "400", "300", "200", "900", "400", "900", "1000", "1400", "1200", "1000", "2000", "3000", "3000", "3000", "1000", "110");
        $horas_trabajadas = array("4", "8", "4", "6", "2", "4", "4", "8", "8", "12", "10", "10", "8", "4", "5", "5", "9", "1");
        $afp = array(true, false, true, false, false, false, true, true, true, true, false, false, false, false, true, true, true, false);
        $inpep = array(false, false, true, false, true, false, true, true, false, false, true, true, false, false, true, true, true, false);
        $ipfa = array( true, false, false, false,  true, true, false, false, true, false, true, true, false, false, true, true, true, false);
	$NIT = array("0617-050479-101-1", "0617-090479-101-1", "0617-040506-101-1", "0617-050779-101-1", "0617-050859-101-1",
                    "0617-050480-101-1", "0617-080479-101-1", "0617-968576-101-1", "0617-050879-101-1", "0617-050689-101-1",
                    "0617-050481-101-1","0617-030479-101-1", "0617-835458-101-1", "0617-050979-101-1", "0617-050579-101-1",
                    "0617-050472-101-1", "0617-060479-101-1", "0617-086754-101-1");

	$data = array();
        
        
        foreach ($NIT as $k=>$f){
          $row = array();  
          $row["NIT"] = $f;
          $row["partida"] = $partida[$k];
          $row["subpartida"] = $subpartida[$k];
          $row["afp"] = $afp[$k];
          $row["inpep"] = $inpep[$k];
          $row["ipfa"] = $ipfa[$k];
          $row["salario"] = $salario[$k];
          $row["nombre_recurso"] = $nombre[$k];
          $row["horas_trabajadas"] = $horas_trabajadas[$k];
          $row["tipo_recurso"] = $tipo_recurso[$k];
          
          $data[$k] = $row;
        }
        $response->setContent(json_encode(array('data'=>$data, 'estado'=>'ok')));
        return $response;*/
    }
}
