<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Doctrine\ORM\EntityRepository;

class VariableCapturaAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper                
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('_codigo_')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('_descripcion_')))
                ->add('formulario', null, array('label' => $this->getTranslator()->trans('_formulario_')))
                ->add('textoAyuda', null, array('label' => $this->getTranslator()->trans('_ayuda_')))
                ->add('esPoblacion', null, array('label' => $this->getTranslator()->trans('_es_poblacion_')))
                ->add('categoria', 'entity', array('label' => $this->getTranslator()->trans('_categoria_'),
                    'class' => 'IndicadoresBundle:CategoriaVariableCaptura',
                    'property' => 'descripcion',
                    'query_builder' => function(EntityRepository $er) {
                        return $er->createQueryBuilder('c')
                                ->orderBy('c.descripcion');
                    }
                ))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('_codigo_')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('_descripcion_')))
                ->add('formulario', null, array('label' => $this->getTranslator()->trans('_formulario_')))
                ->add('categoria', null, array('label' => $this->getTranslator()->trans('_categoria_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('codigo', null, array('label' => $this->getTranslator()->trans('_codigo_')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('_descripcion_')))
                ->add('categoria', null, array('label' => $this->getTranslator()->trans('_categoria_')))
        ;
    }    

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}
