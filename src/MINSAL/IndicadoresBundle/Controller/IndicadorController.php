<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use MINSAL\IndicadoresBundle\Entity\ClasificacionUso;
use MINSAL\IndicadoresBundle\Entity\User;
use MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;
use MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores;

class IndicadorController extends Controller
{
    /**
     * @Route("/profile/show", name="fos_user_profile_show")
     */
    public function raiz()
    {
        $this->get('session')->getFlashBag()->add(
                'notice', 'change_password.flash.success'
        );

        return $this->redirect($this->generateUrl('_inicio'));
    }

    /**
     * @Route("/indicador/dimensiones/{id}", name="indicador_dimensiones", options={"expose"=true})
     */
    public function getDimensiones(FichaTecnica $fichaTec)
    {
        $resp = array();
        $em = $this->getDoctrine()->getManager();

        if ($fichaTec) {
            $resp['nombre_indicador'] = $fichaTec->getNombre();
            $resp['id_indicador'] = $fichaTec->getId();
            $resp['unidad_medida'] = $fichaTec->getUnidadMedida();
            if ($fichaTec->getCamposIndicador() != '') {
                $campos = explode(',', str_replace(array("'", ' '), array('', ''), $fichaTec->getCamposIndicador()));
            } else {
                $campos = array();
            }
            $dimensiones = array();
            foreach ($campos as $campo) {
                $significado = $em->getRepository('IndicadoresBundle:SignificadoCampo')
                        ->findOneByCodigo($campo);
                if (count($significado->getTiposGraficosArray()) > 0) {
                    $dimensiones[$significado->getCodigo()]['descripcion'] = ucfirst(preg_replace('/^Identificador /i', '', $significado->getDescripcion()));
                    $dimensiones[$significado->getCodigo()]['escala'] = $significado->getEscala();
                    $dimensiones[$significado->getCodigo()]['origenX'] = $significado->getOrigenX();
                    $dimensiones[$significado->getCodigo()]['origenY'] = $significado->getOrigenY();
                    $dimensiones[$significado->getCodigo()]['graficos'] = $significado->getTiposGraficosArray();
                }
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
                        
            //Verificar que se tiene la más antigua de las últimas lecturas de los orígenes
            //de datos del indicador
            $ultima_lectura = new \DateTime("NOW");;
            foreach($fichaTec->getVariables() as $var){
                $fecha_lectura = $em->getRepository('IndicadoresBundle:OrigenDatos')->getUltimaActualizacion($var->getOrigenDatos());
                if ($fecha_lectura < $ultima_lectura){
                    $ultima_lectura = $fecha_lectura;
                }                
            }            
            $fichaTec->setUltimaLectura(new \DateTime($ultima_lectura));
            $em->flush();
            
            $resp['ultima_lectura'] = date('d/m/Y', $fichaTec->getUltimaLectura()->getTimestamp());
            $resp['resultado'] = 'ok';
        } else {
            $resp['resultado'] = 'error';
        }
        $response = new Response(json_encode($resp));
        if ($this->get('kernel')->getEnvironment() != 'dev') {
            $response->setMaxAge($this->container->getParameter('indicador_cache_consulta'));
        }

        return $response;
    }

    /**
     * @Route("/indicador/datos/{id}/{dimension}", name="indicador_datos", options={"expose"=true})
     */
    public function getDatos(FichaTecnica $fichaTec, $dimension)
    {
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
    public function getDatosFiltrados()
    {
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
    public function getMapaAction()
    {
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
        } else
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
    public function changeLocaleAction($_locale)
    {
        $request = $this->getRequest();
        //$this->get('session')->set('_locale', $_locale);
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/tablero/usuario/change/{codigo_clasificacion}", name="change_clasificacion_uso", options={"expose"=true})
     * @ParamConverter("clasificacion", options={"mapping": {"codigo_clasificacion": "codigo"}})
     */
    public function changeClasificacionUsoAction(ClasificacionUso $clasificacion)
    {
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
    public function indicadorFavorito()
    {
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
    public function getSQLAction($id)
    {
        //$this->getDatos();
    }

    /**
     * @Route("/indicador/{id}/ficha", name="get_indicador_ficha", options={"expose"=true})
     */
    public function getFichaAction(FichaTecnica $fichaTec)
    {
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
    }

    /**
     * @Route("/sala/guardar", name="sala_guardar", options={"expose"=true})
     */
    public function guardarSala()
    {
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
                if (!empty($grafico->id_indicador)) {
                    $indG = new \MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador();
                    $ind = $em->find('IndicadoresBundle:FichaTecnica', $grafico->id_indicador);

                    $indG->setDimension($grafico->dimension);
                    $indG->setFiltro($grafico->filtros);
                    $indG->setFiltroPosicionDesde($grafico->filtro_desde);
                    $indG->setFiltroPosicionHasta($grafico->filtro_hasta);
                    $indG->setFiltroElementos($grafico->filtro_elementos);
                    $indG->setIndicador($ind);
                    $indG->setPosicion($grafico->posicion);
                    if (property_exists($grafico, 'orden')) {
                        $indG->setOrden($grafico->orden);
                    }
                    $indG->setTipoGrafico($grafico->tipo_grafico);
                    $indG->setGrupo($grupoIndicadores);

                    $grupoIndicadores->addIndicadore($indG);
                }
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
    
    /**
     * @Route("/usuario/{id}/sala/{id_sala}/{accion}", name="usuario_asignar_sala", options={"expose"=true})
     * @ParamConverter("sala", class="IndicadoresBundle:GrupoIndicadores", options={"id" = "id_sala"})
     */
    public function asignarSala(User $usuario, GrupoIndicadores $sala, $accion){
        
        $em = $this->getDoctrine()->getManager();
        if ($accion=='add'){
            $salaUsuario = new UsuarioGrupoIndicadores();
            $salaUsuario->setUsuario($usuario);
            $salaUsuario->setGrupoIndicadores($sala);
            $em->persist($salaUsuario);
        }  else {
            $salaUsuario = $em->getRepository('IndicadoresBundle:UsuarioGrupoIndicadores')
                    ->findOneBy(array('usuario' => $usuario,
                                    'grupoIndicadores' => $sala));
            $em->remove($salaUsuario);
        }        
        $em->flush();
        return new Response();
    }
    /* Ordena codigo XML para facilitar su lectura
 $xml_str= Cadena XML sin indentar
*/
public function formatXML($xml_str){
$xml_str = preg_replace('/(>)(<)(\/*)/', "$1\n$2$3", $xml_str);
    $token      = strtok($xml_str, "\n");
    $result     = '';
    $pad        = 0; 
    $matches    = array();
    while ($token !== false) : 
        if (preg_match('/.+<\/\w[^>]*>$/', $token, $matches)) : 
          $indent=0;
        elseif (preg_match('/^<\/\w/', $token, $matches)) :
          $pad--;
          $indent = 0;
        elseif (preg_match('/^<\w[^>]*[^\/]>.*$/', $token, $matches)) :
          $indent=1;
        else :
          $indent = 0; 
        endif;
        $line    = str_pad($token, strlen($token)+$pad, ' ', STR_PAD_LEFT);
        $result .= $line . "\n";
        $token   = strtok("\n");
        $pad    += $indent;
    endwhile; 
return $result;
}

/** Toma el ID de un indicador para crear Schema de Mondrian y lo agrega las fuentes de datos de Pentaho.
     * @Route("/indicador/{id}/mondrian", name="indicador_mondrian", options={"expose"=true})
     */
    public function indicadorMondrian()
    {
	$em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();
	$util = new \MINSAL\IndicadoresBundle\Util\Util();
        $indicador = $em->find('IndicadoresBundle:FichaTecnica', $req->get('id'));
        $campos= str_replace("'", '',$indicador->getCamposIndicador());
	$dims='';
	$cubo=false;	
	foreach (explode(",",$campos) as $cosa){
	 	if (strstr($cosa,'id_')){
	  	  $sig = $em->getRepository('IndicadoresBundle:SignificadoCampo')->findOneBy(array('codigo'=>trim($cosa)));
		  $catalogo = $sig->getCatalogo();
		  if($catalogo!=''){
			$dims=$dims."\n<DimensionUsage source='".ucfirst(substr(trim($cosa),3)).
			"' name='".ucfirst(substr(trim($cosa),3))."' visible='true' ".
			"foreignKey='".trim($cosa)."' highCardinality='false'/>";
			$cubo=true;
			}
		}
     	} 
       if ($cubo){
       $schemaFile=$this->container->getParameter('carpeta_siig_mondrian').'/indicador'.$req->get('id').'.mondrian.xml';
	$fh=fopen($this->container->getParameter('carpeta_siig_mondrian').'/cubo_base.txt','r');
	$base_cubo= fread($fh, filesize($this->container->getParameter('carpeta_siig_mondrian').'/cubo_base.txt'));
	fclose($fh);
	$formula = str_replace(' ', '', $indicador->getFormula());
        preg_match_all('/\{([\w]+)\}/', $formula, $vars_formula);
	$formula=strtolower($formula);
	$formula=str_replace('{','[Measures].[', $formula);
	$formula=str_replace('}',']', $formula);

	$datos= "\n<Cube name='".$indicador->getNombre()."' visible='true' cache='true' enabled='true'>".
                 "\n<Table name='tmp_ind_".$util->slug($indicador->getNombre())."' schema='public'></Table>".
    		$dims;	
	foreach ($vars_formula[1] as $myvar){
			$datos=$datos."\n<Measure name='".strtolower($myvar).
			"' column='".strtolower($myvar)."' formatString='#' aggregator='sum'></Measure>";
		}
	
    	$datos=$datos."\n <CalculatedMember name='Valor (".$indicador->getUnidadMedida().")'".
		" formula='".$formula."' dimension='Measures' visible='true'></CalculatedMember>\n</Cube>\n</Schema>";

	$fh = fopen($schemaFile, 'w');
	fwrite($fh,$this->formatXML("\n<Schema name='Indicador ".$req->get('id')."'>\n ".$base_cubo.$datos)); 
        fclose($fh);       

	$pentahoResource=$this->container->getParameter('carpeta_siig_mondrian').
		$this->container->getParameter('listado_metadata');

	$xml= simplexml_load_file($pentahoResource);
	$node=$xml->xpath('//Catalogs');
	$catalog=$node[0]->addChild('Catalog');
	$catalog->addAttribute('name','Indicador '.$req->get('id'));
	$catalog->addChild('DataSourceInfo','Provider=mondrian;DataSource='.$this->container->getParameter('conexion_bd_pentaho'));
	$catalog->addChild('Definition',$schemaFile);

	$fh = fopen($pentahoResource, 'w'); 
	fwrite($fh, $this->formatXML($xml->asXML())); 
        fclose($fh);
	}
	$em->flush(); 
	return new Response($cubo?'Se creo nuevo esquema':'No es posible crear cubo');	
  }//end function
 
    /////metodos de acceso publico para los indicadores
    /**
    * @Route("/indicador/dimensiones/public/{id}", name="indicador_dimensiones_public", options={"expose"=true})
    */
    public function getDimensionesPublic(FichaTecnica $fichaTec) {
		$em = $this->getDoctrine()->getManager();
		if ($fichaTec)
		{
			if ($fichaTec->getEsPublico())
				return $this->getDimensiones($fichaTec);
			else 
				return null;
		}
    }

    /**
    * @Route("/indicador/datos/public/{id}/{dimension}", name="indicador_datos_public", options={"expose"=true})
    */
    public function getDatosPublic(FichaTecnica $fichaTec, $dimension) {
    	$em = $this->getDoctrine()->getManager();
		if ($fichaTec)
		{
			if ($fichaTec->getEsPublico())
				return $this->getDatos($fichaTec, $dimension);
			else 
				return null;
		}
    }
  
}//end class
