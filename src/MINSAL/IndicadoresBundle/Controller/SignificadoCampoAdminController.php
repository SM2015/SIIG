<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;

//use Symfony\Component\Console\Input\ArrayInput;

class SignificadoCampoAdminController extends Controller {    
    public function editAction($id = null)
    {
        $repo = $this->getDoctrine()->getEntityManager()->getRepository('IndicadoresBundle:OrigenDatos');        
        $this->admin->setRepository($repo);
        
        return parent::editAction($id);

    }
    
    public function createAction()
    {
        $repo = $this->getDoctrine()->getEntityManager()->getRepository('IndicadoresBundle:OrigenDatos');        
        $this->admin->setRepository($repo);
        
        return parent::createAction();

    }
}