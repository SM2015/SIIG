<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Validator\ErrorElement;

class AlertaAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'color' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('codigo'),
                    'help' => $this->getTranslator()->trans('_ayuda_codigo_color_')))
                ->add('color', null, array('label' => $this->getTranslator()->trans('color')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('color', null, array('label' => $this->getTranslator()->trans('color')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
                ->add('color', null, array('label' => $this->getTranslator()->trans('color')))

        ;
    }
    
    public function validate(ErrorElement $errorElement, $object)
    {
    	$codigo = $object->getCodigo();
    	$hashes = explode('#', $codigo);
	    $piecesURL = explode("/", $_SERVER['REQUEST_URI']);
	    $pieceAction = $piecesURL[count($piecesURL) - 1]; // create or update
	    $pieceId = $piecesURL[count($piecesURL) - 2]; // id/edit
	     
	    $obj = new \MINSAL\IndicadoresBundle\Entity\Alerta;
	     
	    $rowsRD = $this->getModelManager()->findBy('IndicadoresBundle:Alerta',
	    		array('codigo' => $codigo));
	    
	    if (strpos($pieceAction,'create') !== false) // entra cuando es ALTA
	    {
	    	if (count($rowsRD) > 0){
	    		$errorElement
	    		->with('codigo')
	    		->addViolation($this->getTranslator()->trans('registro existente, no se puede duplicar'))
	    		->end();
	    	}
	    }
	    else // entra cuando es EDICION
	    {
	    	if (count($rowsRD) > 0){
	    		$obj = $rowsRD[0];
	    		if ($obj->getId() != $pieceId)
	    		{
	    			$errorElement
	    			->with('codigo')
	    			->addViolation($this->getTranslator()->trans('registro existente, no se puede duplicar'))
	    			->end();
	    		}
	    	}
	    }
	    // validar formato #000000
	    if (count($hashes) > 1){
		    // # como primer caracter y solo debe haber uno
		    if (strpos($codigo, '#') != 0 || count($hashes) > 2 || strlen($codigo) != 7)
		    {
		    	$errorElement
		    	->with('codigo')
		    	->addViolation($this->getTranslator()->trans('codigo de color invalido'))
		    	->end();
		    }
	    }
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
}
