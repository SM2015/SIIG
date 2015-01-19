<?php

namespace MINSAL\CostosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class CampoAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'codigo' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('significadoCampo', null, array('label'=> $this->getTranslator()->trans('_significado_campo_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('formularios', null, array('label'=> $this->getTranslator()->trans('_formulario_'), 'expanded' => true, 'multiple' => true, 'by_reference' => false))
            ->add('formula', null, array('label'=> $this->getTranslator()->trans('_formula_')))
            ->add('reglaValidacion', null, array('label'=> $this->getTranslator()->trans('_regla_validacion_')))
            ->add('msjValidacion', null, array('label'=> $this->getTranslator()->trans('_msj_validacion_')))
            ->add('posicion', null, array('label'=> $this->getTranslator()->trans('_posicion_')))
            ->add('ancho', null, array('label'=> $this->getTranslator()->trans('_ancho_')))
            ->add('esEditable', null, array('label'=> $this->getTranslator()->trans('_es_editable_')))
            ->add('oculto', null, array('label'=> $this->getTranslator()->trans('_oculto_')))
            ->add('tipoDato', null, array('label'=> $this->getTranslator()->trans('_tipo_dato_')))
            ->add('tipoControl', null, array('label'=> $this->getTranslator()->trans('_tipo_control_')))            
            ->add('alineacion', null, array('label'=> $this->getTranslator()->trans('_alineacion_')))
            ->add('formato', null, array('label'=> $this->getTranslator()->trans('_formato_')))
            ->add('origen', null, array('label'=> $this->getTranslator()->trans('_origen_campo_')))
            ->add('grupoColumnas', null, array('label'=> $this->getTranslator()->trans('_grupo_columnas_')))
            ->add('origenPivote', null, array('label'=> $this->getTranslator()->trans('_origen_pivote_')))            
            ->setHelps(array(
                'formula' => $this->getTranslator()->trans('_ayuda_formula_campo_'),
                'reglaValidacion' => $this->getTranslator()->trans('_ayuda_validacion_campo_'),
                'origen' => $this->getTranslator()->trans('_ayuda_origen_campo_'),
                'origenPivote' => $this->getTranslator()->trans('_ayuda_origen_pivote_')
            ))
            
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('formularios', null, array('label'=> $this->getTranslator()->trans('_formulario_')))
            ->add('significadoCampo', null, array('label'=> $this->getTranslator()->trans('_significado_campo_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper            
            ->add('significadoCampo', null, array('label'=> $this->getTranslator()->trans('_significado_campo_')))
            ->addIdentifier('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_'))) 
            ->add('posicion', null, array('label'=> $this->getTranslator()->trans('_posicion_')))
            ->add('formularios', null, array('label'=> $this->getTranslator()->trans('_formulario_')))
            ->add('_action', 'actions', array(
            'actions' => array(
                'edit' => array(),
                'delete' => array(),
            )))
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
}
