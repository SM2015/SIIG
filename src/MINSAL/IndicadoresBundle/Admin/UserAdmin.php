<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;

class UserAdmin extends Admin {

    protected $baseRouteName = 'admin_vendor_bundlename_adminclassname';
    protected $baseRoutePattern = 'usuario-indicadores';

    public function configureRoutes(RouteCollection $collection) {
        $collection->remove('create');
        $collection->remove('delete');
    }

    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'username' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->add('indicadores', null, array('label' => $this->getTranslator()->trans('indicadores'), 'expanded' => true))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('username', null, array('label' => $this->getTranslator()->trans('nombre_usuario')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->addIdentifier('username', null, array('label' => $this->getTranslator()->trans('nombre_usuario')))
                ->add('indicadores', null, array('label' => $this->getTranslator()->trans('indicadores')))
        ;
    }

}

?>