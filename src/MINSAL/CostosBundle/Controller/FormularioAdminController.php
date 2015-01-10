<?php

namespace MINSAL\CostosBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;

class FormularioAdminController extends Controller
{           
    public function mostrarPlantilla(Request $request, $codigoFrm, $pk) {
        $em = $this->getDoctrine()->getManager();
        
        $estructura = $em->getRepository("CostosBundle:Estructura")->findBy(array(), array('codigo' => 'ASC'));
        
        $Frm = $em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>$codigoFrm));
        $Frm = array_shift($Frm);
        
        $parametros = $this->getParametros($request);
        
        return $this->render('CostosBundle:Formulario:'.$codigoFrm.'.html.twig', array('Frm' => $Frm, 
            'origenes' => $this->getOrigenes($Frm, $parametros),
            'pivotes' => $this->getPivotes($Frm, $parametros),
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'estructura' => $estructura,
            'parametros' => $parametros,
            'pk' => $pk));
    }
    public function rrhhValorPagadoAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'rrhhValorPagado', 'nit');
    }
    
    public function rrhhDistribucionHoraAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'rrhhDistribucionHora', 'nit');                
    }
    
    public function rrhhCostosAction(Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $estructura = $em->getRepository("CostosBundle:Estructura")->findBy(array(), array('codigo' => 'ASC'));
        
        $parametros = $this->getParametros($request);
        
        $campos = array('nit'=>10, 
            'partida'=>20,
            'subpartida' =>30,
            'nombre_empleado' => 40,
            'tipo_empleado' => 50,
            'especialidad' => 60,
            'forma_contrato' => 70,
            'distribucion_horas' => 1000
            );
        $campos_calculados = array('isss_patronal'=>'ISSS patronal', 
            'fondo_proteccion_patronal'=>'AFP / IPFA patronal',
            'costo_con_aporte_y_aguinaldo' => 'Costo con aporte y aguinaldo',
            'costo_hora_aporte_aguinaldo' => 'Costo por hora con aportes, permisos CG y aguinaldo',
            'costo_hora_no_trab_CG' => 'Costo horas no trab. CG',
            'costo_hora_no_trab_SG' => 'Costo horas no trab. SG',
            'salario_descuentos_permisos' => 'Salario con desc. y permisos',
            'costo_hora_descuentos_permisos' => 'Costo hora con desc. y permisos'
            );
        
        $Frm = $em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhValorPagado'));
        $Frm = array_shift($Frm);
        $Frm2 = $em->getRepository('CostosBundle:Formulario')->findBy(array('codigo'=>'rrhhDistribucionHora'));
        $Frm2 = array_shift($Frm2);
        $Frm_aux = new \MINSAL\CostosBundle\Entity\Formulario();
        
        $Frm_aux->setAreaCosteo('rrhh');
        $Frm_aux->setColumnasFijas(4);
        $Frm_aux->setIdentificador($Frm->getId());
        $campos_aux = array();
        
        $formato = new \MINSAL\CostosBundle\Entity\Formato();
        $alineacion = new \MINSAL\CostosBundle\Entity\Alineacion();
        $tipo_dato = new \MINSAL\CostosBundle\Entity\TipoDato();
        $tipo_control = new \MINSAL\CostosBundle\Entity\TipoControl();
        
        $alineacion->setCodigo('right');
        $formato->setFormato('c2');
        $tipo_dato->setCodigo('float');
        $tipo_control->setCodigo('text');
                        
        foreach (array($Frm, $Frm2) as $F) {
            foreach ($F->getCampos() as $c){
                if (array_key_exists($c->getSignificadoCampo()->getCodigo(), $campos)){
                    $c->setPosicion($campos[$c->getSignificadoCampo()->getCodigo()]);
                    if ($c->getSignificadoCampo()->getCodigo() == 'distribucion_horas'){
                        $c->getSignificadoCampo()->setCodigo('_costo');                        
                        $c->setFormato($formato);
                        $c->setEsCalculado(true);
                        $c->setAlineacion($alineacion);
                    }
                    $c->setEsEditable(false);
                    $campos_aux[$c->getPosicion()] = $c;
                }
            }
        }
        ksort($campos_aux);
        $distribucion = $campos_aux[1000];
        unset($campos_aux[1000]);
        foreach($campos_aux as $c){
            $Frm_aux->addCampo($c);
        }
               
        foreach($campos_calculados as $k=>$v){
            $significado_c = new \MINSAL\IndicadoresBundle\Entity\SignificadoCampo();
            
            $campo_c = new \MINSAL\CostosBundle\Entity\Campo();

            $significado_c->setCodigo($k);
            $significado_c->setDescripcion($v);
            
            $campo_c->setSignificadoCampo($significado_c);
            $campo_c->setTipoDato($tipo_dato);
            $campo_c->setTipoControl($tipo_control);
            $campo_c->setEsEditable(false);
            $campo_c->setEsCalculado(true);
            $campo_c->setFormato($formato);
            $campo_c->setAlineacion($alineacion);
            
            $Frm_aux->addCampo($campo_c);
        }
        
        $Frm_aux->addCampo($distribucion);
        
        $origenes = $this->getOrigenes($Frm, $parametros) + $this->getOrigenes($Frm2, $parametros);
        $pivotes = $this->getPivotes($Frm, $parametros) + $this->getPivotes($Frm2, $parametros);
        
        return $this->render('CostosBundle:Formulario:rrhhCostos.html.twig', array('Frm' => $Frm_aux, 
            'origenes' => $origenes,
            'pivotes' => $pivotes,
            'url' => 'get_grid_data',
            'url_save' => 'set_grid_data',
            'estructura' => $estructura,
            'parametros' => $parametros,
            'pk' => 'nit'));
    }
    
    public function gaAfAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'gaAf', 'codigo_af');
    }
    
    public function gaCompromisosFinancierosAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'gaCompromisosFinancieros', 'codigo_contrato');
    }
    
    public function gaVariablesAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'gaVariables', 'dependencia');
    }        
    
    public function gaDistribucionAction(Request $request)
    {        
        return $this->mostrarPlantilla($request, 'gaDistribucion', 'dependencia');        
    }
    
    private function getOrigenes($Frm, $parametros) {
        $em = $this->getDoctrine()->getManager();
        $origenes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigen() or $c->getSignificadoCampo()->getCatalogo() != ''){
                $origenes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenCampo($c, $parametros);
            }            
        }
        return $origenes;
    }
    
    private function getPivotes($Frm, $parametros) {
        $em = $this->getDoctrine()->getManager();
        $pivotes = array();
        foreach($Frm->getCampos() as $c){
            if ($c->getOrigenPivote()){
                $pivotes[$c->getSignificadoCampo()->getCodigo()] = $em->getRepository('CostosBundle:Campo')->getOrigenPivote($c, $parametros);
            }
        }
        return $pivotes;
    }
    
    private function getParametros($r){
        return array('anio_mes'=>$r->get('anio_mes'), 
                'anio'=>$r->get('anio'), 
                'establecimiento'=>$r->get('establecimiento'), 
                'dependencia'=>$r->get('dependencia')
                );
    }
}
