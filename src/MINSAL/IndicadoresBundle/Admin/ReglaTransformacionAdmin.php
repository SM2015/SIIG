<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class ReglaTransformacionAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'diccionario' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('diccionario', null, array('label' => $this->getTranslator()->trans('javascript.diccionario_transformacion')))
                ->add('regla', 'choice', array('label' => $this->getTranslator()->trans('_regla_'),
                    'choices'   => array('=' => 'Igual'),
                    'required'=>true))
                ->add('limiteInferior', null, array('label' => $this->getTranslator()->trans('limite_inferior'),
                    'required'=>true))
                ->add('transformacion', null, array('label' => $this->getTranslator()->trans('_transformacion_')))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('diccionario', null, array('label' => $this->getTranslator()->trans('indicador')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('id', null, array('label' => $this->getTranslator()->trans('Id')))
                ->add('regla', null, array('label' => $this->getTranslator()->trans('_regla_')))
                ->add('diccionario', null, array('label' => $this->getTranslator()->trans('indicador')))
                ->add('limiteInferior', null, array('label' => $this->getTranslator()->trans('_valor_')))
                ->add('limiteSuperior', null, array('label' => $this->getTranslator()->trans('limite_superior')))
                ->add('transformacion', null, array('label' => $this->getTranslator()->trans('_transformacion_')))

        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}
