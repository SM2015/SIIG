<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class FichaTecnicaAdmin extends Admin
{
    private $repository;
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->with($this->getTranslator()->trans('_datos_generales_'))
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('esAcumulado', null, array('label' => $this->getTranslator()->trans('es_acumulado')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'), 'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula'),
                    'help' => $this->getTranslator()->trans('ayuda_ingreso_formula')
                ))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica'),
                    'required' => true, 'expanded' => true,
                    'class' => 'IndicadoresBundle:ClasificacionTecnica',
                    'query_builder' => function ($repository) {
                        return $repository->createQueryBuilder('ct')
                                ->orderBy('ct.clasificacionUso');
                    }))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_'), 'expanded' => true))
                ->add('periodo', null, array('label' => $this->getTranslator()->trans('periodicidad')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad'), 'required' => false))
                ->add('observacion', 'textarea', array('label' => $this->getTranslator()->trans('_observacion_'), 'required' => false))
                ->end()
                ->with($this->getTranslator()->trans('alertas'))
                ->add('alertas', 'sonata_type_collection', array(
                    'label' => $this->getTranslator()->trans('alertas'),
                    'required' => true), array(
                    'edit' => 'inline',
                    'inline' => 'table',
                    'sortable' => 'position'
                ))
                ->end()
                ->with($this->getTranslator()->trans('_dimensiones_'))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->end();
        $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
        $accion = array_pop($acciones);
        if ($accion == 'create') {
            $formMapper
                    ->setHelps(array(
                        'camposIndicador' => $this->getTranslator()->trans('_debe_guardar_para_ver_dimensiones_')
                    ))
            ;
        }
    }

    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('esAcumulado', null, array('label' => $this->getTranslator()->trans('es_acumulado')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'), 'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula')))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica'),
                    'required' => true, 'expanded' => true,
                    'class' => 'IndicadoresBundle:ClasificacionTecnica',
                    'query_builder' => function ($repository) {
                        return $repository->createQueryBuilder('ct')
                                ->orderBy('ct.clasificacionUso');
                    }))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_'), 'expanded' => true))
                ->add('periodo', null, array('label' => $this->getTranslator()->trans('periodicidad')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad')))
                ->add('observacion', 'string', array('label' => $this->getTranslator()->trans('_observacion_')))
                ->add('alertas', 'sonata_type_collection', array(
                    'label' => $this->getTranslator()->trans('alertas'),
                    'required' => true), array(
                    'edit' => 'inline',
                    'inline' => 'table',
                    'sortable' => 'position'
                ))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->add('ultimaLectura', null, array('label' => $this->getTranslator()->trans('_ultima_actualizacion_')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica')))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->add('_action', 'actions', array(
                'actions' => array('reporte' => array('template' => 'IndicadoresBundle:FichaTecnicaAdmin:accion_reporte.html.twig'),
                        )
               )) ;

        ;
    }

    public function getBatchActions()
    {
        $actions = array();

        $actions['ver_ficha'] = array(
            'label' => $this->trans('_ver_ficha_'),
            'ask_confirmation' => false // If true, a confirmation will be asked before performing the action
        );

        return $actions;
    }

    public function validate(ErrorElement $errorElement, $object)
    {
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
        $variables_sel = array();
        foreach ($object->getVariables() as $variable) {
            $variables_sel[] = $variable->getIniciales();
        }

        if (count($variables_sel) == 0)
            $errorElement
                    ->with('variables')
                    ->addViolation($this->getTranslator()->trans('elija_al_menos_una_variable'))
                    ->end()
            ;
        else {
            //Obtener las variables utilizadas en la fórmula
            //Quitar todos los espacios en blanco de la fórmula
            $vars_formula = array();
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
    }

    public function postPersist($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador();
    }

    public function postUpdate($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador($fichaTecnica);
    }

    public function prePersist($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        $this->setAlertas($fichaTecnica);
    }

    public function setAlertas($fichaTecnica)
    {
        $alertas = $fichaTecnica->getAlertas();
        $fichaTecnica->removeAlertas();
        if (count($alertas) > 0) {
            foreach ($alertas as $alerta) {
                $alerta->setIndicador($fichaTecnica);
                $fichaTecnica->addAlerta($alerta);
            }
        }
    }

    public function preUpdate($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        $this->setAlertas($fichaTecnica);
    }

    public function crearCamposIndicador(FichaTecnica $fichaTecnica)
    {
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getManager();
        //Recuperar las variables
        $variables = $fichaTecnica->getVariables();
        $origen_campos = array();
        $origenDato = array();
        foreach ($variables as $k => $variable) {
            //Obtener la información de los campos de cada origen
            $origenDato[$k] = $variable->getOrigenDatos();
            if ($origenDato[$k]->getEsFusionado()) {
                $significados = explode(',', $origenDato[$k]->getCamposFusionados());
                //Los tipos de campos sacarlos de uno de los orígenes de datos que ha sido fusionado
                $fusionados = $origenDato[$k]->getFusiones();
                $fusionado = $fusionados[0];
                $tipos = array();
                foreach ($fusionado->getAllFields() as $campo) {
                    $tipos[$campo->getSignificado()->getCodigo()] = $campo->getTipoCampo()->getCodigo();
                }
                foreach ($significados as $sig) {
                    $sig_ = str_replace("'", '', $sig);
                    $significado = $em->getRepository('IndicadoresBundle:SignificadoCampo')->findOneBy(array('codigo' => $sig_));
                    $llave = $significado->getCodigo() . '-' . $tipos[$sig_];
                    $origen_campos[$origenDato[$k]->getId()][$llave]['significado'] = $sig_;
                }
            } elseif ($origenDato[$k]->getEsPivote()) {
                foreach ($origenDato[$k]->getFusiones() as $or) {
                    foreach ($or->getAllFields() as $campo) {
                        //La llave para considerar campo comun será el mismo tipo y significado
                        $llave = $campo->getSignificado()->getCodigo() . '-' . $campo->getTipoCampo()->getCodigo();
                        //$llave = $campo->getSignificado()->getId();
                        $origen_campos[$origenDato[$k]->getId()][$llave]['significado'] = $campo->getSignificado()->getCodigo();
                    }
                }
            } else {
                foreach ($origenDato[$k]->getAllFields() as $campo) {
                    //La llave para considerar campo comun será el mismo tipo y significado
                    $llave = $campo->getSignificado()->getCodigo() . '-' . $campo->getTipoCampo()->getCodigo();
                    //$llave = $campo->getSignificado()->getId();
                    $origen_campos[$origenDato[$k]->getId()][$llave]['significado'] = $campo->getSignificado()->getCodigo();
                }
            }

            //Determinar los campos comunes (con igual significado e igual tipo)
            $aux = $origen_campos;
            $campos_comunes = array_shift($aux);
            foreach ($aux as $a) {
                $campos_comunes = array_intersect_key($campos_comunes, $a);
            }
        }
        $aux = array();
        foreach ($campos_comunes as $campo) {
            $aux[$campo['significado']] = $campo['significado'];
        }

        if (isset($aux['calculo'])) {
            unset($aux['calculo']);
        }

        $campos_comunes = implode(", ", $aux);
        if ($fichaTecnica->getCamposIndicador() != '') {
            //Si ya existen los campos sacar el orden que ya ha especificado el usuario
            $act = explode(',', str_replace(' ', '', $fichaTecnica->getCamposIndicador()));
            $campos_comunes = array_intersect($act, $aux);
            //agregar los posibles campos nuevos
            $campos_comunes = array_merge($campos_comunes, array_diff($aux, $act));
            $campos_comunes = implode(", ", $campos_comunes);
        }

        $fichaTecnica->setCamposIndicador($campos_comunes);
    }

    public function setRepository($repository)
    {
        $this->repository = $repository;
    }

    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->add('tablero');
        $collection->add('cubos');
        $collection->add('reporte', 
        $this->getRouterIdParameter().'/reporte');

    }

    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:ficha_tecnica-edit.html.twig';
                break;
            case 'show':
                return 'IndicadoresBundle:FichaTecnicaAdmin:show.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list')
    {
        $query = parent::createQuery($context);

        $usuario = $this->getConfigurationPool()
                ->getContainer()
                ->get('security.context')
                ->getToken()
                ->getUser();
        if ($usuario->hasRole('ROLE_SUPER_ADMIN')) {
            return new ProxyQuery($query->where('1=1'));
        } else {
            $ind = $usuario->getIndicadores();
            $indicadores = array();
            foreach ($ind as $f) {
                $indicadores[] = $f->getId();
            }

            return new ProxyQuery(
                    $query->where($query->getRootAlias() . '.id IN ('.  implode(", ", $indicadores).')')
            );
        }
    }
}
