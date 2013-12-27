<?php

namespace MINSAL\IndicadoresBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class FichaTecnicaAdmin extends Admin
{
    private $repository;
    protected $datagridValues = array(
        '_page' => 1, // Display the first page (default = 1)
        '_sort_order' => 'ASC', // Descendant ordering (default = 'ASC')
        '_sort_by' => 'nombre' // name of the ordered field (default = the model id field, if any)
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->with($this->getTranslator()->trans('_datos_generales_'))
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('esAcumulado', null, array('label' => $this->getTranslator()->trans('es_acumulado')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'), 'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula'),
                    'help' => $this->getTranslator()->trans('ayuda_ingreso_formula')
                ))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica'),
                    'required' => true, 'expanded' => true,
                    'class' => 'IndicadoresBundle:ClasificacionTecnica',
                    'query_builder' => function ($repository) {
                        return $repository->createQueryBuilder('ct')
                                ->orderBy('ct.clasificacionUso');
                    }))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_'), 'expanded' => true))
                ->add('periodo', null, array('label' => $this->getTranslator()->trans('periodicidad')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad'), 'required' => false))
                ->add('observacion', 'textarea', array('label' => $this->getTranslator()->trans('_observacion_'), 'required' => false))
                ->end()
                ->with($this->getTranslator()->trans('alertas'))
                ->add('alertas', 'sonata_type_collection', array(
                    'label' => $this->getTranslator()->trans('alertas'),
                    'required' => true), array(
                    'edit' => 'inline',
                    'inline' => 'table',
                    'sortable' => 'position'
                ))
                ->end()
                ->with($this->getTranslator()->trans('_dimensiones_'))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->end();
        $acciones = explode('/', $this->getRequest()->server->get("REQUEST_URI"));
        $accion = array_pop($acciones);
        if ($accion == 'create') {
            $formMapper
                    ->setHelps(array(
                        'camposIndicador' => $this->getTranslator()->trans('_debe_guardar_para_ver_dimensiones_')
                    ))
            ;
        }
    }

    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('unidadMedida', null, array('label' => $this->getTranslator()->trans('unidad_medida')))
                ->add('esAcumulado', null, array('label' => $this->getTranslator()->trans('es_acumulado')))
                ->add('variables', null, array('label' => $this->getTranslator()->trans('variables'), 'expanded' => true))
                ->add('formula', null, array('label' => $this->getTranslator()->trans('formula')))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica'),
                    'required' => true, 'expanded' => true,
                    'class' => 'IndicadoresBundle:ClasificacionTecnica',
                    'query_builder' => function ($repository) {
                        return $repository->createQueryBuilder('ct')
                                ->orderBy('ct.clasificacionUso');
                    }))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_'), 'expanded' => true))
                ->add('periodo', null, array('label' => $this->getTranslator()->trans('periodicidad')))
                ->add('confiabilidad', null, array('label' => $this->getTranslator()->trans('confiabilidad')))
                ->add('observacion', 'string', array('label' => $this->getTranslator()->trans('_observacion_')))
                ->add('alertas', 'sonata_type_collection', array(
                    'label' => $this->getTranslator()->trans('alertas'),
                    'required' => true), array(
                    'edit' => 'inline',
                    'inline' => 'table',
                    'sortable' => 'position'
                ))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->add('ultimaLectura', null, array('label' => $this->getTranslator()->trans('_ultima_actualizacion_')))
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
                ->add('nombre', null, array('label' => $this->getTranslator()->trans('nombre')))
                ->add('clasificacionTecnica', null, array('label' => $this->getTranslator()->trans('clasificacion_tecnica')))
                ->add('clasificacionPrivacidad', null, array('label' => $this->getTranslator()->trans('_nivel_de_usuario_')))
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
                ->addIdentifier('nombre', null, array('label' => $this->getTranslator()->trans('nombre_indicador')))
                ->add('tema', null, array('label' => $this->getTranslator()->trans('_interpretacion_')))
                ->add('concepto', null, array('label' => $this->getTranslator()->trans('concepto')))
                ->add('camposIndicador', null, array('label' => $this->getTranslator()->trans('campos_indicador')))
                ->add('_action', 'actions', array(
                'actions' => array('reporte' => array('template' => 'IndicadoresBundle:FichaTecnicaAdmin:accion_reporte.html.twig'),
                        )
               )) ;

        ;
    }

    public function getBatchActions()
    {
        $actions = array();

        $actions['ver_ficha'] = array(
            'label' => $this->trans('_ver_ficha_'),
            'ask_confirmation' => false // If true, a confirmation will be asked before performing the action
        );

        return $actions;
    }

    public function validate(ErrorElement $errorElement, $object)
    {
        //Verificar que el usuario tiene una agencia asignada
        $usuario = $this->getConfigurationPool()
                ->getContainer()
                ->get('security.context')
                ->getToken()
                ->getUser();
        if ($usuario->getAgencia() == null){
            $errorElement
                        ->with('nombre')
                        ->addViolation($this->getTranslator()->trans('_usuario_no_agencia_'))
                        ->end();
        }

        //Verificar que todos los campos esten configurados
        foreach ($object->getVariables() as $variable) {
            $campos_no_configurados = $this->getModelManager()
                    ->findBy('IndicadoresBundle:Campo', array('origenDato' => $variable->getOrigenDatos(),
                'significado' => null));

            if (count($campos_no_configurados) > 0) {
                $errorElement
                        ->with('variables')
                        ->addViolation($variable->getIniciales() . ': ' . $this->getTranslator()->trans('origen_no_configurado'))
                        ->end();
            }
        }
        //Obtener las variables marcadas
        $variables_sel = array();
        foreach ($object->getVariables() as $variable) {
            $variables_sel[] = $variable->getIniciales();
        }

        if (count($variables_sel) == 0)
            $errorElement
                    ->with('variables')
                    ->addViolation($this->getTranslator()->trans('elija_al_menos_una_variable'))
                    ->end()
            ;
        else {
            //Obtener las variables utilizadas en la fórmula
            //Quitar todos los espacios en blanco de la fórmula
            $vars_formula = array();
            $formula = str_replace(' ', '', $object->getFormula());
            preg_match_all('/\{([\w]+)\}/', $formula, $vars_formula);

            //Para que la fórmula sea válida la cantidad de variables seleccionadas
            //debe coincidir con las utilizadas en la fórmula
            if ((count(array_diff($variables_sel, $vars_formula[1])) > 0) or
                    (count(array_diff($vars_formula[1], $variables_sel)) > 0)) {
                $errorElement
                        ->with('formula')
                        ->addViolation($this->getTranslator()->trans('vars_sel_diff_vars_formula'))
                        ->end()
                ;
            }

            // ******** Verificar si matematicamente la fórmula es correcta
            // 1) Sustituir las variables por valores aleatorios entre 1 y 100
            $formula_check = $formula;
            $formula_valida = true;
            $result = '';
            foreach ($vars_formula[0] as $var) {
                $formula_check = str_replace($var, rand(1, 100), $formula_check);
            }

            //Verificar que no tenga letras, para evitar un ataque de inyección
            if (preg_match('/[A-Z]+/i', $formula_check) != 0) {
                $formula_valida = false;
                $mensaje = 'sintaxis_invalida_variables_entre_llaves';
            } else {
                //evaluar la formula, evitar que se muestren los errores por si los lleva
                ob_start();
                $test = eval('$result=' . $formula_check . ';');
                ob_end_clean();

                if (!is_numeric($result)) {
                    $formula_valida = false;
                    $mensaje = 'sintaxis_invalida';
                }
            }

            if ($formula_valida == false) {
                $errorElement
                        ->with('formula')
                        ->addViolation($this->getTranslator()->trans($mensaje))
                        ->end();
            }
        }
    }

    public function postPersist($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador()
	$this->crearCuboMondrian($fichaTecnica);
	$this->crearPentahoCDA($fichaTecnica);

    }

    public function postUpdate($fichaTecnica)
    {
        $this->crearCamposIndicador($fichaTecnica);
        //$this->repository->crearTablaIndicador($fichaTecnica);
        $this->crearCuboMondrian($fichaTecnica);
    }

    public function prePersist($fichaTecnica)
    {
        $this->setAlertas($fichaTecnica);
        $this->crearCamposIndicador($fichaTecnica);   
        
        /*
         * La agencia del indicador será la agencia del usuario que lo crea
         */
        $usuario = $this->getConfigurationPool()
                ->getContainer()
                ->get('security.context')
                ->getToken()
                ->getUser();
        $fichaTecnica->setAgencia($usuario->getAgencia());
    }

    public function setAlertas($fichaTecnica)
    {
        $alertas = $fichaTecnica->getAlertas();
        $fichaTecnica->removeAlertas();
        if (count($alertas) > 0) {
            foreach ($alertas as $alerta) {
                $alerta->setIndicador($fichaTecnica);
                $fichaTecnica->addAlerta($alerta);
            }
        }
    }

    public function preUpdate($fichaTecnica)
    {
        $this->setAlertas($fichaTecnica);       
        $this->crearCamposIndicador($fichaTecnica);
    }

    public function crearCamposIndicador(FichaTecnica $fichaTecnica)
    {
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getManager();
        $em->getRepository('IndicadoresBundle:FichaTecnica')->crearCamposIndicador($fichaTecnica);
        
    }

    public function setRepository($repository)
    {
        $this->repository = $repository;
    }

    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->add('tablero');
        $collection->add('cubos');
        $collection->add('reporte', 
        $this->getRouterIdParameter().'/reporte');

    }

    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                return 'IndicadoresBundle:CRUD:ficha_tecnica-edit.html.twig';
                break;
            case 'show':
                return 'IndicadoresBundle:FichaTecnicaAdmin:show.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    /**
     * Cambiar la forma en que muestra el listado de indicadores, 
     * si es un usuario normal solo le muestra los indicadores que tenga asignados
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list')
    {
        $query = parent::createQuery($context);

        $usuario = $this->getConfigurationPool()
                ->getContainer()
                ->get('security.context')
                ->getToken()
                ->getUser();
        if ($usuario->hasRole('ROLE_SUPER_ADMIN')) {
            return new ProxyQuery($query->where('1=1'));
        } else {
            $ind = $usuario->getIndicadores();
            $indicadores = array();
            foreach ($ind as $f) {
                $indicadores[] = $f->getId();
            }

            return new ProxyQuery(
                    $query->where($query->getRootAlias() . '.id IN ('.  implode(", ", $indicadores).')')
            );
        }
    }
