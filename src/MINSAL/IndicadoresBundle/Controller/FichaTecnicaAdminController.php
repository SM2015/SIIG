<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
//use Symfony\Component\Console\Input\ArrayInput;

class FichaTecnicaAdminController extends Controller
{
    public function editAction($id = null)
    {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:FichaTecnica');
        $this->admin->setRepository($repo);

        return parent::editAction($id);
    }

    public function createAction()
    {
        $repo = $this->getDoctrine()->getManager()->getRepository('IndicadoresBundle:FichaTecnica');
        $this->admin->setRepository($repo);

        return parent::createAction();
    }

    public function tableroAction()
    {
        $em = $this->getDoctrine()->getManager();
        $clasificacionUso = $em->getRepository("IndicadoresBundle:ClasificacionUso")->findBy(array(), array('descripcion'=> 'ASC'));

        //Luego agregar un método para obtener la clasificacion de uso por defecto del usuario
        $usuario = $this->getUser();
        if ($usuario->getClasificacionUso()) {
            $clasificacionUsoPorDefecto = $usuario->getClasificacionUso();
        } else {
            $clasificacionUsoPorDefecto = $clasificacionUso[0];
        }
        $categorias = $em->getRepository("IndicadoresBundle:ClasificacionTecnica")->findBy(array('clasificacionUso' => $clasificacionUsoPorDefecto));

        //Salas por usuario
        $usuarioSalas = array();
        if (($usuario->hasRole('ROLE_SUPER_ADMIN'))){
           foreach ($em->getRepository("IndicadoresBundle:GrupoIndicadores")->findBy(array(), array('nombre'=> 'ASC')) as $sala) {
                $usuarioSalas[$sala->getId()] = $sala;
            } 
        }else{
           foreach ($usuario->getGruposIndicadores() as $sala) {
                $usuarioSalas[$sala->getGrupoIndicadores()->getId()] = $sala->getGrupoIndicadores();
            } 
        }
        //Salas asignadas al grupo al que pertenece el usuario
        foreach ($usuario->getGroups() as $grp){
            foreach ($grp->getSalas() as $sala){
                $usuarioSalas[$sala->getId()] = $sala;
            }
        }
        
        $i = 0;
        $salas = array();
        foreach ($usuarioSalas as $sala) {
            $salas[$i]['datos_sala'] = $sala;
            $salas[$i]['indicadores_sala'] = $em->getRepository('IndicadoresBundle:GrupoIndicadores')
                    ->getIndicadoresSala($sala);
            $i++;
        }

        //Indicadores asignados por usuario
        $usuarioIndicadores = ($usuario->hasRole('ROLE_SUPER_ADMIN')) ?
                $em->getRepository("IndicadoresBundle:FichaTecnica")->findBy(array(), array('nombre'=>'ASC')) :
                $usuario->getIndicadores();
        //Indicadores asignadas al grupo al que pertenece el usuario
        $indicadoresPorGrupo = array();
        foreach ($usuario->getGroups() as $grp){            
            foreach ($grp->getIndicadores() as $indicadores_grupo){
                $indicadoresPorGrupo[] = $indicadores_grupo;
            }
        }
        
        $indicadores_por_usuario = array();
        $indicadores_clasificados = array();
        foreach ($usuarioIndicadores as $ind) {
            $indicadores_por_usuario[] = $ind->getId();
        }
        
        foreach ($indicadoresPorGrupo as $ind){
            $indicadores_por_usuario[] = $ind->getId();
        }
        
        $categorias_indicador = array();
        foreach ($categorias as $cat) {
            $categorias_indicador[$cat->getId()]['cat'] = $cat;
            $categorias_indicador[$cat->getId()]['indicadores'] = array();
            $indicadores_por_categoria = $cat->getIndicadores();
            foreach ($indicadores_por_categoria as $ind) {
                if (in_array($ind->getId(), $indicadores_por_usuario)) {
                    $categorias_indicador[$cat->getId()]['indicadores'][] = $ind;
                    $indicadores_clasificados[] = $ind->getId();
                }
            }
        }

        $indicadores_no_clasificados = array();
        foreach ($usuarioIndicadores as $ind) {
            if (!in_array($ind->getId(), $indicadores_clasificados)) {
                $indicadores_no_clasificados[] = $ind;
            }
        }
        foreach ($indicadoresPorGrupo as $ind) {
            if (!in_array($ind->getId(), $indicadores_clasificados)) {
                $indicadores_no_clasificados[] = $ind;
            }
        }
        $confTablero = array('graficos_por_fila' => $this->container->getParameter('graficos_por_fila'),
                            'ancho_area_grafico' => $this->container->getParameter('ancho_area_grafico'),
                            'alto_area_grafico'=> $this->container->getParameter('alto_area_grafico'),
                            'titulo_sala_tamanio_fuente'=> $this->container->getParameter('titulo_sala_tamanio_fuente'),
                            'ocultar_menu_principal'=> $this->container->getParameter('ocultar_menu_principal'),          
                            );

        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:tablero.html.twig', array(
                    'categorias' => $categorias_indicador,
                    'clasificacionUso' => $clasificacionUso,
                    'salas' => $salas,
                    'confTablero' =>$confTablero,
                    'indicadores_no_clasificados' => $indicadores_no_clasificados
        ));
    }

    public function CubosAction()
    {
        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:cubos.html.twig', array());
    }
    
    /*
    Mostrar Reporte Gerenciales generados por Pentaho
    */
    public function reporteAction() {

       /* $reporte= "http://etab.salud.gob.sv:8080/pentaho/content/reporting/reportviewer/report.html?solution=reportes&path=&name=indicador".$id.".prpt";
        return new RedirectResponse($reporte);
      */

        $req = $this->getRequest();
	 $em = $this->getDoctrine()->getManager();
         $id = $this->getRequest()->get('id');
	 $indicador = $em->find('IndicadoresBundle:FichaTecnica', $id);
		$vars=array();
            foreach($indicador->getVariables() as $var){
		$lectura = $em->getRepository('IndicadoresBundle:OrigenDatos')->getUltimaActualizacion($var->getOrigenDatos());
		array_push($vars,array('lectura'=>$lectura,'valor'=>$var->getIniciales().": ".$var->getNombre()));
            }            
	$CDAFile=$this->admin->getConfigurationPool()->getContainer()->getParameter('carpeta_pentaho_cda')."indicador".$id.".cda";

	if(!file_exists($CDAFile)){
		$this->admin->crearPentahoCDA($indicador);}
	
        $em->flush();
        return $this->render('IndicadoresBundle:FichaTecnicaAdmin:reporte.html.twig',
		array('id'=>$id, 'nombre'=>$indicador->getNombre(),
                        'inter'=>$indicador->getConcepto(),
                        'tema'=>$indicador->getTema(),
			'vars'=>$vars,
			'fecha'=>date("Y-m-d H:i")));
        } 


    public function batchActionVerFicha($idx = null)
    {
        $parameterBag = $this->get('request')->request;
        $em = $this->getDoctrine()->getManager();

        $selecciones = $parameterBag->get('idx');

        $salida = '';
        foreach ($selecciones as $ficha) {
            $fichaTec = $em->find('IndicadoresBundle:FichaTecnica', $ficha);

            $admin = $this->get('sonata.admin.ficha');
            $admin->setSubject($fichaTec);

            $html = $this->render($admin->getTemplate('show'), array(
                'action' => 'show',
                'object' => $fichaTec,
                'elements' => $admin->getShow(),
                'admin' => $admin,
                'base_template' => 'IndicadoresBundle::ajax_layout.html.twig'
            ));

            $salida .= $html->getContent() . '<BR /><BR />';
        }
        //Quitar los comentarios del código html, enlaces y aplicar estilos
        $salida = preg_replace('/<!--(.|\s)*?-->/', '', $salida);
        $salida = preg_replace('/<a(.|\s)*?>/', '', $salida);
        $salida = str_ireplace('</a>', '', $salida);
        $salida = str_ireplace('TD',"TD STYLE='border: 2px double black'", $salida);
        $salida = str_ireplace('TH',"TH STYLE='border: 2px double black'", $salida);
        $salida = str_ireplace('<TABLE',"<TABLE width=95% ", $salida);

        return new Response('<HTML>'.$salida.'</HTML>', 200, array(
            'Content-Type' => 'application/msword',
            'Content-Disposition' => 'attachment; filename="ficha_tecnica.doc"',
            'Pragma' => 'no-cache',
            'Expires' => '0'
            )
        );
    }

}
