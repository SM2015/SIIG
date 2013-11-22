<?php

namespace MINSAL\IndicadoresBundle\Controller;

use MINSAL\IndicadoresBundle\Entity\Boletin;
use MINSAL\IndicadoresBundle\Admin\BoletinAdmin;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Sonata\AdminBundle\Exception\ModelManagerException;
use Symfony\Component\HttpFoundation\Request;
use Sonata\AdminBundle\Datagrid\ProxyQueryInterface;
use Sonata\AdminBundle\Admin\BaseFieldDescription;
use Sonata\AdminBundle\Util\AdminObjectAclData;
use Sonata\AdminBundle\Controller\CRUDController as ccontroller;
class CorreoController extends ccontroller
{	
    /**
     * return the Response object associated to the edit action
     *
     *
     * @param mixed $id
     *
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     * @throws \Symfony\Component\HttpKernel\Exception\NotFoundHttpException
     *
     * @return Response
     */
    public function editAction($id = null)
    {
        // the key used to lookup the template
        $templateKey = 'edit';
		
        $id = $this->get('request')->get($this->admin->getIdParameter());

        $object = $this->admin->getObject($id);

        if (!$object) {
            throw new NotFoundHttpException(sprintf('unable to find the object with id : %s', $id));
        }

        if (false === $this->admin->isGranted('EDIT', $object)) {
            throw new AccessDeniedException();
        }
		
        $this->admin->setSubject($object);

        /** @var $form \Symfony\Component\Form\Form */
        $form = $this->admin->getForm();
        $form->setData($object);
			
        if ($this->getRestMethod() == 'POST') {
            $form->bind($this->get('request'));

            $isFormValid = $form->isValid();
				
            // persist if the form was valid and if in preview mode the preview was approved
            if ($isFormValid && (!$this->isInPreviewMode() || $this->isPreviewApproved())) {
                $this->admin->update($object);
                $this->addFlash('sonata_flash_success', 'flash_edit_success');
								
				$em = $this->getDoctrine()->getManager();
				$boletin = $em->getRepository('IndicadoresBundle:boletin')->find($id);
				$boletin->setActualizado(new \DateTime());
				$em->persist($boletin);
				$em->flush();
						
				//enviar correo
				if($form->get("enviar")->getData())
					$this->enviarAction($form);
				
                if ($this->isXmlHttpRequest()) {
                    return $this->renderJson(array(
                        'result'    => 'ok',
                        'objectId'  => $this->admin->getNormalizedIdentifier($object)
                    ));
                }

                // redirect to edit mode
                return $this->redirectTo($object);
            }

            // show an error message if the form failed validation
            if (!$isFormValid) {
                if (!$this->isXmlHttpRequest()) {
                    $this->addFlash('sonata_flash_error', 'flash_edit_error');
                }
            } elseif ($this->isPreviewRequested()) {
                // enable the preview template if the form was valid and preview was requested
                $templateKey = 'preview';
                $this->admin->getShow();
            }
        }

        $view = $form->createView();

        // set the theme for the current Admin Form
        $this->get('twig')->getExtension('form')->renderer->setTheme($view, $this->admin->getFormTheme());

        return $this->render($this->admin->getTemplate($templateKey), array(
            'action' => 'edit',
            'form'   => $view,
            'object' => $object,
        ));
    }
	/**
     * return the Response object associated to the create action
     *
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     * @return Response
     */
    public function createAction()
    {
        // the key used to lookup the template
        $templateKey = 'edit';

        if (false === $this->admin->isGranted('CREATE')) {
            throw new AccessDeniedException();
        }

        $object = $this->admin->getNewInstance();

        $this->admin->setSubject($object);

        /** @var $form \Symfony\Component\Form\Form */
        $form = $this->admin->getForm();
        $form->setData($object);

        if ($this->getRestMethod()== 'POST') {
            $form->bind($this->get('request'));

            $isFormValid = $form->isValid();

            // persist if the form was valid and if in preview mode the preview was approved
            if ($isFormValid && (!$this->isInPreviewMode() || $this->isPreviewApproved())) {
                $this->admin->create($object);
				
				//enviar correo
				if($form->get("enviar")->getData())
					$this->enviarAction($form);

                if ($this->isXmlHttpRequest()) 
				{					
                    return $this->renderJson(array(
                        'result' => 'ok',
                        'objectId' => $this->admin->getNormalizedIdentifier($object)
                    ));
                }

                $this->addFlash('sonata_flash_success','flash_create_success');
                // redirect to edit mode
                return $this->redirectTo($object);
            }

            // show an error message if the form failed validation
            if (!$isFormValid) {
                if (!$this->isXmlHttpRequest()) {
                    $this->addFlash('sonata_flash_error', 'flash_create_error');
                }
            } elseif ($this->isPreviewRequested()) {
                // pick the preview template if the form was valid and preview was requested
                $templateKey = 'preview';
                $this->admin->getShow();
            }
        }

        $view = $form->createView();

        // set the theme for the current Admin Form
        $this->get('twig')->getExtension('form')->renderer->setTheme($view, $this->admin->getFormTheme());

        return $this->render($this->admin->getTemplate($templateKey), array(
            'action' => 'create',
            'form'   => $view,
            'object' => $object,
        ));
    }
	
	public function enviarAction($form)
	{
		// envio de correo a los que pertenecen al grupo
		$dato = array(array
		(
			'boletin' => $form->get("nombre")->getData(), 
			'token' =>$form->get("token")->getData(), 
			'grupo' => $form->get("grupo")->getData(), 
			'sala' => $form->get("sala")->getData()
		)); 
		
		$em = $this->getDoctrine()->getManager();
		$users = $em->getRepository('IndicadoresBundle:Boletin')->getUsuarioGrupo($form->get("grupo")->getData());

		if (!$users) 
			$this->get('session')->getFlashBag()->add('sonata_flash_error', 'No hay usuarios en el Grupo. '.$form->get("grupo")->getData());
			
		foreach($users as $usuario)
		{		
			if($usuario['enabled'])
			{						
				$array = array(array
				(
					'username' => $usuario['username'], 
					'email' => $usuario['email'], 
					'nombre' => $usuario['firstname'], 
					'apellido' => $usuario['lastname']
				)); 
				$documento1 = $this->container->getParameter('kernel.root_dir').'/../web/bundles/indicadores/images/logo_salud.png';
				$documento2 = $this->container->getParameter('kernel.root_dir').'/../web/bundles/indicadores/images/boletin.fw.png';
				$message = \Swift_Message::newInstance()
					->attach(\Swift_Attachment::fromPath($documento1))
					->attach(\Swift_Attachment::fromPath($documento2))
					->setSubject('Boletin de eTAB')
					->setFrom('eTAB@SM2015.com.mx')
					->setTo($usuario['email']) 
					->setBody($this->renderView('IndicadoresBundle:Page:email.html.twig', array('dato' => $dato,'array' => $array)),"text/html");
				$this->get('mailer')->send($message);
				$msg.="se envio boletin a: ".$usuario['username'].";  ";
			}
		}
		$this->get('session')->getFlashBag()->add('sonata_flash_success', $msg);
			
		// fin envio correo
	}
	public function tokenAction($sala,$token)
	{
		echo $sala."-".$token;
	}
}
?>