/* Ordena codigo XML para facilitar su lectura
 $xml_str= Cadena XML sin indentar*/

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

/* Toma una Ficha Tecnica para obtener el ID de indicador, crea un 
 Schema de Mondrian y lo agrega las fuentes de datos de Pentaho. El nuevo
esquema de Mondrian es usado por Saiku.
*/
    public function crearCuboMondrian(FichaTecnica $fichaTecnica)
    { 
	$em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getManager();
	$util = new \MINSAL\IndicadoresBundle\Util\Util();
        $campos= str_replace("'", '',$fichaTecnica->getCamposIndicador());
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
       $schemaFile=$this->getConfigurationPool()->getContainer()->getParameter('carpeta_siig_mondrian').'/indicador'.$fichaTecnica->getId('id').'.mondrian.xml';
	$fh=fopen($this->getConfigurationPool()->getContainer()->getParameter('carpeta_siig_mondrian').'/cubo_base.txt','r');
	$base_cubo= fread($fh, filesize($this->getConfigurationPool()->getContainer()->getParameter('carpeta_siig_mondrian').'/cubo_base.txt'));
	fclose($fh);
	$formula = str_replace(' ', '', $fichaTecnica->getFormula());
        preg_match_all('/\{([\w]+)\}/', $formula, $vars_formula);
	$formula=strtolower($formula);
	$formula=str_replace('{','[Measures].[', $formula);
	$formula=str_replace('}',']', $formula);

	$datos= "\n<Cube name='".$fichaTecnica->getNombre()."' visible='true' cache='true' enabled='true'>".
                 "\n<Table name='tmp_ind_".$util->slug($fichaTecnica->getNombre())."' schema='public'></Table>".
    		$dims;	
	foreach ($vars_formula[1] as $myvar){
			$datos=$datos."\n<Measure name='".strtolower($myvar).
			"' column='".strtolower($myvar)."' formatString='#' aggregator='sum'></Measure>";
		}
	
    	$datos=$datos."\n <CalculatedMember name='Valor (".$fichaTecnica->getUnidadMedida().")'".
		" formula='".$formula."' dimension='Measures' visible='true'></CalculatedMember>\n</Cube>\n</Schema>";

	$fh = fopen($schemaFile, 'w');
	fwrite($fh,$this->formatXML("\n<Schema name='Indicador ".$fichaTecnica->getId()."'>\n ".$base_cubo.$datos)); 
        fclose($fh);       

	$pentahoResource=$this->getConfigurationPool()->getContainer()->getParameter('carpeta_siig_mondrian').
		$this->getConfigurationPool()->getContainer()->getParameter('listado_metadata');

	$xml= simplexml_load_file($pentahoResource);
	$node=$xml->xpath('//Catalogs');
	$catalog=$node[0]->addChild('Catalog');
	$catalog->addAttribute('name','Indicador '.$fichaTecnica->getId('id'));
	$catalog->addChild('DataSourceInfo','Provider=mondrian;DataSource='.
			$this->getConfigurationPool()->getContainer()->getParameter('conexion_bd_pentaho'));
	$catalog->addChild('Definition',$schemaFile);

	$fh = fopen($pentahoResource, 'w'); 
	fwrite($fh, $this->formatXML($xml->asXML())); 
        fclose($fh);
	}
	$em->flush(); 
    }

 public function crearPentahoCDA(FichaTecnica $fichaTecnica)
    {	
	//crear archivo solo en caso que no exista.
	$CDAFile=$this->getConfigurationPool()->getContainer()->getParameter('carpeta_pentaho_cda').
	"indicador".$fichaTecnica->getId().".cda";

	if (!file_exists($CDAFile))  {    
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getManager();
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $campos= explode(",",str_replace("'", '',$fichaTecnica->getCamposIndicador()));
        $campos=array_map('trim',$campos);
                    
       $formula = str_replace(' ', '', $fichaTecnica->getFormula());
        $tabla="tmp_ind_".$util->slug($fichaTecnica->getNombre());
 
        $queries=$this->crearPentahoCDAQueries($campos,$tabla,$formula);
	$this->crearPentahoCDAArchivo($queries,$fichaTecnica->getId());

        $em->flush();}
 }


 public function crearPentahoCDAArchivo($queries,$id){

        $datos= "<?xml version='1.0' encoding='utf-8'?><CDADescriptor>   
		 <DataSources> <Connection id='1' type='sql.jdbc'>
            	<Driver>org.postgresql.Driver</Driver>
		<Url>jdbc:postgresql://localhost:5432/".
		$this->getConfigurationPool()->getContainer()->getParameter('database_name')."</Url>
            <User>".$this->getConfigurationPool()->getContainer()->getParameter('database_user')."</User>
            <Pass>".$this->getConfigurationPool()->getContainer()->getParameter('database_password')."</Pass>
        </Connection>
    </DataSources>";
        foreach ($queries as $q){
		$datos=$datos."<DataAccess id='".$q['id']."' connection='1' type='sql' access='public' cache='true' cacheDuration='300'>
        		<Name>".$q['titulo']."</Name> <Query>".$q['sql']."</Query><Parameters>
            		<Parameter name='anio' type='Integer' default='2013'/>  </Parameters>
    			</DataAccess>";
                }        

	$datos=$datos."</CDADescriptor>";

	$CDAFile=$this->getConfigurationPool()->getContainer()->getParameter('carpeta_pentaho_cda')."indicador".$id.".cda";
        $fh = fopen($CDAFile, 'w');
        fwrite($fh,$this->formatXML($datos));
        fclose($fh);
 } 

 public function crearPentahoCDAQueries($campos,$tabla,$formula){

        preg_match_all('/\{([\w]+)\}/', $formula, $vars_formula);
        $formula=strtolower($formula);
        $formula_agregada=str_replace('{','sum(', str_replace('}',')', $formula));
        $formula=str_replace('{',' ', str_replace('}',' ', $formula));
	$queries=array();

 //Busqueda para generar listado de Anios
  if (in_array('anio', $campos)){
	$sql_text='select distinct anio from '.$tabla.' order by anio desc';
	$where_sql=" WHERE aa.anio::int=!anio} ";
	} else {
	$sql_text='select false';
	$where_sql='';	}

	$q=array(
	'id' =>'anios', 
	'titulo'=>'Anios disponibles | sin_grafico',
	'sql'=>htmlspecialchars($sql_text));
	array_push($queries,$q);	

//Busqueda para generar datos por departamento
  if (in_array('id_departamento', $campos)){
	$sql=array();
	 foreach ($vars_formula[1] as $myvar){
                        $sql_text="to_char(sum(".$myvar."),'999,999') as ".$myvar;
			array_push($sql,$sql_text);
                }
        $q=array(
	'id'=>'1',
        'titulo'=>'Datos por departamento | tabla',
        'sql'=>"select  bb.abreviatura as departamento,".implode(",",$sql).
	",to_char(round(".$formula_agregada.",2),'999.99%') as porcentaje
        FROM ".$tabla." aa   INNER JOIN ctl_departamento bb ON aa.id_departamento = bb.id
        ".$where_sql."  group by bb.abreviatura order by porcentaje asc;");

	$q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));

        array_push($queries,$q);
        }

 //Busqueda para generar datos por Departamento agrupados por Edad
