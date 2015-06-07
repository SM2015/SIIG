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
use Sonata\UserBundle\Model\UserInterface;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\UserBundle\Admin\Model\UserAdmin as BaseAdmin;

class UserAdmin extends BaseAdmin
{

    /**
     * {@inheritdoc}
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('username')
            ->add('email')
            ->add('groups')
            ->add('enabled', null, array('editable' => true))
            ->add('locked', null, array('editable' => true))
            ->add('createdAt')
        ;
        /*
        if ($this->isGranted('ROLE_ALLOWED_TO_SWITCH')) {
            $listMapper
                ->add('impersonating', 'string', array('template' => 'SonataUserBundle:Admin:Field/impersonating.html.twig'))
            ;
        }*/
    }
    /**
     * {@inheritdoc}
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
        $accion = array_pop($acciones);
        $pass_requerido = ($accion == 'create') ? true : false;
        
        $formMapper
            ->tab('User')
                ->with('Profile', array('class' => 'col-md-6'))->end()
                ->with('General', array('class' => 'col-md-6'))->end()
                //->with('Social', array('class' => 'col-md-6'))->end()
            ->end()
            ->tab('Security')
                ->with('Status', array('class' => 'col-md-4'))->end()
                ->with('Groups', array('class' => 'col-md-4'))->end()
                //->with('Keys', array('class' => 'col-md-4'))->end()
                ->with('Roles', array('class' => 'col-md-12'))->end()
            ->end()
        ;

        $now = new \DateTime();
        
        $formMapper
            ->tab('User')
                ->with('General')
                    ->add('username')
                    ->add('email')
                    ->add('plainPassword', 'text', array(
                        'required' => (!$this->getSubject() || is_null($this->getSubject()->getId()))
                    ))
                ->end()
                ->with('Profile')
                    ->add('dateOfBirth', 'sonata_type_date_picker', array(
                        'years' => range(1900, $now->format('Y')),
                        'dp_min_date' => '1-1-1900',
                        'dp_max_date' => $now->format('c'),
                        'required' => false
                    ))
                    ->add('firstname', null, array('required' => false))
                    ->add('lastname', null, array('required' => false))
                    ->add('website', 'url', array('required' => false))
                    ->add('biography', 'text', array('required' => false))
                    ->add('gender', 'sonata_user_gender', array(
                        'required' => true,
                        'translation_domain' => $this->getTranslationDomain()
                    ))
                    ->add('locale', 'locale', array('required' => false))
                    ->add('timezone', 'timezone', array('required' => false))
                    ->add('phone', null, array('required' => false))
                ->end()
            ->end()
        ;

        if ($this->getSubject() && !$this->getSubject()->hasRole('ROLE_SUPER_ADMIN')) {
            $formMapper
                ->tab('Security')
                    ->with('Status')
                        ->add('locked', null, array('required' => false))
                        ->add('expired', null, array('required' => false))
                        ->add('enabled', null, array('required' => false))
                        ->add('credentialsExpired', null, array('required' => false))
                    ->end()
                    ->with('Groups')
                        ->add('groups', 'sonata_type_model', array(
                            'required' => false,
                            'expanded' => true,
                            'multiple' => true
                        ))
                    ->end()
                    ->with('Roles')
                        ->add('realRoles', 'sonata_security_roles', array(
                            'label'    => 'form.label_roles',
                            'expanded' => true,
                            'multiple' => true,
                            'required' => false
                        ))
                    ->end()
                ->end()
            ;
        }
        
        /*$formMapper
                ->with('General')
                    ->add('id','hidden')
                    ->add('username')
                    ->add('email')
                    ->add('plainPassword', 'text', array('required' => $pass_requerido))
                    ->add('agencia', null, array('label' => $this->getTranslator()->trans('_agencia_')))
                ->end()
                ->with('Groups')
                    ->add('groups', 'sonata_type_model', array('required' => false, 'expanded' => true, 'multiple' => true))
                ->end()
                ->with($this->getTranslator()->trans('_perfil_'))
                    ->add('dateOfBirth', 'birthday', array('required' => false))
                    ->add('firstname', null, array('required' => false))
                    ->add('lastname', null, array('required' => false))
                    ->add('website', 'url', array('required' => false))
                    ->add('biography', 'text', array('required' => false))
                    ->add('gender', 'choice', array(
                        'choices' => array(
                            UserInterface::GENDER_UNKNOWN => 'gender_unknown',
                            UserInterface::GENDER_FEMALE => 'gender_female',
                            UserInterface::GENDER_MAN => 'gender_male',
                        ),
                        'required' => true,
                        'translation_domain' => $this->getTranslationDomain()
                    ))
                    ->add('locale', 'locale', array('required' => false))
                    ->add('timezone', 'timezone', array('required' => false))
                    ->add('phone', null, array('required' => false))
                ->end()
                /*->with('Social')
                    ->add('facebookUid', null, array('required' => false))
                    ->add('facebookName', null, array('required' => false))
                    ->add('twitterUid', null, array('required' => false))
                    ->add('twitterName', null, array('required' => false))
                    ->add('gplusUid', null, array('required' => false))
                    ->add('gplusName', null, array('required' => false))
                ->end()*/
        //;
        /*
        if ($this->getSubject() && !$this->getSubject()->hasRole('ROLE_SUPER_ADMIN')) {
            $formMapper
                    ->with('Management')
                        ->add('realRoles', 'sonata_security_roles', array(
                            'expanded' => true,
                            'multiple' => true,
                            'required' => false,
                            'label' => $this->getTranslator()->trans('_roles_')
                        ))
                        ->add('locked', null, array('required' => false))
                        ->add('expired', null, array('required' => false))
                        ->add('enabled', null, array('required' => false))
                        ->add('credentialsExpired', null, array('required' => false))
                    ->end()
            ;
        }*/

        /*$formMapper
                ->with($this->getTranslator()->trans('_seguridad_'))
                ->add('token', null, array('required' => false))
                ->add('twoStepVerificationCode', null, array('required' => false))
                ->end()
        ;*/
/*
        if ($this->getSubject() && !$this->getSubject()->hasRole('ROLE_SUPER_ADMIN')) {
            $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
            
            $accion = explode('?',array_pop($acciones));
            if ($accion[0] == 'edit') {
                $formMapper
                    ->with($this->getTranslator()->trans('_indicadores_y_salas_'))
                        ->add('indicadores', null, array('label' => $this->getTranslator()->trans('indicadores'), 'expanded' => true))
                        ->add('gruposIndicadores', null, array('label' => $this->getTranslator()->trans('_salas_situacionales_'),
                            'property'=>'grupoIndicadores.id',
                            'expanded' => true,
                            'mapped' => false))
                        ->add('salas', 'entity', array(
                            'class' => 'IndicadoresBundle:GrupoIndicadores',                    
                            'label' => $this->getTranslator()->trans('_salas_situacionales_'),
                            'expanded' => true,
                            'multiple' => true,
                            'mapped' => false
                            ))
                    ->end()
                ;
            }
        }*/
        
    }
        
    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:user-edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

}
