<?php
include_once("../../addons/general/general.php");
?>
<style type="text/css" >
blockquote.style1 {
  font: 14px/20px italic Times, serif;
  padding: 8px;
  background-color: #faebbc;
  border-top: 1px solid #e1cc89;
  border-bottom: 1px solid #e1cc89;
  margin: 5px;
  background-image: url(openquote1.gif);
  background-position: top left;
  background-repeat: no-repeat;
  text-indent: 23px;
  }
  blockquote.style1 span {
     display: block;
     background-image: url(closequote1.gif);
     background-repeat: no-repeat;
     background-position: bottom right;
   }
</style>
<?php
$id= 	(isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
$cnx=bdd_conectar();
$q="SELECT * FROM form_".$id;
if ($rs = @pg_query($cnx, $q)){
	$num = bdd_pg_num_rows($rs);
	if ($num==0){
		$q="DROP TABLE form_".$id;
		@pg_query($cnx,$q);
		creartabla($id,$cnx);
                $titulo=titulo($id);
		?>
<blockquote class="style1"><span>La tabla se ha creado satisfactoriamente y se ha generado la Opcion de Menu del formulario "<?php echo $titulo; ?> " el siguiente paso es publicar el la opcion de menu.
        ! Si no tiene el acceso a publicar opciones de menu contacte al Administrador. </span></blockquote>
	<?php

	}else{
		print "La tabla ya existe y tiene datos";
	}
}else{
	creartabla($id,$cnx);
        crearmenu($id,$cnx); ?>
<blockquote class="style1"><span> La tabla se ha creado satisfactoriamente y se ha generado la Opcion de Menu del formulario "<?php echo $titulo; ?> " el siguiente paso es publicar el la opcion de menu.
        ! Si no tiene el acceso a publicar opciones de menu contacte al Administrador.</span></blockquote>
	
<?php }

function crearmenu($id,$cnx){
    $titulo=titulo($id);
    $q="INSERT INTO opciones_menu(nombre, id_padre, ruta, publicado)
    VALUES ('".$titulo."', 16, '/indicadores/conexiones/form_usuarios/index.php?id=".$id."', 0);";
    $rs = @pg_query($cnx, $q);
    $af = @pg_affected_rows($rs);
}

function titulo($id){
	$cnx1=bdd_conectar();
	$q1="SELECT id_form, nombre, menu_publicacion, comentario, nombre_tabla  FROM form where id_form=".$id;
	$rs1 = bdd_pg_query($cnx1, $q1);
	$reg1 = bdd_pg_fetch_row($rs1);
	bdd_cerrar($cnx1);
	return $reg1[1];
}

function creartabla($id,$cnx){
$llave='';
    $comentario='';
    $q='SELECT id_form, nombre, menu_publicacion, comentario, nombre_tabla
  FROM form where id_form='.$id;
$rs = bdd_pg_query($cnx, $q);
$regf = bdd_pg_fetch_row($rs);
$q="
SELECT form_cat.id_cat as id, 	form_cat.orden as orden, catalogos.campo_llave as nombre, '2' as tipo , 0 as tamano, 1 as tipoc,
CASE WHEN llave=0 THEN '' WHEN llave=1 THEN 'checked' ELSE '' END as llave  ,
CASE WHEN llaveg=0 THEN '' WHEN llaveg=1 THEN 'checked' ELSE '' END as llaveg  , objetivo
FROM public.catalogos, public.form_cat
WHERE catalogos.id_cat = form_cat.id_cat and form_cat.id_form= ".$id."
union
SELECT id_campo as id, 	orden_campo as orden, 	nombre_campo_t as nombre, tipo_campo as tipo, tamano_campo as tamano	, 2 as tipoc,
CASE WHEN llave=0 THEN '' WHEN llave=1 THEN 'checked' ELSE '' END as llave ,
CASE WHEN llaveg=0 THEN '' WHEN llaveg=1 THEN 'checked' ELSE '' END as llaveg  , objetivo
FROM form_campos where id_form=".$id."
order by orden";
$rs = bdd_pg_query($cnx, $q);

$q="SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;
CREATE TABLE form_".$id." (
    id_".$id." integer NOT NULL ";
$t=0;
while ($regc = bdd_pg_fetch_row($rs)){
$comentario=$comentario." COMMENT ON COLUMN form_".$id.".".$regc[2]." IS '".$regc[8]."' ; ";
switch ($regc[3]){
    case"2":
	$q=$q." , ".$regc[2]." integer NOT NULL ";
    break;
    case "1":
        $q=$q." , ".$regc[2]." character varying(".$regc[4].") NOT NULL ";
    break;
    case"3":
        $q=$q." , ".$regc[2]." date NOT NULL ";
    break;

}
        if($regc[6]=='checked'){
		$llave=$llave." ALTER TABLE form_".$id." ADD CONSTRAINT ".$regc[2].$id." UNIQUE (".$regc[2]."); ";
	}
        if($regc[7]=='checked'){
		$llaveg[$t]=$regc[2];
                $t ++;
	}else{
            $llaveg[$t]='';
        }
}
$q=$q.");
ALTER TABLE public.form_".$id." OWNER TO admin;
COMMENT ON TABLE form_".$id." IS '".$regf[3]."'; ".$comentario;
$q=$q." CREATE SEQUENCE form_".$id."_id_".$id."_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
ALTER TABLE public.form_".$id."_id_".$id."_seq OWNER TO admin;
ALTER SEQUENCE form_".$id."_id_".$id."_seq OWNED BY form_".$id.".id_".$id.";
ALTER TABLE form_".$id." ALTER COLUMN id_".$id." SET DEFAULT nextval('form_".$id."_id_".$id."_seq'::regclass);
ALTER TABLE ONLY form_".$id."
ADD CONSTRAINT id_".$id." PRIMARY KEY (id_".$id."); ";
$q=$q.$llave;
if ($llaveg[0]!=''){
    $t=0;
    $numllaveg=count($llaveg);
    $comentario=" ALTER TABLE form_".$id." ADD CONSTRAINT multiple".$id." UNIQUE (";
        for($t=0;$t<$numllaveg-2;$t++){
            $comentario=$comentario.$llaveg[$t]." , ";
        }
     $comentario=$comentario.$llaveg[$t]." );";
$q=$q.$comentario;
     
}
@pg_exec($cnx, $q)or die(pg_errormessage());

}
?>
<label for="Add">&nbsp;</label>
				<br/><br/><br/>
	                            <input tabindex="10" class="frm-btn-x" type="button" name="cancel3" title="Reporte de la tabla" id="Cancel3" value="Reporte de la tabla" onclick="javascript:ImprimirPDF(<?php echo $id; ?>);" /><br/><br/>
