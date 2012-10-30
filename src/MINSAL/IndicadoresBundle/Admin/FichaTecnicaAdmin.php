<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class FichaTecnicaAdmin extends Admin {

    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('tema'), 'required'=>false))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('objetivo', null, array('label' => $this->getTranslator()->trans('objetivo')))
                ->add('uso', null, array('label' => $this->getTranslator()->trans('uso')))
                ->add('definicionOperativa', null, array('label' => $this->getTranslator()->trans('definicion_operativa')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'),'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula')))
                ->add('idClasificacionNivel', null, array('label' => $this->getTranslator()->trans('clasificacion_nivel')))
                ->add('idClasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica')))
                ->add('idClasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('clasificacion_privacidad')))
                ->add('idClasificacionUso', null, array('label' => $this->getTranslator()->trans('clasificacion_uso')))
                ->add('periodos', null, array('label' => $this->getTranslator()->trans('periodicidad'),'expanded' => true))
                ->add('idResponsableIndicador', null, array('label' => $this->getTranslator()->trans('responsable_indicador')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad'), 'required'=>false))
                ->add('estandar', null, array('label' => $this->getTranslator()->trans('estandar_nacional')))
                ->add('observacion', 'textarea', array('label' => $this->getTranslator()->trans('comentario'), 'required'=>false))
                ->add('presentaciones', null, array('label' => $this->getTranslator()->trans('presentacion'),'expanded' => true))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('tema')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('objetivo', null, array('label' => $this->getTranslator()->trans('objetivo')))
                ->add('uso', null, array('label' => $this->getTranslator()->trans('uso')))
                ->add('definicionOperativa', null, array('label' => $this->getTranslator()->trans('definicion_operativa')))

        ;
    }

    public function validate(ErrorElement $errorElement, $object) {
        $errorElement
                ->with('confiabilidad')
                    ->assertMin(array('limit'=>0))
                    ->assertMax(array('limit'=>100))
                ->end()
        ;
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}

?>
