<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;

//use Symfony\Component\Console\Input\ArrayInput;

class SignificadoCampoAdminController extends Controller
{
    public function editAction($id = null)
    {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:OrigenDatos');
        $this->admin->setRepository($repo);

        $vitacora = $this->get('vitacora.siig');
        $vitacora->addInfo('Se Edito significado de Campo ');

        return parent::editAction($id);

    }

    public function createAction()
    {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:OrigenDatos');
        $this->admin->setRepository($repo);

        $vitacora = $this->get('vitacora.siig');
        $vitacora->addInfo('Se Creo nuevo significado de Campo');

        return parent::createAction();

    }
}
