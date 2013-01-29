<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;

//use Symfony\Component\Console\Input\ArrayInput;

class FichaTecnicaAdminController extends Controller {

    public function editAction($id = null) {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:FichaTecnica');
        $this->admin->setRepository($repo);

        return parent::editAction($id);
    }

    public function createAction() {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:FichaTecnica');
        $this->admin->setRepository($repo);

        return parent::createAction();
    }

    public function tableroAction() {
        //Recuperar las categorías existentes
        $em = $this->getDoctrine()->getManager();
        $categorias = $em->getRepository("IndicadoresBundle:ClasificacionTecnica")->findAll();
        $indicadorUsuario = $em->getRepository('IndicadoresBundle:UsuarioIndicador');
        $usuario = $this->getUser();
        $usuarioIndicadoresFavoritos = $indicadorUsuario->findBy(array('usuario' => $usuario, 'esFavorito' => true));

        $usuarioIndicadores = ($usuario->hasRole('ROLE_SUPER_ADMIN')) ?
                $em->getRepository("IndicadoresBundle:FichaTecnica")->findAll() :
                $indicadorUsuario->findBy(array('usuario' => $usuario));


        $categorias_indicador = array();
        foreach ($categorias as $cat) {
            $categorias_indicador[$cat->getId()]['cat'] = $cat;
            $categorias_indicador[$cat->getId()]['indicadores'] = array();
            foreach ($usuarioIndicadores as $ind) {
                $id_categoria = ($usuario->hasRole('ROLE_SUPER_ADMIN')) ?
                        $ind->getIdClasificacionTecnica()->getId() :
                        $ind->getIndicador()->getIdClasificacionTecnica()->getId();
                if ($id_categoria == $cat->getId())
                    $categorias_indicador[$cat->getId()]['indicadores'][] = $ind;
            }
        }

        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:tablero.html.twig', array(
                    'categorias' => $categorias_indicador,
                    'favoritos' => $usuarioIndicadoresFavoritos
                ));
    }

}