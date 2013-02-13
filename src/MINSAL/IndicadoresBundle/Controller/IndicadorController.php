<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\RedirectResponse;

class IndicadorController extends Controller {

    /**
     * @Route("/indicador/dimensiones/{id}", name="indicador_dimensiones", options={"expose"=true})
     */
    public function getDimensiones($id) {

        $resp = array();
        $em = $this->getDoctrine()->getManager();

        $fichaTec = $em->find('IndicadoresBundle:FichaTecnica', $id);
        if ($fichaTec) {
            $resp['nombre_indicador'] = $fichaTec->getNombre();
            $resp['id_indicador'] = $id;
            $resp['unidad_medida'] = $fichaTec->getUnidadMedida();
            $campos = explode(',', str_replace(array("'",' '), array('',''), $fichaTec->getCamposIndicador()));

            foreach ($campos as $campo) {
                $significado = $em->getRepository('IndicadoresBundle:SignificadoCampo')
                        ->findOneByCodigo($campo);                
                $dimensiones[$significado->getCodigo()] = $significado->getDescripcion();
            }
            $rangos_alertas_aux = array();
            foreach ($fichaTec->getAlertas() as $k => $rango) {
                $rangos_alertas_aux[$rango->getLimiteSuperior()]['limite_sup'] = $rango->getLimiteSuperior();
                $rangos_alertas_aux[$rango->getLimiteSuperior()]['limite_inf'] = $rango->getLimiteInferior();
                $rangos_alertas_aux[$rango->getLimiteSuperior()]['color'] = $rango->getColor()->getCodigo();
                $rangos_alertas_aux[$rango->getLimiteSuperior()]['comentario'] = $rango->getComentario();
            }
            ksort($rangos_alertas_aux);
            $rangos_alertas = array();
            foreach ($rangos_alertas_aux as $rango) {
                $rangos_alertas[] = $rango;
            }
            $resp['rangos'] = $rangos_alertas;
            $resp['dimensiones'] = $dimensiones;
            $resp['resultado'] = 'ok';
        }
        else
            $resp['resultado'] = 'error';
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        return $response;
    }

    /**
     * @Route("/indicador/datos/{id}/{dimension}", name="indicador_datos", options={"expose"=true})
     */
    public function getDatos($id, $dimension) {

        $resp = array();
        $filtro = $this->getRequest()->get('filtro');
        if ($filtro == null or $filtro == '')
            $filtros = null;
        else {

            $filtrObj = json_decode($filtro);
            foreach ($filtrObj as $f) {
                $filtros_dimensiones[] = $f->codigo;
                $filtros_valores[] = $f->valor;
            }
            $filtros = array_combine($filtros_dimensiones, $filtros_valores);
        }


        $em = $this->getDoctrine()->getManager();

        $fichaTec = $em->find('IndicadoresBundle:FichaTecnica', $id);
        $fichaRepository = $em->getRepository('IndicadoresBundle:FichaTecnica');


        $fichaRepository->crearTablaIndicador($fichaTec, $dimension, $this->container->getParameter('indicador_duracion_tabla_tmp'), $filtros);
        $resp['datos'] = $fichaRepository->calcularIndicador($fichaTec, $dimension, $filtros);
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        return $response;
    }

    /**
     * @Route("/indicador/datos/ordenar", name="indicador_datos_ordenar", options={"expose"=true})
     */
    public function getDatosOrdenados() {
        $ordenar_por = $this->getRequest()->get('ordenar_por');
        $modo = $this->getRequest()->get('modo');
        $datos = $this->getRequest()->get('datos');

        // Adecuar el arreglo para luego ordenarlo
        $datos_aux = array();
        foreach ($datos as $fila) {
            $datos_aux[$fila['category']] = $fila['measure'];
        }
        if ($ordenar_por == 'dimension') {
            if ($modo == 'desc')
                krsort($datos_aux);
            else
                ksort($datos_aux);
        }
        else {
            if ($modo == 'desc')
                arsort($datos_aux);
            else
                asort($datos_aux);
        }

        $datos_ordenados = array();
        $i = 0;
        foreach ($datos_aux as $k => $medida) {
            $datos_ordenados[$i]['category'] = $k;
            $datos_ordenados[$i]['measure'] = $medida;
            $i++;
        }
        $resp['datos'] = $datos_ordenados;
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        return $response;
    }

