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
        $clasificacionUso = $em->getRepository("IndicadoresBundle:ClasificacionUso")->findAll();
        $usuario = $this->getUser();
        
        //Luego agregar un método para obtener la clasificacion de uso por defecto del usuario
        if ($usuario->getClasificacionUso())
            $clasificacionUsoPorDefecto = $usuario->getClasificacionUso();
        else
            $clasificacionUsoPorDefecto = $clasificacionUso[0];
        $categorias = $em->getRepository("IndicadoresBundle:ClasificacionTecnica")->findBy(array('clasificacionUso'=>$clasificacionUsoPorDefecto));
        
        

        $usuarioIndicadores = ($usuario->hasRole('ROLE_SUPER_ADMIN')) ?
                $em->getRepository("IndicadoresBundle:FichaTecnica")->findAll() :
                $usuario->getIndicadores();
        $indicadores_por_usuario = array();
        $indicadores_clasificados = array();
        foreach ($usuarioIndicadores as $ind){
            $indicadores_por_usuario[] = $ind->getId();
        }
        
        $categorias_indicador = array();
        foreach ($categorias as $cat) {
            $categorias_indicador[$cat->getId()]['cat'] = $cat;
            $categorias_indicador[$cat->getId()]['indicadores'] = array();
            $indicares_por_categoria = $cat->getIndicadores();
            foreach ($indicares_por_categoria as $ind) {
                if (in_array($ind->getId(), $indicadores_por_usuario)){
                    $categorias_indicador[$cat->getId()]['indicadores'][] = $ind;
                    $indicadores_clasificados[] = $ind->getId();
                }
            }
        }
        
        $indicadores_no_clasificados = array();
        foreach($usuarioIndicadores as $ind){
            if (!in_array($ind->getId(), $indicadores_clasificados))
                    $indicadores_no_clasificados[] = $ind;
        }

        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:tablero.html.twig', array(
                    'categorias' => $categorias_indicador,
                    'clasificacionUso' => $clasificacionUso,
                    'indicadores_no_clasificados' => $indicadores_no_clasificados
                ));
    }

}