if ((in_array('id_departamento', $campos))&&(in_array('edad', $campos))){
        $q=array(
        'id' =>'2',
        'titulo'=>'Distribucion por grupo de Edades | barras',
        'sql'=>"select dept as eje_x,  sum(case when  edad<10 then valor else 0 end)  as 'Menores de 10',
   sum(case when edad>=10 and edad<20 then valor else 0 end)  as 'Entre 10 y 20',
 sum(case when edad>=20 and edad<30 then valor else 0 end)  as 'Entre  20 y 30' ,
  sum(case when edad>=30 and edad<40 then valor else 0 end)  as 'Entre  30 y 40' ,
   sum(case when edad>=40 and edad<50 then valor else 0 end)  as 'Entre  40 y 50', 
 sum(case when edad>=50 and edad<60 then valor else 0 end)  as 'Entre  50 y 60',
  sum(case when edad>=60  then valor else 0 end)  as 'Mayores de 60' 
from ( SELECT ".$formula_agregada." as valor,edad,ctl_departamento.abreviatura AS dept 
FROM ".$tabla." aa INNER JOIN ctl_departamento ON aa.id_departamento = ctl_departamento.id
 ".$where_sql." group by dept, edad order by dept ) boo group by dept; ");
        $q['sql']= str_replace('!','${', $q['sql']);
        $q['sql']= htmlspecialchars(str_replace("'",'"', $q['sql']));

        array_push($queries,$q);
        }

 //Busqueda para generar datos por Departamento agrupados por Diagnostico
if ((in_array('id_departamento', $campos))&&(in_array('id_diagnostico', $campos))){
        $q=array(
        'id' =>'3',
        'titulo'=>'Distribucion por Diagnostico | barras',
        'sql'=>"select dept as eje_x,  sum(case when diag='I60.9' then valor else 0 end) as *Hemorragia subaracnoidea*,
sum(case when diag='I67.8' then valor else 0 end) as *Enfermedades cerebrovasculares*,
sum(case when diag='I61.9' then valor else 0 end) as *Hemorragia intraencefálac*
 from ( SELECT ".$formula_agregada." as valor,cc.id as diag,bb.abreviatura AS dept 
 FROM ".$tabla." aa INNER JOIN ctl_departamento bb
 ON aa.id_departamento = bb.id INNER JOIN ctl_cie10 cc ON aa.id_diagnostico=cc.id 
".$where_sql." and cc.id IN (select  id_diagnostico from ".$tabla." group by id_diagnostico
 having count(id_diagnostico)>50 limit 5)group by dept,cc.id)foo group by dept; ");
        $q['sql']= str_replace('!','${', $q['sql']);
        $q['sql']=htmlspecialchars(str_replace("*",'"', $q['sql']));

        array_push($queries,$q);
        }


//Busqueda para generar datos por Departamento agrupados por area
  if ((in_array('id_departamento', $campos))&&(in_array('area', $campos))){
        $sql=array();
         foreach ($vars_formula[1] as $myvar){
                        $sql_text="aa.".$myvar;
                        array_push($sql,$sql_text);
                }
        $q=array(
        'id'=>'4',
        'titulo'=>'Datos por Departamento y Area | barras',
        'sql'=>"Select dept as eje_x,  sum(case when area='Rural' then porcentaje end)  as Rural,
			sum(case when area='Urbano' then porcentaje end) as Urbano
			 from ( SELECT round(".$formula_agregada.",2) as porcentaje,dept,area
    			from (SELECT ctl_departamento.abreviatura AS dept,".implode(",",$sql).
			",ctl_area.descripcion as area FROM ".$tabla." aa  
		    	 INNER JOIN ctl_departamento ON aa.id_departamento = ctl_departamento.id
     			INNER JOIN ctl_area ON aa.area = ctl_area.inicial
			".$where_sql." ) as foo group by dept, area order by dept) yy group by dept;");
        $q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));
        array_push($queries,$q);
        }

//Busqueda para generar datos por Departamento agrupados por genero
  if ((in_array('id_departamento', $campos))&&(in_array('genero', $campos))){
        $sql=array();
         foreach ($vars_formula[1] as $myvar){
                        $sql_text="aa.".$myvar;
                        array_push($sql,$sql_text);
                }
        $q=array(
        'id'=>'5',
        'titulo'=>'Datos por Departamento y Genero | barras',
        'sql'=>"Select dept as eje_x,  sum(case when sex='M' then porcentaje end)  as Mujer,
sum(case when sex='F' then porcentaje end) as Hombre
 from ( SELECT round(".$formula_agregada.",2) as porcentaje, dept, sex
    from (SELECT ctl_departamento.abreviatura AS dept,".implode(",",$sql). ",ctl_sexo.inicial as sex
FROM ".$tabla." aa  
     INNER JOIN ctl_departamento ON aa.id_departamento = ctl_departamento.id
     INNER JOIN ctl_sexo ON aa.genero = ctl_sexo.inicial
".$where_sql." ) as foo group by dept, sex order by dept) yy group by dept;" );
        $q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));
        array_push($queries,$q);
        }
        
