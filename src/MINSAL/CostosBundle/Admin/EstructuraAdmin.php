<?php

namespace MINSAL\CostosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class EstructuraAdmin extends Admin
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
            ->add('parent', null, array('label' => $this->getTranslator()->trans('_unidad_superior_'),
                    'required' => true, 'expanded' => false,
                    'class' => 'CostosBundle:Estructura',
                    'property' => 'codigoNombre',
                    'query_builder' => function ($repository) {                        
                        return $repository->createQueryBuilder('e')
                                ->add('orderBy','e.codigo');
                    }));
        ;
        if ($this->subject->getNivel() == 1){
            $formMapper->add('contratosFijos', null, array('label'=> $this->getTranslator()->trans('_contratos_fijos_'),
                'required' => true, 'expanded' => true));
        }
        if ($this->subject->getNivel() == 3){
            $formMapper->add('ubicacionDependencia', null, array('label' => $this->getTranslator()->trans('_ubicacion_'),
                    'required' => true, 'expanded' => false,
                    'class' => 'CostosBundle:Ubicacion',
                    'query_builder' => function ($repository) {                        
                        return $repository->createQueryBuilder('u')
                                ->where('u.establecimiento = '.$this->subject->getParent()->getParent()->getCodigo())
                                ->add('orderBy','u.nombre');
                    }));
        }
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('nombre', null, array('label'=> $this->getTranslator()->trans('_nombre_')))
            ->add('parent', null, array('label'=> $this->getTranslator()->trans('_unidad_superior_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('codigo', null, array('label'=> $this->getTranslator()->trans('_codigo_')))
            ->add('nombre', null, array('label'=> $this->getTranslator()->trans('_nombre_')))
            ->add('nivel', null, array('label'=> $this->getTranslator()->trans('_nivel_')))
            ->add('parent', null, array('label'=> $this->getTranslator()->trans('_unidad_superior_')))
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
    
    public function prePersist($estructura)
    {
        if ($estructura->getParent()){
            $estructura->setNivel($estructura->getParent()->getNivel() + 1);
        } else{
            $estructura->setNivel(1);
            $this->mostrarContratos = true;
        }
    }
    
    public function preUpdate($estructura) 
    {
        if ($estructura->getParent()){
            $estructura->setNivel($estructura->getParent()->getNivel() + 1);
        } else{
            $estructura->setNivel(1);
            $this->mostrarContratos = true;
        }
    }
    
}
