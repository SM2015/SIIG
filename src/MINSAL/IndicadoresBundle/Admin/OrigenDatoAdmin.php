<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Sonata\AdminBundle\Route\RouteCollection;

class OrigenDatoAdmin extends Admin {
     protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    ); 
    
    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion'), 'required' => false))
                ->with($this->getTranslator()->trans('origen_datos_sql'), array('collapsed' => true))
                    ->add('idConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion'), 'required'=>false))
                    ->add('sentenciaSql', null, array('label' => $this->getTranslator()->trans('sentencia_sql'), 'required'=>false))
                ->end()
                ->with($this->getTranslator()->trans('origen_datos_archivo'), array('collapsed' => true))
                    ->add('archivoNombre', null, array('label' => $this->getTranslator()->trans('archivo_asociado'), 'required' => false, 'read_only' => true))
                    ->add('file', 'file', array('label' => $this->getTranslator()->trans('subir_nuevo_archivo'), 'required' => false))
                ->end()                
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('idConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('idConexion', null, array('label' => $this->getTranslator()->trans('nombre_conexion')))
                ->add('esFusionado', null, array('label' => $this->getTranslator()->trans('es_fusionado')))
                ->add('sentenciaSql', null, array('label' => $this->getTranslator()->trans('sentencia_sql')))
                ->add('archivoNombre', null, array('label' => $this->getTranslator()->trans('archivo_asociado')))                
        ;
    }

    public function validate(ErrorElement $errorElement, $object) {
        if ($object->file == '' and $object->getSentenciaSql() == '') {
            $errorElement->with('sentenciaSql')
                    ->addViolation('Debe ingresar una de las dos opciones: Una sentencia SQL o un archivo')
                    ->end();
        }
        if ($object->file != '' and $object->getSentenciaSql() != '') {
            $errorElement->with('sentenciaSql')
                    ->addViolation('Solo puede ingresar una de las dos opciones: Una sentencia SQL o un archivo. No ambas')
                    ->end();
        }
        // Revisar la validación, no me reconoce los archivos con los tipos que debería
        /*
         * 'application/octet-stream',
          'text/comma-separated-values',
          'application/zip',
          'text/x-c++'
         */
        /* $errorElement
          ->with('file')
          ->assertFile(array(
          'mimeTypes' => array("application/vnd.ms-excel",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          'text/csv','application/vnd.oasis.opendocument.spreadsheet',
          'application/vnd.ms-office'
          )))
          ->end()
          ; */
    }

    public function getBatchActions() {        
        //$actions = parent::getBatchActions();
        $actions = array();
        
        $actions['merge']=array(
            'label'            => $this->trans('action_merge'),
            'ask_confirmation' => true // If true, a confirmation will be asked before performing the action
        );
        $actions['load_data']=array(
            'label'            => $this->trans('action_load_data'),
            'ask_confirmation' => true // If true, a confirmation will be asked before performing the action
        );
        

        return $actions;
    }

    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:origen_dato-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    public function prePersist($origenDato) {
        $this->saveFile($origenDato);
    }
    
    public function preUpdate($origenDato) {
        $this->saveFile($origenDato);
    }

    public function saveFile($origenDato) {
        $basepath = $this->getRequest()->getBasePath();
        $origenDato->upload($basepath);
    }
    
    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->add('merge_save','merge/save'); 
    }
    
}

?>
