<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Sonata\AdminBundle\Datagrid\ProxyQueryInterface;
//use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Console\Input\ArrayInput;

class OrigenDatoAdminController extends Controller {

    public function batchActionMergeIsRelevant(array $normalizedSelectedIds, $allEntitiesSelected) {
        // here you have access to all POST parameters, if you use some custom ones
        // POST parameters are kept even after the confirmation page.
        $parameterBag = $this->get('request')->request;


        $selecciones = $parameterBag->get('idx');

        if (count($selecciones) > 1)
            return true;
        else
            return $this->get('translator')->trans('selecione_2_o_mas_elementos');
    }

    public function batchActionMerge(ProxyQueryInterface $selectedModelQuery) {
        $selecciones = $this->getRequest()->get('idx');
        $em = $this->getDoctrine()->getEntityManager();
        
        //Obtener la cantidad menor que contienen lo indicadores
        //Ese será la cantidad de campos del origen fusionado
        $menor = 0;
        foreach ($selecciones as $origen){
            $origenDato = $em->find('IndicadoresBundle:OrigenDatos', $origen);
            if (count($origenDato->getCampos()) < $menor)
                $menor = count($origenDato->getCampos());            
        }
        
        return $this->render('IndicadoresBundle:OrigenDatoAdmin:merge_selection.html.twig', 
                array('cantidad_campos' => $menor)
                );
    }

    public function batchActionLoadData(ProxyQueryInterface $selectedModelQuery) {
        //Mardar a la cola de carga de datos cada origen seleccionado        
        $selecciones = $this->getRequest()->get('idx');
        foreach ($selecciones as $origen) {
            $msg = array('id_origen_dato' => $origen);
            $this->get('old_sound_rabbit_mq.cargar_origen_datos_producer')
                    ->publish(serialize($msg));
        }
        $this->get('session')->setFlash('sonata_flash_success', $this->get('translator')->trans('flash_batch_load_data_success'));
        return new RedirectResponse($this->admin->generateUrl('list', $this->admin->getFilterParameters()));
    }

}