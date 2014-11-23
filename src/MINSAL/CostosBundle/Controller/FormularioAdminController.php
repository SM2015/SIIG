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
        
        return $this->render('CostosBundle:Formulario:rrhhValorPagado.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm),
            'pivotes' => $this->getPivotes($Frm),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'pk' => 'nit'));
    }
    
    public function rrhhDistribucionHoraAction()
    {        
        $em = $this->getDoctrine()->getManager();
        
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhDistribucionHora')));        
        
        return $this->render('CostosBundle:Formulario:rrhhDistribucionHora.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm),
            'pivotes' => $this->getPivotes($Frm),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'pk' => 'nit'));
    }
    
    private function getOrigenes($Frm) {
        $em = $this->getDoctrine()->getManager();
        $origenes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigen() or $c->getSignificadoCampo()->getCatalogo() != ''){
                $origenes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenCampo($c);
            }            
        }
        return $origenes;
    }
    
    private function getPivotes($Frm) {        
        $em = $this->getDoctrine()->getManager();
        $pivotes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigenPivote()){
                $pivotes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c);
            }
        }
        return $pivotes;
    }
}
