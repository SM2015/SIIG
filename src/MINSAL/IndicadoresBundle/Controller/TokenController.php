<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use MINSAL\IndicadoresBundle\Entity\Boletin;
use MINSAL\IndicadoresBundle\Admin\BoletinAdmin;
use Symfony\Component\HttpFoundation\Session\Session;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

class TokenController extends Controller
{	
    /**
    * @Route("/publico/boletin/{sala}/{token}", name="boletin_publico", options={"expose"=true})
    */
	public function tokenAction($sala,$token)
	{
		$em = $this->getDoctrine()->getManager();
		$sa = $em->getRepository('IndicadoresBundle:Boletin')->getRuta($sala,$token);

		if (!$sa) 
			return $this->render('IndicadoresBundle:Page:error.html.twig', array(
				'error' => "No existe la sala: $sala",
				'bien' => ""));	
		else if($sa=="Error")	
			return $this->render('IndicadoresBundle:Page:error.html.twig', array(
				'error' => "El tiempo de este boletin ha expirado",
				'bien' => ""));
		else
		{	
            $sa['indicadores'] = $em->getRepository('IndicadoresBundle:GrupoIndicadores')
                    ->getIndicadoresSala($em->getRepository('IndicadoresBundle:GrupoIndicadores')->find($sa[0]['sala']));
        	$indicadores = $em->getRepository("IndicadoresBundle:FichaTecnica")->getIndicadoresPublicos();        
        	return $this->render('IndicadoresBundle:FichaTecnicaAdmin:tablero_public.html.twig', array(
                    'indicadores' => $indicadores,
        			'sala' => $sa
                ));
		}
		
	}
}
?>