<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Validator\ErrorElement;

class SignificadoCampoAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );
    
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper            
            ->add('codigo', null, array('label'=> $this->getTranslator()->trans('codigo')))            
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))            
            ->add('usoEnCatalogo', null, array('label'=> $this->getTranslator()->trans('uso_catalogo')))
            ->add('catalogo', null, array('label'=> $this->getTranslator()->trans('catalogo')))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))
            ->add('catalogo', null, array('label'=> $this->getTranslator()->trans('catalogo')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper            
            ->addIdentifier('codigo', null, array('label'=> $this->getTranslator()->trans('codigo')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))
            ->add('uso_en_catalogo', null, array('label'=> $this->getTranslator()->trans('uso_en_catalogo')))
            
        ;
    }

    public function getBatchActions(){
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
    
    public function validate(ErrorElement $errorElement, $object) {        
        //Marcó la opción que se usará en catálogo pero no ha elegido un catálog
        if ($object->getUsoEnCatalogo() != '' and $object->getCatalogo() == ''){
            $errorElement
                ->with('catalogo')
                    ->addViolation($this->getTranslator()->trans('elija_catalogo'))
                ->end();
        }
        
        if ($object->getUsoEnCatalogo() == '' and $object->getCatalogo() != ''){
            $errorElement
                ->with('usoEnCatalogo')
                    ->addViolation($this->getTranslator()->trans('marque_uso_en_catalogo'))
                ->end();
        }
            
    }
}
?>
