<?php

namespace MINSAL\CostosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Validator\ErrorElement;

class VariablesGastosAdministrativosAdmin extends Admin {

    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'anio' // name of the ordered field (default = the model id field, if any)
    );
    protected $baseRouteName = '';

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('estructura', null, array('label' => $this->getTranslator()->trans('_estructura_organizativa_'), 'required' => true))
                ->add('mes_anio', 'text', array('label' => $this->getTranslator()->trans('_mes_anio_')))
                ->add('totalPersonal', null, array('label' => $this->getTranslator()->trans('_total_personal_')))
                ->add('promedioUsuariosDia', null, array('label' => $this->getTranslator()->trans('_promedio_usuarios_x_dia_')))
                ->add('cantCamas', null, array('label' => $this->getTranslator()->trans('_cant_camas_')))
                ->add('cantCelulares', null, array('label' => $this->getTranslator()->trans('_cant_celulares_')))
                ->add('cantAiresMantoExterno', null, array('label' => $this->getTranslator()->trans('_cant_aires_manto_externo_')))
                ->add('areaFisica', null, array('label' => $this->getTranslator()->trans('_area_fisica_')))
                ->add('tomasConPlantaEmergencia', null, array('label' => $this->getTranslator()->trans('_tomas_con_planta_emergencia_')))
                ->add('cantidadLuminarias', null, array('label' => $this->getTranslator()->trans('_cantidad_luminarias_')))
                ->add('cantidadTelFijos', null, array('label' => $this->getTranslator()->trans('_cantidad_tel_fijos_')))
                ->add('cantidadTelSalida0', null, array('label' => $this->getTranslator()->trans('_cantidad_tel_salida_0_')))
                ->add('cantidadRadios', null, array('label' => $this->getTranslator()->trans('_cantidad_radios_')))
                ->add('areaConClimatizacionChiller', null, array('label' => $this->getTranslator()->trans('_area_con_climatizacion_chiller_')))
                ->add('tiempoUtilizacionLuminarias', null, array('label' => $this->getTranslator()->trans('_tiempo_utilizacion_luminarias_')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('anio', null, array('label' => $this->getTranslator()->trans('_anio_')))
                ->add('estructura', null, array('label' => $this->getTranslator()->trans('_estructura_organizativa_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('anio', null, array('label' => $this->getTranslator()->trans('_anio_')))
                ->addIdentifier('mes', null, array('label' => $this->getTranslator()->trans('_mes_')))
                ->add('estructura', null, array('label' => $this->getTranslator()->trans('_estructura_organizativa_')))
        ;
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'CostosBundle:CRUD:variablesGA-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    public function getNewInstance() {
        
        $instance = parent::getNewInstance();
        
        $instance->setTotalPersonal(0);
        $instance->setPromedioUsuariosDia(0);
        $instance->setCantCamas(0);
        $instance->setCantCelulares(0);
        $instance->setCantAiresMantoExterno(0);
        $instance->setAreaFisica(0);
        $instance->setTomasConPlantaEmergencia(0);
        $instance->setCantidadLuminarias(0);
        $instance->setCantidadTelFijos(0);
        $instance->setCantidadTelSalida0(0);
        $instance->setCantidadRadios(0);
        $instance->setAreaConClimatizacionChiller(0);
        $instance->setTiempoUtilizacionLuminarias(0);        

        return $instance;
    }
    
    public function prePersist($variables)
    {
        list($mes, $anio) = split('/', $variables->mes_anio);
        $variables->setMes($mes);
        $variables->setAnio($anio);
        
    }
    
    public function preUpdate($variables)
    {
        list($mes, $anio) = split('/', $variables->mes_anio);
        $variables->setMes($mes);
        $variables->setAnio($anio);
    }
    
    public function validate(ErrorElement $errorElement, $object)
    {
        /*$errorElement            
            ->with('mes_anio')
                ->assertNotEqualTo(array('value'=>'/'))
            ->end()                
        ;*/
    }

}
