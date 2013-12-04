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
        '_sort_order' => 'ASC'
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        if($this->getRequest()->get('_sonata_admin') == 'sonata.admin.indicador_alertas') {
            $formMapper
                ->add('indicador', null, array('label' => $this->getTranslator()->trans('indicador')));
        }
        
        $formMapper
                //->add('indicador', null, array('label' => $this->getTranslator()->trans('indicador')))
                ->add('limiteInferior', null, array('label' => $this->getTranslator()->trans('_alerta_limite_inferior_'),
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

    public function getExportFields()
    {
    	return array('id', 'indicador', 'limite_inferior', 'limite_superior', 'color', 'comentario');
    }
    
}
