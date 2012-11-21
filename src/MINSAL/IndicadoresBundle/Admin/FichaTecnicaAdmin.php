<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use Sonata\AdminBundle\Route\RouteCollection;

class FichaTecnicaAdmin extends Admin {

    private $repository;
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('tema')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('objetivo', null, array('label' => $this->getTranslator()->trans('objetivo')))
                ->add('uso', null, array('label' => $this->getTranslator()->trans('uso')))
                ->add('definicionOperativa', null, array('label' => $this->getTranslator()->trans('definicion_operativa')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'), 'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula'),
                    'help' => $this->getTranslator()->trans('ayuda_ingreso_formula')
                ))
                ->add('idClasificacionNivel', null, array('label' => $this->getTranslator()->trans('clasificacion_nivel')))
                ->add('idClasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica')))
                ->add('idClasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('clasificacion_privacidad')))
                ->add('idClasificacionUso', null, array('label' => $this->getTranslator()->trans('clasificacion_uso')))
                ->add('periodos', null, array('label' => $this->getTranslator()->trans('periodicidad'), 'expanded' => true))
                ->add('idResponsableIndicador', null, array('label' => $this->getTranslator()->trans('responsable_indicador')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad'), 'required' => false))
                ->add('alertas', 'sonata_type_collection', array('label' => $this->getTranslator()->trans('alertas'),
                    'required' => false), array(
                    'edit' => 'inline',
                    'inline' => 'table',
                    'sortable' => 'position'
                ))
                ->add('estandar', null, array('label' => $this->getTranslator()->trans('estandar_nacional')))
                ->add('presentaciones', null, array('label' => $this->getTranslator()->trans('presentacion'), 'expanded' => true))
                ->add('observacion', 'textarea', array('label' => $this->getTranslator()->trans('comentario'), 'required' => false))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('idClasificacionNivel', null, array('label' => $this->getTranslator()->trans('clasificacion_nivel')))
                ->add('idClasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica')))
                ->add('idClasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('clasificacion_privacidad')))
                ->add('idClasificacionUso', null, array('label' => $this->getTranslator()->trans('clasificacion_uso')))
                ->add('idResponsableIndicador', null, array('label' => $this->getTranslator()->trans('responsable_indicador')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('tema')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('objetivo', null, array('label' => $this->getTranslator()->trans('objetivo')))                
                ->add('definicionOperativa', null, array('label' => $this->getTranslator()->trans('definicion_operativa')))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))

        ;
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

    public function validate(ErrorElement $errorElement, $object) {

        //Verificar que todos los campos esten configurados
        foreach ($object->getVariables() as $variable) {
            $campos_no_configurados = $this->getModelManager()
                    ->findBy('IndicadoresBundle:Campo', array('origenDato' => $variable->getOrigenDatos(),
                'significado' => null));

            if (count($campos_no_configurados) > 0) {
                $errorElement
                        ->with('variables')
                        ->addViolation($variable->getIniciales() . ': ' . $this->getTranslator()->trans('origen_no_configurado'))
                        ->end();
            }
        }
        //Obtener las variables marcadas
        foreach ($object->getVariables() as $variable) {
            $variables_sel[] = $variable->getIniciales();
        }

        //Obtener las variables utilizadas en la fórmula
        //Quitar todos los espacios en blanco de la fórmula
        $formula = str_replace(' ', '', $object->getFormula());
        preg_match_all('/\{([\w]+)\}/', $formula, $vars_formula);

        //Para que la fórmula sea válida la cantidad de variables seleccionadas
        //debe coincidir con las utilizadas en la fórmula
        if ((count(array_diff($variables_sel, $vars_formula[1])) > 0) or
                (count(array_diff($vars_formula[1], $variables_sel)) > 0)) {
            $errorElement
                    ->with('formula')
                    ->addViolation($this->getTranslator()->trans('vars_sel_diff_vars_formula'))
                    ->end()
            ;
        }

        // ******** Verificar si matematicamente la fórmula es correcta
        // 1) Sustituir las variables por valores aleatorios entre 1 y 100      
        $formula_check = $formula;
        $formula_valida = true;
        $result = '';
        foreach ($vars_formula[0] as $var) {
            $formula_check = str_replace($var, rand(1, 100), $formula_check);
        }

        //Verificar que no tenga letras, para evitar un ataque de inyección
        if (preg_match('/[A-Z]+/i', $formula_check) != 0) {
            $formula_valida = false;
            $mensaje = 'sintaxis_invalida_variables_entre_llaves';
        } else {
            //evaluar la formula, evitar que se muestren los errores por si los lleva
            ob_start();
            $test = eval('$result=' . $formula_check . ';');
            ob_end_clean();

            if (!is_numeric($result)) {
                $formula_valida = false;
                $mensaje = 'sintaxis_invalida';
            }
        }

        if ($formula_valida == false) {
            $errorElement
                    ->with('formula')
                    ->addViolation($this->getTranslator()->trans($mensaje))
                    ->end();
        }
    }

    public function postPersist($fichaTecnica) {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador();
    }

    public function postUpdate($fichaTecnica) {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador($fichaTecnica);
    }

    public function prePersist($fichaTecnica) {
        $this->crearCamposIndicador($fichaTecnica);
    }

    public function preUpdate($fichaTecnica) {
        $this->crearCamposIndicador($fichaTecnica);
    }

    public function crearCamposIndicador(FichaTecnica $fichaTecnica) {
        //Recuperar las variables
        $variables = $fichaTecnica->getVariables();
        $origen_campos = array();
        $origenDato = array();
        foreach ($variables as $k => $variable) {
            //Obtener la información de los campos de cada origen                        
            $origenDato[$k] = $variable->getOrigenDatos();
            foreach ($origenDato[$k]->getCampos() as $campo) {
                //La llave para considerar campo comun será el mismo tipo y significado                
                $llave = $campo->getSignificado()->getId() . '-' . $campo->getTipoCampo()->getId();
                $origen_campos[$origenDato[$k]->getId()][$llave]['significado'] = $campo->getSignificado()->getCodigo();
            }

            //Determinar los campos comunes (con igual significado)
            $aux = $origen_campos;
            $campos_comunes = array_shift($aux);
            foreach ($aux as $a) {
                $campos_comunes = array_intersect_key($campos_comunes, $a);
            }
        };
        $aux = array();
        foreach ($campos_comunes as $campo)
            $aux[$campo['significado']] = $campo['significado'];
        if (isset($aux['calculo']))
            unset($aux['calculo']);
        $campos_comunes = implode(",", $aux);
        $fichaTecnica->setCamposIndicador($campos_comunes);
    }

    public function setRepository($repository) {
        $this->repository = $repository;
    }

    protected function configureRoutes(RouteCollection $collection) {
        $collection->add('tablero');
    }
    
    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:ficha_tecnica-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

}

?>
