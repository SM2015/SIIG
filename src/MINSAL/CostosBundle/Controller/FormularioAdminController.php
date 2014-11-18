<?php

namespace MINSAL\CostosBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;

class FormularioAdminController extends Controller
{       
    public function rrhhValorPagadoAction()
    {        
        $em = $this->getDoctrine()->getManager();
        
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhValorPagado')));
                
        $origenes = array();
        $pivotes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigen() or $c->getSignificadoCampo()->getCatalogo() != ''){
                $origenes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenCampo($c);
            }
            if ($c->getOrigenPivote()){
                $pivotes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c);
            }
        }
        return $this->render('CostosBundle:Formulario:rrhhValorPagado.html.twig', array('Frm' => $Frm, 
            'origenes' => $origenes,
            'pivotes' => $pivotes,
            'url' => 'get_grid_data'));
    }
}
