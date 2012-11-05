<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Sonata\AdminBundle\Datagrid\ProxyQueryInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use MINSAL\IndicadoresBundle\Entity\OrigenDatos;
use MINSAL\IndicadoresBundle\Entity\Campo;
use MINSAL\IndicadoresBundle\Entity\FusionOrigenesDatos;
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
        $req = $this->getRequest();
        $opciones = $req->get('fusionar');
        $em = $this->getDoctrine()->getEntityManager();
        
        //Crear el origen
        $origenDato = new OrigenDatos();
        $origenDato->setNombre($req->get('nombre'));
        $origenDato->setDescripcion($req->get('descripcion'));
        $origenDato->setEsFusionado(true);
        
        $campos = array();
        $origen_fusionar_campos= array();
        foreach ($req->get('origenes_fusionados') as $k=>$origen_id){$origen_fusionar_campos[$k]='';}
        
        foreach ($opciones as $k => $opcion){
            if ($opcion[0]=='')
                continue;
            $campos[$k] = new Campo();
            
            //El nombre viene en el primer elemento del arreglo
            $campos[$k]->setNombre(array_shift($opcion));            
            $id_primer_campo = $opcion[0];            
            // el significado y tipo lo tomo del primer campo
            $campo_fusionar = $em->find('IndicadoresBundle:Campo', $id_primer_campo);
            
            $campos[$k]->setSignificado($campo_fusionar->getSignificado());
            $campos[$k]->setTipoCampo($campo_fusionar->getTipoCampo());
            $campos[$k]->setOrigenDato($origenDato);
            $em->persist($campos[$k]);
            
            // formar la cadena con los nombre de los campos a tomar de cada origen
            foreach($opcion as $k=>$id_campo){
                $campo = $em->find('IndicadoresBundle:Campo', $id_campo);
                $origen_fusionar_campos[$k] .= "'" . $campo->getNombre() . "', ";
            }
        }
                
        foreach ($req->get('origenes_fusionados') as $k=>$origen_id){
            $origenFu = $em->find('IndicadoresBundle:OrigenDatos', $origen_id);
            
            $fusion[$k] = new FusionOrigenesDatos();
            
            $fusion[$k]->setOrigenDatos($origenDato);
            $fusion[$k]->setOrigenDatosFusionado($origenFu);            
            $fusion[$k]->setCampos(trim(trim($origen_fusionar_campos[$k]),','));
            $em->persist($fusion[$k]);
            
        }
        
        $em->persist($origenDato);
        $em->flush();
        
        $this->get('session')->setFlash('sonata_flash_success', $origenDato->getNombre() . ' '.$this->get('translator')->trans('origen_fusionado_creado'));
        return new RedirectResponse($this->admin->generateUrl('list', $this->admin->getFilterParameters()));
    }

}