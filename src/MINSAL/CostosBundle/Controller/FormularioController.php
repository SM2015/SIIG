<?php

namespace MINSAL\CostosBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

use MINSAL\CostosBundle\Entity\Formulario;

class FormularioController extends Controller
{
    /**
     * @Route("/frm/show/{id}", name="mostrar_formulario")
     * @Template()
     */
    public function showAction(Formulario $Frm)
    {
        $em = $this->getDoctrine()->getManager();
        $nombre = array("Andrew", "Nancy", "Shelley", "Regina", "Yoshi", "Antoni", "Mayumi", "Ian","Peter", "Lars", "Petra", "Martin", "Sven", "Elio", "Beate", "Cheryl", "Michael", "Guylene");
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
                
	$datos = json_encode(array('data'=>$data));
        
        $origenes = array();
        $pivotes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigen()){
                $origenes[$c->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenCampo($c);
            }
            if ($c->getOrigenPivote()){
                $pivotes[$c->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c);
            }
        }
        
        return array('Frm' => $Frm, 
            'datos' => $datos, 
            'origenes' => $origenes,
            'pivotes' => $pivotes);
    }
}