    /**
     * @Route("/indicador/datos/filtrar", name="indicador_datos_filtrar", options={"expose"=true})
     */
    public function getDatosFiltrados() {
        $desde = $this->getRequest()->get('desde');
        $hasta = $this->getRequest()->get('hasta');
        $datos = $this->getRequest()->get('datos');
        $elementos = $this->getRequest()->get('elementos');

        // Adecuar el arreglo para luego ordenarlo
        $datos_aux = array();

        if ($elementos != '') {
            $elementos = trim($elementos, '&');
            $datos_a_mostrar = explode('&', $elementos);
            foreach ($datos as $k => $fila)
                if (in_array($fila['category'], $datos_a_mostrar)) {
                    $datos_aux[$k]['category'] = $fila['category'];
                    $datos_aux[$k]['measure'] = $fila['measure'];
                }
        } else {
            $max = count($datos);
            $hasta = ($hasta == '' or $hasta > $max) ? $max : $hasta;
            $desde = ($desde == '' or $desde <= 0) ? 0 : $desde - 1;

            $cantidad = $hasta - $desde;
            $datos_aux = array_slice($datos, $desde, $cantidad, true);
        }

        $datos_filtrados = array();
        $i = 0;
        foreach ($datos_aux as $k => $dato) {
            $datos_filtrados[$i]['category'] = $dato['category'];
            $datos_filtrados[$i]['measure'] = $dato['measure'];
            $i++;
        }
        $resp['datos'] = $datos_filtrados;
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        return $response;
    }

    /**
     * @Route("/indicador/datos/mapa", name="indicador_datos_mapa", options={"expose"=true})
     */
    public function getMapaAction() {
        $em = $this->getDoctrine()->getManager();
        $dimension = $this->getRequest()->get('dimension');
        $tipo_peticion = $this->getRequest()->get('tipo_peticion');

        if ($tipo_peticion == 'mapa')
            $tipo = '';
        elseif ($tipo_peticion == 'equivalencias')
            $tipo = '-equiv';

        //Obtener el nombre del mapa asociado a la dimension
        $significado = $em->getRepository("IndicadoresBundle:SignificadoCampo")
                ->findOneBy(array('codigo' => $dimension));

        $mapa = $significado->getNombreMapa();
        if ($mapa != '') {
            try {
                $mapa = $this->renderView('IndicadoresBundle:Indicador:' . $mapa . $tipo . '.json.twig');
            } catch (\Exception $e) {
                $mapa = json_encode(array('features' => ''));
            }
        }
        else
            $mapa = json_encode(array('features' => ''));
        $headers = array('Content-Type' => 'application/json');
        $response = new Response($mapa, 200, $headers);
        if ($this->get('kernel')->getEnvironment() != 'dev')
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        return $response;
    }

    /**
     * @Route("/indicador/locale/change/{locale}", name="change_locale", options={"expose"=true})
     */
    public function changeLocaleAction($locale) {
        $request = $this->getRequest();
        $this->get('session')->set('_locale', $locale);
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/tablero/usuario/change/{codigo_clasificacion}", name="change_clasificacion_uso", options={"expose"=true})
     */
    public function changeClasificacionUsoAction($codigo_clasificacion) {
        $request = $this->getRequest();
        $em = $this->getDoctrine()->getManager();
        $usuario = $this->getUser();
        $clasificacion = $em->getRepository('IndicadoresBundle:ClasificacionUso')
                ->findOneBy(array('codigo' => $codigo_clasificacion));
        $usuario->setClasificacionUso($clasificacion);
        $em->persist($usuario);
        $em->flush();

        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/indicador/favorito", name="indicador_favorito", options={"expose"=true})
     */
    public function indicadorFavorito() {
        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();

        $indicador = $em->find('IndicadoresBundle:FichaTecnica', $req->get('id'));
        $usuario = $this->getUser();
        if ($req->get('es_favorito') == 'true') {
            //Es favorito, entonces quitar            
            $usuario->removeFavorito($indicador);
        } else {
            $usuario->addFavorito($indicador);
        }

        $em->flush();
        return new Response();
    }

    /**
     * @Route("/indicador/{id}/ficha", name="get_indicador_ficha", options={"expose"=true})
     */
    public function getFichaAction($id) {
        
        $admin = $this->get('sonata.admin.ficha');
        $object = $admin->getObject($id);

        if (!$object) {
            throw new NotFoundHttpException(sprintf('unable to find the object with id : %s', $id));
        }

        if (false === $admin->isGranted('VIEW', $object)) {
            throw new AccessDeniedException();
        }

        $admin->setSubject($object);
        
       $html = $this->render($admin->getTemplate('show'), array(
            'action'   => 'show',
            'object'   => $object,
            'elements' => $admin->getShow(),
           'admin' => $admin,
           'base_template' => 'IndicadoresBundle::pdf_layout.html.twig'
        ));        
        return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($html->getContent()), 200, array(
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'attachment; filename="ficha_tecnica.pdf"'
                )
        );
    }

}

