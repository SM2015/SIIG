<?php

namespace MINSAL\CostosBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;

class FormularioAdminController extends Controller
{       
    public function rrhhValorPagadoAction()
    {        
        $em = $this->getDoctrine()->getManager();
        
        $estructura = $em->getRepository("CostosBundle:Estructura")->findBy(array(), array('codigo' => 'ASC'));
        
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhValorPagado')));
        
        return $this->render('CostosBundle:Formulario:rrhhValorPagado.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm),
            'pivotes' => $this->getPivotes($Frm),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'estructura' => $estructura,
            'pk' => 'nit'));
    }
    
    public function rrhhDistribucionHoraAction()
    {        
        $em = $this->getDoctrine()->getManager();
        
        $estructura = $em->getRepository("CostosBundle:Estructura")->findBy(array(), array('codigo' => 'ASC'));
        
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhDistribucionHora')));        
        
        return $this->render('CostosBundle:Formulario:rrhhDistribucionHora.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm),
            'pivotes' => $this->getPivotes($Frm),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'estructura' => $estructura,
            'pk' => 'nit'));
    }
    
    public function gaAfAction()
    {        
        $em = $this->getDoctrine()->getManager();
        
        $estructura = $em->getRepository("CostosBundle:Estructura")->findBy(array(), array('codigo' => 'ASC'));
        
        $Frm = array_shift($em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'gaAf')));
        
        return $this->render('CostosBundle:Formulario:gaAf.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm),
            'pivotes' => $this->getPivotes($Frm),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'estructura' => $estructura,
            'pk' => 'codigo_af'));
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
