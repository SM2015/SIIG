<?php

/*
 * This file is part of the Sonata package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace MINSAL\IndicadoresBundle\Twig\Extension;

use Knp\Menu\MenuFactory;
use Knp\Menu\ItemInterface;
use Symfony\Component\HttpFoundation\Request;
use Sonata\AdminBundle\Admin\Pool;
use Symfony\Component\Routing\RouterInterface;
use Psr\Log\LoggerInterface;
use Sonata\AdminBundle\Twig\Extension\SonataAdminExtension as TwigExtension_;

class SonataAdminExtension extends TwigExtension_ {

    /**
     * @var Pool
     */
    protected $context;

    public function __construct(Pool $pool, RouterInterface $router, LoggerInterface $logger = null, $context) {
        $this->pool = $pool;
        $this->logger = $logger;
        $this->router = $router;
        $this->context = $context;
    }

    /**
     * Get KnpMenu
     *
     * @param Request $request
     *
     * @return ItemInterface
     */
    public function getKnpMenu(Request $request = null) {
        $menuFactory = new MenuFactory();

        $usuario = $this->context->getToken()->getUser();

        $menu = $menuFactory
                ->createItem('root')
                ->setExtra('request', $request)
        ;
        
        foreach ($this->pool->getAdminGroups() as $name => $group) {            
            $menu
                    ->addChild($name, array('label' => $group['label']))
                    ->setAttributes(
                            array(
                                'icon' => $group['icon'],
                                'label_catalogue' => $group['label_catalogue'],
                            )
                    )
                    ->setExtra('roles', $group['roles'])
            ;           
        }
        foreach ($this->pool->getAdminGroups() as $name => $group) {
            foreach ($group['items'] as $item) {
                if (array_key_exists('admin', $item) && $item['admin'] != null) {
                    $admin = $this->pool->getInstance($item['admin']);

                    if ($usuario != 'anon.') {
                        foreach ($admin->getRoutes()->getElements() as $r) {
                            $ruta = array_pop(explode('/', $r->getPath()));
                            if (in_array($ruta, array('almacen'))) {
                                if ($admin->hasRoute('almacen') and ( $usuario->hasRole('ROLE_SUPER_ADMIN') or $usuario->hasRole('ROLE_USER_CAPTURA_DATOS'))) {
                                    $menu[$name]
                                            ->addChild('_almacen_datos_', array('uri' => $admin->generateUrl('almacen')))
                                            ->setExtra('translationdomain', $admin->getTranslationDomain())
                                            ->setExtra('admin', $admin)
                                    ;
                                }
                            }
                            if (in_array($ruta, array('tablero'))) {
                                if ($admin->hasRoute('tablero') and ( $usuario->hasRole('ROLE_SUPER_ADMIN') or $usuario->hasRole('ROLE_USER_TABLERO'))) {
                                    $menu[$name]
                                            ->addChild('indicador_tablero', array('uri' => $admin->generateUrl('tablero')))
                                            ->setExtra('translationdomain', $admin->getTranslationDomain())
                                            ->setExtra('admin', $admin)
                                    ;
                                }
                            }
                            if (in_array($ruta, array('pivotTable'))) {
                                if ($admin->hasRoute('pivotTable') and ( $usuario->hasRole('ROLE_SUPER_ADMIN') or $usuario->hasRole('ROLE_USER_PIVOT_TABLE'))) {
                                    $menu[$name]
                                            ->addChild('_tabla_pivote_', array('uri' => $admin->generateUrl('tablero')))
                                            ->setExtra('translationdomain', $admin->getTranslationDomain())
                                            ->setExtra('admin', $admin)
                                    ;
                                }
                            }
                            if (in_array($ruta, array('rrhhValorPagado', 'rrhhDistribucionHora', 'rrhhCostos', 'gaVariables', 'gaAf', 
                                                'gaCompromisosFinancieros', 'gaDistribucion', 'gaCostos'))
                                ) {
                                if ( $usuario->hasRole('ROLE_SUPER_ADMIN') or $usuario->hasRole('ROLE_USER_COSTEO')) {
                                    $menu['_costeo_']
                                            ->addChild('_'.$ruta.'_', array('uri' => $admin->generateUrl($ruta)))
                                            ->setExtra('translationdomain', $admin->getTranslationDomain())
                                            ->setExtra('admin', $admin)
                                    ;
                                }
                            }
                        }                        
                    }

                    // skip menu item if no `list` url is available or user doesn't have the LIST access rights
                    if (!$admin->hasRoute('list') || !$admin->isGranted('LIST')) {
                        continue;
                    }

                    $label = $admin->getLabel();
                    $route = $admin->generateUrl('list');
                    $translationDomain = $admin->getTranslationDomain();
                } else {
                    $label = $item['label'];
                    $route = $this->router->generate($item['route'], $item['route_params']);
                    $translationDomain = $group['label_catalogue'];
                    $admin = null;
                }

                $menu[$name]
                        ->addChild($label, array('uri' => $route))
                        ->setExtra('translationdomain', $translationDomain)
                        ->setExtra('admin', $admin)
                ;
            }
        }

        return $menu;
    }

}
