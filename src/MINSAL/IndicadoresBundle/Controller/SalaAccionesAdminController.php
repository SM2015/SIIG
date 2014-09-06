<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;
use MINSAL\IndicadoresBundle\Entity\SalaAcciones;

class SalaAccionesAdminController extends Controller
{
    /**
     * @Route("/sala/{id}/acciones/list", name="sala_acciones_custom_list", options={"expose"=true})
     */
    public function customListAction(GrupoIndicadores $sala)
    {        
        $em = $this->getDoctrine()->getManager();
        $usuario = $this->getUser();
      
        $acciones = $em->getRepository("IndicadoresBundle:SalaAcciones")
                        ->findBy(array('sala'=>$sala, 
                            'usuario'=>$usuario), 
                                array('fecha'=> 'ASC'));
        
        $resp = '<div class="btn-group">
                    <a class="btn btn-success" role="button" href="#addAction" data-toggle="modal">
                        <span class="glyphicon glyphicon-plus-sign"></span>
                        '. $this->get('translator')->trans('_agregar_accion_').
                    '</a>                    
                </div><br/><br/>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr class="sonata-ba-list-field-header">
                            <TH>Fecha</TH>
                            <TH>Usuario</TH>
                            <TH>Acciones</TH>
                            <TH>Observaciones</TH>
                            <TH>Responsables</TH>
                        </tr>
                    </thead>
                    <tbody>';                
        foreach ($acciones as $acc){
            $resp .=  '<TR>'.
                            '<TD>'.$acc->getFecha()->format('d/m/Y H:m:s').'</TD>'.
                            '<TD>'.$acc->getUsuario().'</TD>'.
                            '<TD>'.$acc->getAcciones(). '</TD>'.
                            '<TD>'.$acc->getObservaciones() . '</TD>' . 
                            '<TD>'.$acc->getResponsables() . '</TD>'.                            
                    '</TR>';
        }
        $resp .= '</tbody>
                </table>';
        return new Response($resp);
    }
    
    /**
     * @Route("/sala/{id}/accion/guardar", name="accion_guardar", options={"expose"=true})
     */
    public function guardarAccion(GrupoIndicadores $sala) {
        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();        
        $usuario = $this->getUser();
        $resp = array();

        $datos = json_decode($req->get('datos'));
        
        $salaAcciones = new SalaAcciones();
        $salaAcciones->setSala($sala);
        $salaAcciones->setAcciones($datos->acciones);
        $salaAcciones->setObservaciones($datos->observaciones);
        $salaAcciones->setResponsables($datos->responsables);
        $salaAcciones->setFecha(new \DateTime());
        $salaAcciones->setUsuario($usuario);
        
        $em->getConnection()->beginTransaction();
        try {
            $em->persist($salaAcciones);
            $em->flush();
            $resp['estado'] = 'ok';
            $em->getConnection()->commit();
        } catch (Exception $e) {
            $em->getConnection()->rollback();
            $em->close();
            $resp['estado'] = 'error';
            throw $e;
        }
        
        return new Response(json_encode($resp));
    }
}
