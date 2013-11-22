<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use MINSAL\IndicadoresBundle\Entity\Boletin;
use MINSAL\IndicadoresBundle\Admin\BoletinAdmin;
use Symfony\Component\HttpFoundation\Session\Session;

class TokenController extends Controller
{	
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
			return $this->render('IndicadoresBundle:Page:error.html.twig', array(
			    'error' => "",
				'bien' => "Todo bien",));
		
	}
}
?>