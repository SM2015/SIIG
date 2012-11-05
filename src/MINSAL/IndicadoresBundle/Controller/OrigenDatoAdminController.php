<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Sonata\AdminBundle\Datagrid\ProxyQueryInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
//use Symfony\Component\Console\Input\ArrayInput;

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
        
        $cant_origenes = count($selecciones);
        //Obtener la cantidad menor que contienen lo indicadores
        //Ese será la cantidad de campos del origen fusionado
        $menor_cantidad_campos = 1000000;
        foreach ($selecciones as $k=>$origen){
            $origenDato[$k] = $em->find('IndicadoresBundle:OrigenDatos', $origen);
            if (count($origenDato[$k]->getCampos()) < $menor_cantidad_campos)
                $menor_cantidad_campos = count($origenDato[$k]->getCampos());
        }        
        
        return $this->render('IndicadoresBundle:OrigenDatoAdmin:merge_selection.html.twig', 
                array('cantidad_campos' => $menor_cantidad_campos,
                    'cantidad_origenes' => $cant_origenes,
                    'origen_dato' => $origenDato)
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
    
    
    public function mergeSaveAction() {
        $opciones = $this->getRequest()->get('fusionar');
        $em = $this->getDoctrine()->getEntityManager();
        
        foreach ($opciones as $opcion){
            $id_primer_campo = $opcion[1];
        }
        return new Response('');
    }

}