//Busqueda para generar datos por Variables agrupados por mes
  if ((in_array('mes', $campos))&&(in_array('anio', $campos))){
        $sql=array();
         foreach ($vars_formula[1] as $myvar){
                        $sql_text=" sum(aa.".$myvar.") as ".$myvar;
                        array_push($sql,$sql_text);
                }  
        $q=array(
        'id'=>'6',
        'titulo'=>'Datos por Variable y Mes | lineas',
        'sql'=>" select (anio::text || lpad(mes::text, 2, '0') || '01') as fecha, ".
        implode(",",$sql). " FROM ".$tabla." aa  ".$where_sql."  group by
        (anio::text || lpad(mes::text, 2, '0') || '01') order by fecha asc;");
        $q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));
        array_push($queries,$q);
        }
               
    
    //Busqueda para generar datos por Municipio
  if (in_array('id_municipio', $campos)){
        $q=array(
        'id'=>'7',
        'titulo'=>'Municipios con mas casos | tabla',
        'sql'=>"Select bb.descripcion as municipio, ".$formula_agregada. " as casos FROM ".$tabla.
        " aa  ".$where_sql."  group  by bb.descripcion order by casos desc limit 12;" );
        $q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));
        array_push($queries,$q);
        }
    
               
//Busqueda para generar resumen estadistico
   $catalogo='';	
  if (in_array('id_municipio', $campos)){
$catalogo='municipio';}
  if (in_array('id_departamento', $campos)){
$catalogo='departamento';}
  if ($catalogo!=''){
        $q=array(
	'id'=>'resumen',
        'titulo'=>'Resumen Estadistico | sin_grafico',
        'sql'=>"(select  'n_registros' as nombre,count(*) as val
 FROM ".$tabla." aa            
 INNER JOIN ctl_".$catalogo." bb ON aa.id_".$catalogo." = bb.id  ".$where_sql." )
  
UNION
  
(select  'conteo_moda' as nombre, count(porcentaje) as val from 
    (select round(".$formula_agregada.",1) as porcentaje,
bb.descripcion as ".$catalogo."  
 FROM ".$tabla." aa            
 INNER JOIN ctl_".$catalogo." bb ON aa.id_".$catalogo." = bb.id ".$where_sql."     
 group by bb.descripcion) boo group by boo.porcentaje order by val desc limit 1)
 
UNION
  
(select  'moda' as nombre, kk.porcentaje as val from
                    (select count(boo.porcentaje) as conteo,boo.porcentaje from  
                         (select round(".$formula_agregada.",1) as porcentaje,
                         bb.descripcion as ".$catalogo."  
                         FROM ".$tabla." aa            
                         INNER JOIN ctl_".$catalogo." bb ON aa.id_".$catalogo." = bb.id     
                         ".$where_sql."  group by bb.descripcion) boo 
                         group by boo.porcentaje order by conteo desc limit 1)kk
) 

UNION
 
(select 'desv_std' as nombre,round(stddev_pop(porcentaje),2) as val 
 from (select round(".$formula_agregada.",0) as porcentaje   
 FROM ".$tabla." aa            
 INNER JOIN ctl_".$catalogo." bb ON aa.id_".$catalogo." = bb.id     
 ".$where_sql."  group by bb.descripcion order by porcentaje asc )boo)

UNION
(select 'promedio' as nombre, round(avg(porcentaje),2) as val 
 from (select round(".$formula_agregada.",0) as porcentaje 
 FROM ".$tabla." aa            
 INNER JOIN ctl_".$catalogo." bb ON aa.id_".$catalogo." = bb.id ".$where_sql."     
  group by bb.descripcion order by porcentaje asc )boo)");
$q['sql']= htmlspecialchars(str_replace('!','${', $q['sql']));
   array_push($queries,$q);
        }
 return $queries;

     }
}
