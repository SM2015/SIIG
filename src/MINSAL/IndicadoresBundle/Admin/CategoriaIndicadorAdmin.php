<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Doctrine\ORM\EntityRepository;

class CategoriaIndicadorAdmin extends Admin {

    private $repository;
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'descripcion' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))

        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
                ->add('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('codigo', null, array('label' => $this->getTranslator()->trans('codigo')))
                ->add('descripcion', null, array('label' => $this->getTranslator()->trans('descripcion')))
        ;
    }

    public function getBatchActions() {
        $actions = parent::getBatchActions();
        $actions['delete'] = null;
    }

}

?>