<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class SentenciaAdmin extends Admin {

    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'idConexion' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('idConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('nombreConsulta', null, array('label' => $this->getTranslator()->trans('nombre_consulta')))
                ->add('sentenciaSql', null, array('label' => $this->getTranslator()->trans('sentencia_sql')))
                ->add('comentario', 'textarea', array('label' => $this->getTranslator()->trans('comentario'), 'required' => false))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('idConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('nombreConsulta', null, array('label' => $this->getTranslator()->trans('nombre_consulta')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('nombreConsulta', null, array('label' => $this->getTranslator()->trans('nombre_consulta')))
                ->add('sentenciaSql', null, array('label' => $this->getTranslator()->trans('sentencia_sql')))
                ->add('comentario', null, array('label' => $this->getTranslator()->trans('comentario')))
                ->add('idConexion.nombreConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
        ;
    }

    public function validate(ErrorElement $errorElement, $object) {
        $errorElement
                ->with('sentenciaSql')
                ->assertRegex(array(
                    'pattern' => "/\bUPDATE\b|\bDELETE\b|\bINSERT\b|\bCREATE\b|\bDROP\b/i",
                    'match' => false,
                    'message' => $this->getTranslator()->trans('solo_select')
                        )
                )
                ->end()
        ;
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:sentencia-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

}

?>
