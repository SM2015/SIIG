<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use MINSAL\IndicadoresBundle\Entity\ClasificacionUso;

class IndicadorController extends Controller {

    /**
     * @Route("/indicador/dimensiones/{id}", name="indicador_dimensiones", options={"expose"=true})
     */
    public function getDimensiones(FichaTecnica $fichaTec) {

        $resp = array();
        $em = $this->getDoctrine()->getManager();

        if ($fichaTec) {
            $resp['nombre_indicador'] = $fichaTec->getNombre();
            $resp['id_indicador'] = $fichaTec->getId();
            $resp['unidad_medida'] = $fichaTec->getUnidadMedida();
            if ($fichaTec->getCamposIndicador() != '')
                $campos = explode(',', str_replace(array("'", ' '), array('', ''), $fichaTec->getCamposIndicador()));
            else
                $campos = array();
            $dimensiones = array();
            foreach ($campos as $campo) {
                $significado = $em->getRepository('IndicadoresBundle:SignificadoCampo')
                        ->findOneByCodigo($campo);
                $dimensiones[$significado->getCodigo()]['descripcion'] = ucfirst(preg_replace('/^Identificador /i', '', $significado->getDescripcion()));
                $dimensiones[$significado->getCodigo()]['escala'] = $significado->getEscala();
                $dimensiones[$significado->getCodigo()]['origenX'] = $significado->getOrigenX();
                $dimensiones[$significado->getCodigo()]['origenY'] = $significado->getOrigenY();
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
            $resp['formula'] = $fichaTec->getFormula();
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
    public function getDatos(FichaTecnica $fichaTec, $dimension) {

        $resp = array();
        $filtro = $this->getRequest()->get('filtro');
        $verSql = ($this->getRequest()->get('ver_sql') == 'true') ? true : false;

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

        $fichaRepository = $em->getRepository('IndicadoresBundle:FichaTecnica');


        $fichaRepository->crearIndicador($fichaTec, $dimension, $filtros);
        $resp['datos'] = $fichaRepository->calcularIndicador($fichaTec, $dimension, $filtros, $verSql);
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
                    $datos_aux[] = $fila;
                }
        } else {
            $max = count($datos);
            $hasta = ($hasta == '' or $hasta > $max) ? $max : $hasta;
            $desde = ($desde == '' or $desde <= 0) ? 0 : $desde - 1;

            $cantidad = $hasta - $desde;
            $datos_aux = array_slice($datos, $desde, $cantidad, true);
        }

        $resp['datos'] = $datos_aux;
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
     * @Route("/indicador/{_locale}/change", name="change_locale")
     */
    public function changeLocaleAction($_locale) {
        $request = $this->getRequest();
        //$this->get('session')->set('_locale', $_locale);
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/tablero/usuario/change/{codigo_clasificacion}", name="change_clasificacion_uso", options={"expose"=true})
     * @ParamConverter("clasificacion", options={"mapping": {"codigo_clasificacion": "codigo"}})
     */
    public function changeClasificacionUsoAction(ClasificacionUso $clasificacion) {
        $request = $this->getRequest();
        $em = $this->getDoctrine()->getManager();
        $usuario = $this->getUser();        
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
     * @Route("/indicador/datos/{id}/{dimension}", name="indicador_ver_sql", options={"expose"=true})
     */
    public function getSQLAction($id) {
        //$this->getDatos();
    }

    /**
     * @Route("/indicador/{id}/ficha", name="get_indicador_ficha", options={"expose"=true})
     */
    public function getFichaAction(FichaTecnica $fichaTec) {

        $admin = $this->get('sonata.admin.ficha');        

        $admin->setSubject($fichaTec);

        $html = $this->render($admin->getTemplate('show'), array(
            'action' => 'show',
            'object' => $fichaTec,
            'elements' => $admin->getShow(),
            'admin' => $admin,
            'base_template' => 'IndicadoresBundle::pdf_layout.html.twig'
        ));
        return new Response($html->getContent(), 200);
        /*return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($html->getContent()), 200, array(
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'attachment; filename="ficha_tecnica.pdf"'
                )
        );*/
    }    

    /**
     * @Route("/sala/guardar", name="sala_guardar", options={"expose"=true})
     */
    public function guardarSala() {
        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();
        $resp = array();

        $sala = json_decode($req->get('datos'));
        $em->getConnection()->beginTransaction();
        try {
            if ($sala->id != '') {
                $grupoIndicadores = $em->find('IndicadoresBundle:GrupoIndicadores', $sala->id);
                //Borrar los indicadores antiguos de la sala
                foreach ($grupoIndicadores->getIndicadores() as $ind)
                    $em->remove($ind);
                $em->flush();
                //$grupoIndicadores->removeIndicadore($ind);
            } else {
                $grupoIndicadores = new \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores();
            }

            $grupoIndicadores->setNombre($sala->nombre);

            foreach ($sala->datos_indicadores as $grafico) {
                $indG = new \MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador();
                $ind = $em->find('IndicadoresBundle:FichaTecnica', $grafico->id_indicador);

                $indG->setDimension($grafico->dimension);
                $indG->setFiltro($grafico->filtros);
                $indG->setFiltroPosicionDesde($grafico->filtro_desde);
                $indG->setFiltroPosicionHasta($grafico->filtro_hasta);
                $indG->setFiltroElementos($grafico->filtro_elementos);
                $indG->setIndicador($ind);
                $indG->setPosicion($grafico->posicion);
                if (property_exists($grafico, 'orden'))
                    $indG->setOrden($grafico->orden);
                $indG->setTipoGrafico($grafico->tipo_grafico);
                $indG->setGrupo($grupoIndicadores);

                $grupoIndicadores->addIndicadore($indG);
            }

            $em->persist($grupoIndicadores);
            $em->flush();

            if ($sala->id == '') {
                $usuarioGrupoIndicadores = new \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores();

                $usuarioGrupoIndicadores->setUsuario($this->getUser());
                $usuarioGrupoIndicadores->setEsDuenio(true);
                $usuarioGrupoIndicadores->setGrupoIndicadores($grupoIndicadores);

                $em->persist($usuarioGrupoIndicadores);
                $em->flush();
            }
            $resp['estado'] = 'ok';
            $em->getConnection()->commit();
        } catch (Exception $e) {
            $em->getConnection()->rollback();
            $em->close();
            $resp['estado'] = 'error';
            throw $e;
        }

        
        $resp['id_sala'] = $grupoIndicadores->getId();
        return new Response(json_encode($resp));
    }

}
