<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class ImagenAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'titulo' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('titulo', null, array('label'=> $this->getTranslator()->trans('_titulo_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('sala')
            ->add('archivo', 'file', array('required'=>false))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('titulo', null, array('label'=> $this->getTranslator()->trans('_titulo_')))
            ->add('descripcion',null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('sala')
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('titulo', null, array('label'=> $this->getTranslator()->trans('_titulo_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('sala')
            ->add('archivo', 'file', array('label'=> $this->getTranslator()->trans('_archivo_'),
                                            'template' => 'IndicadoresBundle:CRUD:list_image.html.twig'))                
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
    
    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:imagen-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }
}
