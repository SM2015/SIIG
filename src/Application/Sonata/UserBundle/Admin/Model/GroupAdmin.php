<?php

/*
 * This file is part of the Sonata package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\UserBundle\Admin\Model;

use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\UserBundle\Admin\Model\GroupAdmin as BaseAdmin;
use Sonata\AdminBundle\Validator\ErrorElement;

class GroupAdmin extends BaseAdmin
{    
	protected $formOptions = array(
			'validation_groups' => array()
	);
    /**
     * {@inheritdoc}
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('name')
            ->add('roles', 'sonata_security_roles', array(
                'expanded' => true,
                'multiple' => true,
                'required' => false
            ))
        ;
        if ($this->getSubject() && !$this->getSubject()->hasRole('ROLE_SUPER_ADMIN')) {
            $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
            $accion = array_pop($acciones);
            $accion = explode('?',$accion);
            if ($accion[0] == 'edit') {
                $formMapper
                    ->with($this->getTranslator()->trans('_indicadores_y_salas_'))
                        ->add('indicadores', null, array('label' => $this->getTranslator()->trans('indicadores'), 'expanded' => true))
                        ->add('salas', null, array('label' => $this->getTranslator()->trans('_salas_situacionales_'), 'expanded' => true))
                    ->end()
                ;
            }
        }
    }
    /**
     * {@inheritdoc}
     */
    public function validate(ErrorElement $errorElement, $object)
    {
    	$onlyAlphanumeric = new \MINSAL\IndicadoresBundle\Validator\OnlyAlphanumeric();
    	$onlyAlphanumeric->message = "OnlyAlphanumeric.Message";
       	$errorElement
	    	->with('name')
	    	->addConstraint($onlyAlphanumeric)
	    	->assertLength(array('max' => 8))
	    	->end()
    	;
    	 
    	// use the validator to validate the value
    	$errorList = $this->getValidator()->validate($object, array('Profile'));
    	for ($i = 0; $i<count($errorList); $i++)
    	{
    		if ($errorList[$i]->getMessageTemplate() == 'fos_user.group.blank')
    		{
	        	$errorElement
	        		->with('name')
	        		->addViolation($this->getTranslator()->trans('registro existente, no se puede duplicar'))
	        		->end();
    		}
    		else
    		{
    			$errorElement
    			->with('username')
    			->addViolation($errorList[$i]->getMessage())
    			->end();
    		}
    	}    	
    }
    
    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:group-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }
    
    public function getExportFields()
    {
    	return array('id', 'name', 'roles');
    }
    
    public function getBatchActions()
    {
    	return array();
    }
}
