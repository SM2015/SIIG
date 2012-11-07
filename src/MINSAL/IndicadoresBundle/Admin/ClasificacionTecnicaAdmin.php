<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class ClasificacionTecnicaAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );
    
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper            
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))
            ->add('comentario', 'textarea', array('required'=>false, 'label'=> $this->getTranslator()->trans('comentario')))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper            
            ->addIdentifier('descripcion', null, array('label'=> $this->getTranslator()->trans('descripcion')))
            ->add('comentario', null, array('required'=>false, 'label'=> $this->getTranslator()->trans('comentario')))
        ;
    }

    public function getBatchActions(){
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
}
?>
