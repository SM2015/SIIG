<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;

class CampoAdmin extends Admin
{
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'origenDato.nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion'), 'required' => true))
                ->add('origenDato', null, array('label' => $this->getTranslator()->trans('origen_datos'), 'required' => true))
                ->add('tipoCampo', null, array('label' => $this->getTranslator()->trans('javascript.tipo'), 'required' => true))
                ->add('significado', null, array('label' => $this->getTranslator()->trans('significado'), 'required' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula'), 'required' => true))
                ->end()
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('origenDato', null, array('label' => $this->getTranslator()->trans('origen_datos')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('origenDato.nombre', null, array('label' => $this->getTranslator()->trans('origen_datos')))
                ->add('tipoCampo.descripcion', null, array('label' => $this->getTranslator()->trans('tipo')))
                ->add('significado.descripcion', null, array('label' => $this->getTranslator()->trans('significado')))
                ->add('_action', 'actions', array(
                    'actions' => array(
                        'edit' => array()
                    )
                ))
        ;
    }

    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list')
    {
        $query = parent::createQuery($context);

        return new ProxyQuery(
                $query
                        ->where($query->expr()->isNotNull($query->getRootAlias() . '.formula'))
        );
    }

    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:campo-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    public function validate(ErrorElement $errorElement, $object)
    {
        $piecesURL = explode("/", $_SERVER['REQUEST_URI']);
    	$pieceAction = $piecesURL[count($piecesURL) - 1]; // create or update
    	$pieceId = $piecesURL[count($piecesURL) - 2]; // id/edit
    	
    	$obj = new \MINSAL\IndicadoresBundle\Entity\Campo;
    	
    	$rowsRD = $this->getModelManager()->findBy('IndicadoresBundle:Campo',
    			array('nombre' => $object->getNombre()));
    	 
    	if (strpos($pieceAction,'create') !== false) // entra cuando es ALTA
    	{
    		if (count($rowsRD) > 0){
    			$errorElement
    			->with('nombre')
    			->addViolation($this->getTranslator()->trans('registro existente, no se puede duplicar'))
    			->end();
    		}
    	}
    	else // entra cuando es EDICION
    	{
    		if (count($rowsRD) > 0){
    			$obj = $rowsRD[0];
    			if ($obj->getId() != $pieceId)
    			{
    				$errorElement
    				->with('nombre')
    				->addViolation($this->getTranslator()->trans('registro existente, no se puede duplicar'))
    				->end();
    			}
    		}
    	}
        
        $vars_formula = array();
        $formula = str_replace(' ', '', $object->getFormula());
        preg_match_all('/(\{[\w]+\})/', $formula, $vars_formula);

        //Verificar que haya utilizado solo campos existentes en el origen de datos
        foreach ($object->getOrigenDato()->getCampos() as $campo) {
            if ($campo->getSignificado() and $campo->getTipoCampo()){
                $campos[$campo->getSignificado()->getCodigo()] = $campo->getTipoCampo()->getCodigo();
            }
        }

        //Verificar que todas las variables sean campos del origen de datos
        foreach ($vars_formula[0] as $var) {
            if (!array_key_exists(str_replace(array('{', '}'), '', $var), $campos)) {
                $errorElement
                        ->with('formula')
                        ->addViolation('<span style="color:red">' . $var . '</span> ' . $this->getTranslator()->trans('_variable_no_campo_'))
                        ->end();

                return;
            }
        }
        // ******** Verificar si matematicamente la fórmula es correcta
        // 1) Sustituir las variables por valores aleatorios entre 1 y 100
        foreach ($vars_formula[0] as $var) {
            $variable = str_replace(array('{', '}'), '', $var);

            if ($campos[$variable] == 'integer' or $campos[$variable] == 'float') {
                $formula = str_replace($var, rand(1, 100), $formula);
            } elseif ($campos[$variable] == 'date') {
                $formula = str_replace($var, ' current_date ', $formula);
            } else {
                $formula = str_replace($var, "'texto'", $formula);
            }
        }

        //evaluar la formula
        try {
            $sql = 'SELECT ' . $formula;

            $this->getConfigurationPool()
                    ->getContainer()
                    ->get('doctrine')
                    ->getEntityManager()
                    ->getConnection()
                    ->executeQuery($sql);
        } catch (\Doctrine\DBAL\DBALException $exc) {
            $errorElement
                    ->with('formula')
                    ->addViolation($this->getTranslator()->trans('sintaxis_invalida') . $exc->getMessage())
                    ->end();
        }
    }

}
