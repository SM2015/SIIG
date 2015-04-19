<?php

/*
 * This file is part of the Sonata package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\UserBundle\Admin\Model;

use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\UserBundle\Admin\Model\GroupAdmin as BaseAdmin;

class GroupAdmin extends BaseAdmin
{    
    /**
     * {@inheritdoc}
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->tab($this->getTranslator()->trans('_general_'))
                ->add('name')
                ->add('roles', 'sonata_security_roles', array(
                    'expanded' => true,
                    'multiple' => true,
                    'required' => false
                ))
            ->end()
                ->end()
        ;
        if ($this->getSubject() and !$this->getSubject()->hasRole('ROLE_SUPER_ADMIN')) {
            $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
            $accion = array_pop($acciones);
            $accion = explode('?',$accion);
            if ($accion[0] == 'edit') {
                $formMapper
                    ->tab($this->getTranslator()->trans('_indicadores_y_salas_'))
                            ->add('indicadores', null, array('label' => $this->getTranslator()->trans('indicadores'), 'expanded' => true))
                            ->add('salas', null, array('label' => $this->getTranslator()->trans('_salas_situacionales_'), 'expanded' => true))
                    ->end()
                ;
            }
        }
    }
    
    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:group-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }
}
