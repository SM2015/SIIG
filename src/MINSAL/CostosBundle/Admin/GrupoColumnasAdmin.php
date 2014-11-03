<?php

namespace MINSAL\CostosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class GrupoColumnasAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('grupoPadre', null, array('label'=> $this->getTranslator()->trans('_grupo_padre_')))
            ->add('formulario', null, array('label'=> $this->getTranslator()->trans('_formulario_')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('grupoPadre', null, array('label'=> $this->getTranslator()->trans('_grupo_padre_')))
            ->add('formulario', null, array('label'=> $this->getTranslator()->trans('_formulario_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_'))) 
            ->add('grupoPadre', null, array('label'=> $this->getTranslator()->trans('_grupo_padre_')))
            ->add('formulario', null, array('label'=> $this->getTranslator()->trans('_formulario_')))
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
}
