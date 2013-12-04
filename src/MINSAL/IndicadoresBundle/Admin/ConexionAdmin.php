<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class ConexionAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombreBaseDatos' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('nombreConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('idMotor', null, array('label' => $this->getTranslator()->trans('motor'),
                    'required'=>true))
                ->add('puerto', null, array('label' => $this->getTranslator()->trans('puerto'), 'required' => false))
                ->add('instancia', null, array('label' => $this->getTranslator()->trans('instancia'), 'required' => false))
                ->add('ip', null, array('label' => $this->getTranslator()->trans('ip')))
                ->add('usuario', null, array('label' => $this->getTranslator()->trans('usuario')))
                ->add('clave', 'repeated', array(
                    'type' => 'password',
                    'invalid_message' => $this->getTranslator()->trans('claves_no_coinciden'),
                    'options' => array('attr' => array('class' => 'span5')),
                    'required' => true,
                    'first_options' => array('label' => $this->getTranslator()->trans('Clave')),
                    'second_options' => array('label' => 'Repetir clave'),
                ))
                ->add('nombreBaseDatos', null, array('label' => $this->getTranslator()->trans('nombre_base_datos')))
                ->add('comentario', 'textarea', array('label' => $this->getTranslator()->trans('comentario'), 'required' => false))
                /*->setHelps(array(
                    'telefono' => $this->getTranslator()->trans('Formato XXXX-XXXX')
                ))*/
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('nombreConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('idMotor', null, array('label' => $this->getTranslator()->trans('motor')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('nombreConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('idMotor', null, array('label' => $this->getTranslator()->trans('motor')))
                ->add('ip', null, array('label' => $this->getTranslator()->trans('ip')))
                ->add('nombreBaseDatos', null, array('label' => $this->getTranslator()->trans('nombre_base_datos')))
                ->add('comentario', null, array('label' => $this->getTranslator()->trans('comentario')))

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
                return 'IndicadoresBundle:CRUD:conexion-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    public function getExportFields()
    {
    	return array('id', 'nombreConexion', 'idMotor', 'puerto', 'instancia', 'ip', 'usuario', 'nombreBaseDatos', 'comentario');
    }
    
}
