<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Doctrine\ORM\EntityRepository;

class VariableDatoAdmin extends Admin {

    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper                
                ->add('origenDatos', 'entity', array('label' => $this->getTranslator()->trans('origen_dato'),
                    'class' => 'IndicadoresBundle:OrigenDatos',
                    'property' => 'nombreCatalogo',
                    'query_builder' => function(EntityRepository $er) {
                        return $er->createQueryBuilder('od')
                                ->where('od.esCatalogo = :es_catalogo')
                                ->orderBy('od.nombreCatalogo', 'ASC')
                                ->setParameter('es_catalogo', 'false');
                    }
                ))
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre_variable')))
                ->add('iniciales', null, array('label' => $this->getTranslator()->trans('iniciales')))
                ->add('idFuenteDato', null, array('label' => $this->getTranslator()->trans('fuente_datos')))
                ->add('idResponsableDato', null, array('label' => $this->getTranslator()->trans('responsable_datos')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad'), 'required'=>false))
                ->add('comentario', null, array('label' => $this->getTranslator()->trans('comentario'), 'required'=>false))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('iniciales', null, array('label' => $this->getTranslator()->trans('iniciales')))
                ->add('idResponsableDato', null, array('label' => $this->getTranslator()->trans('responsable_datos')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper                
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre_variable')))
                ->add('iniciales', null, array('label' => $this->getTranslator()->trans('iniciales')))                
                ->add('origenDatos', null, array('label' => $this->getTranslator()->trans('origen_dato')))

        ;
    }

    public function validate(ErrorElement $errorElement, $object) {        
        $campos_no_configurados = $this->getModelManager()->findBy('IndicadoresBundle:Campo', 
                array('origenDato' => $object->getOrigenDatos(),
                    'significado' => null));
        
        if (count($campos_no_configurados) > 0){
            $errorElement
                ->with('origenDatos')
                    ->addViolation($this->getTranslator()->trans('origen_no_configurado'))
                ->end();
        }
            
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}

?>
