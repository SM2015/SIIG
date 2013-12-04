<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Validator\ErrorElement;

class SignificadoCampoAdmin extends Admin
{
    private $repository;
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('usoEnCatalogo', null, array('label' => $this->getTranslator()->trans('uso_catalogo')))
                ->add('catalogo', 'choice', array('label' => $this->getTranslator()->trans('catalogo'),
                    'required' => false,
                    'choices' => $this->repository->getCatalogos()

                ))
                ->add('tiposGraficos', null, array('label' => $this->getTranslator()->trans('_tipos_graficos_'),
                            'expanded' => true
                        ))
                /*->with($this->getTranslator()->trans('_datos_geograficos_'), array('collapsed' => false))
                    ->add('nombreMapa', null, array('label' => $this->getTranslator()->trans('nombre_archivo_mapa')))
                    ->add('escala', null, array('label' => $this->getTranslator()->trans('_escala_')))
                    ->add('origenX', null, array('label' => $this->getTranslator()->trans('_origen_x_')))
                    ->add('origenY', null, array('label' => $this->getTranslator()->trans('_origen_y_')))*/
                ->end()
                ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('catalogo', null, array('label' => $this->getTranslator()->trans('catalogo')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('usoEnCatalogo', null, array('label' => $this->getTranslator()->trans('uso_catalogo')))
                ->add('catalogo', null, array('label' => $this->getTranslator()->trans('catalogo')))

        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

    public function validate(ErrorElement $errorElement, $object)
    {
        //Marcó la opción que se usará en catálogo pero no ha elegido un catálog
        if ($object->getUsoEnCatalogo() == true and $object->getCatalogo() != '') {
            $errorElement
                    ->with('catalogo')
                    ->addViolation($this->getTranslator()->trans('no_catalogo_y_describir_catalogo'))
                    ->end();
        }
        
        $piecesURL = explode("/", $_SERVER['REQUEST_URI']);
        $pieceAction = $piecesURL[count($piecesURL) - 1]; // create or update
        $pieceId = $piecesURL[count($piecesURL) - 2]; // id/edit
         
        $obj = new \MINSAL\IndicadoresBundle\Entity\SignificadoCampo;
         
        $rowsRD = $this->getModelManager()->findBy('IndicadoresBundle:SignificadoCampo',
        		array('codigo' => $object->getCodigo()));
        
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
    }

    public function setRepository($repository)
    {
        $this->repository = $repository;
    }

    public function prePersist($Significado)
    {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $Significado->setCodigo($util->slug($Significado->getCodigo()));
    }

    public function preUpdate($Significado)
    {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $Significado->setCodigo($util->slug($Significado->getCodigo()));
    }

}
