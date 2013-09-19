<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class IndicadorAlertasAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'color' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('indicador', null, array('label' => $this->getTranslator()->trans('indicador')))
                ->add('limiteInferior', null, array('label' => $this->getTranslator()->trans('limite_inferior'),
                    'required'=>true))
                ->add('limiteSuperior', null, array('label' => $this->getTranslator()->trans('limite_superior'),
                    'required'=>true))
                ->add('color', null, array('label' => $this->getTranslator()->trans('color'),
                    'required'=>true))
                ->add('comentario', null, array('label' => $this->getTranslator()->trans('comentario')))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('indicador', null, array('label' => $this->getTranslator()->trans('indicador')))
                ->add('color', null, array('label' => $this->getTranslator()->trans('color')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('id', null, array('label' => $this->getTranslator()->trans('Id')))
                ->add('indicador', null, array('label' => $this->getTranslator()->trans('indicador')))
                ->add('limiteInferior', null, array('label' => $this->getTranslator()->trans('limite_inferior')))
                ->add('limiteSuperior', null, array('label' => $this->getTranslator()->trans('limite_superior')))
                ->add('color', null, array('label' => $this->getTranslator()->trans('color')))
                ->add('comentario', null, array('label' => $this->getTranslator()->trans('comentario')))

        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}
