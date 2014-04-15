<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;

class SalaAccionesAdminController extends Controller
{
    /**
     * @Route("/sala/{id}/acciones/list", name="sala_acciones_custom_list", options={"expose"=true})
     */
    public function customListAction(GrupoIndicadores $sala)
    {        
        
        $resp = '<table class="table table-bordered table-striped">
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
        foreach ($sala->getAcciones() as $acc){
            $resp .=  '<TR>'.
                            '<TD>'.$acc->getFecha()->format('d/m/Y H:i').'</TD>'.
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
}
