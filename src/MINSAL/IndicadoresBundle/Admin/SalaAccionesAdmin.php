<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;

class SalaAccionesAdmin extends Admin
{
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('sala', null, array('label'=> $this->getTranslator()->trans('_sala_')))
            ->add('acciones', null, array('label'=> $this->getTranslator()->trans('_acciones_')))
            ->add('observaciones', null, array('label'=> $this->getTranslator()->trans('_observaciones_')))
            ->add('responsables', null, array('label'=> $this->getTranslator()->trans('_responsables_')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        if (!$this->getRequest()->isXmlHttpRequest()) {
            $datagridMapper
                ->add('sala', null, array('label'=> $this->getTranslator()->trans('_sala_')))
            ;
        }
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('sala', null, array('label'=> $this->getTranslator()->trans('_sala_')))
            ->addIdentifier('fecha',null, array('label'=> $this->getTranslator()->trans('_fecha_')))
            ->add('usuario',null, array('label'=> $this->getTranslator()->trans('_usuario_')))
            ->add('acciones', null, array('label'=> $this->getTranslator()->trans('_acciones_')))
            ->add('observaciones', null, array('label'=> $this->getTranslator()->trans('_observaciones_')))
            ->add('responsables', null, array('label'=> $this->getTranslator()->trans('_responsables_')))
            
        ;
    }

    public function getBatchActions()
    {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }
    
    public function prePersist($salaAcciones){        
        $usuario = $this->getConfigurationPool()
                ->getContainer()
                ->get('security.context')
                ->getToken()
                ->getUser();
        
        $salaAcciones->setFecha(new \DateTime());
        $salaAcciones->setUsuario($usuario);
    }
        
}