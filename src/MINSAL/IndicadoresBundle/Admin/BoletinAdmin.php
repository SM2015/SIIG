<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
class BoletinAdmin extends Admin
{
	protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );	

	public function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('nombre')
            ->add('sala')
            ->add('grupo')
			->add('creado')
			->add('actualizado')
        ;
    }
	public function configureFormFields(FormMapper $formMapper) 
	{
        $formMapper
			->with('Boletin')
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
				->add('sala', null, array('label' => $this->getTranslator()->trans('sala'), 'required' => true))
				->add('token', 'hidden', array('label' => $this->getTranslator()->trans('token')))
				->add('grupo', null, array('label' => $this->getTranslator()->trans('grupo'), 'required' => true))				
				->add('enviar', 'checkbox', array('label' => $this->getTranslator()->trans('enviar'), 'required' => false))
			->end()
        ;
    }
	public function configureDatagridFilters(DatagridMapper $datagridMapper) 
	{
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
        ;
    }

    public function configureListFields(ListMapper $listMapper) 
	{
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
				->add('sala', null, array('label' => $this->getTranslator()->trans('sala')))
				->add('grupo', null, array('label' => $this->getTranslator()->trans('grupo')))
                ->add('creado', null, array('label' => $this->getTranslator()->trans('creado')))
				->add('actualizado', null, array('label' => $this->getTranslator()->trans('actualizado')))
        ;
    }
	public function validate(ErrorElement $errorElement, $object)
    {
        $errorElement
        ->with('nombre')
        	->addConstraint(new \MINSAL\IndicadoresBundle\Validator\OnlyAlphanumeric())
	        ->assertLength(array('max' => 100))
    	    ->end()
    	;
    }

	public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
	public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:campo-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }    
    
    public function getExportFields()
    {
    	return array('id', 'nombre', 'sala', 'grupo', 'creado', 'actualizado');
    }
}
?>