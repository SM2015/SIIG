<?php

namespace MINSAL\CostosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;

class FormularioAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'codigo' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('nombre', null, array('label'=> $this->getTranslator()->trans('_nombre_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_')))
            ->add('columnasFijas', null, array('label'=> $this->getTranslator()->trans('_columnas_fijas_')))
            ->add('origenDatos', null, array('label'=> $this->getTranslator()->trans('_origen_formulario_')))
            ->add('areaCosteo', 'choice', array('label' => $this->getTranslator()->trans('_area_costeo_'),
                        'choices' => array('rrhh'=>$this->getTranslator()->trans('_rrhh_'),
                            'ga_af'=>$this->getTranslator()->trans('_ga_af_'),
                            'ga_compromisosFinancieros' => $this->getTranslator()->trans('_ga_compromisos_financieros_'),
                            'ga_variables' => $this->getTranslator()->trans('_ga_variables_'),
                            'ga_distribucion' => $this->getTranslator()->trans('_ga_distribucion_'),
                            'ga_costos' => $this->getTranslator()->trans('_ga_costos_'),
                            'almacen_datos' => $this->getTranslator()->trans('_almacen_datos_')
                            )
                        ))
            ->add('campos', null, 
                    array('label'=> $this->getTranslator()->trans('_campos_'), 
                        'expanded' => false, 
                        'multiple' => true,
                        'by_reference' => false,
                        'class' => 'CostosBundle:Campo',
                            'query_builder' => function ($repository) {
                                return $repository->createQueryBuilder('c')
                                        ->join('c.significadoCampo', 's')
                                        ->orderBy('s.descripcion');
                            }))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('nombre', null, array('label'=> $this->getTranslator()->trans('_nombre_')))            
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('nombre', null, array('label'=> $this->getTranslator()->trans('_nombre_')))
            ->add('descripcion', null, array('label'=> $this->getTranslator()->trans('_descripcion_'))) 
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
    
    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->add('rrhhValorPagado');
        $collection->add('rrhhDistribucionHora');
        $collection->add('rrhhCostos');
        $collection->add('gaAf');
        $collection->add('gaCompromisosFinancieros');
        $collection->add('gaVariables');
        $collection->add('gaDistribucion');
        $collection->add('gaCostos');        
    }
}
