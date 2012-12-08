<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;

//use Symfony\Component\Console\Input\ArrayInput;

class FichaTecnicaAdminController extends Controller {    
    public function editAction($id = null)
    {
        $repo = $this->getDoctrine()->getEntityManager()->getRepository('IndicadoresBundle:FichaTecnica');        
        $this->admin->setRepository($repo);
        
        return parent::editAction($id);

    }
    
    public function createAction()
    {
        $repo = $this->getDoctrine()->getEntityManager()->getRepository('IndicadoresBundle:FichaTecnica');        
        $this->admin->setRepository($repo);
        
        return parent::createAction();

    }
    
    public function tableroAction() {
        //Recuperar las categorías existentes
        $em = $this->getDoctrine()->getEntityManager();        
        $categorias = $em->getRepository("IndicadoresBundle:ClasificacionTecnica")->findAll();
        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:tablero.html.twig', array(
            'categorias' => $categorias
        ));
    }
}