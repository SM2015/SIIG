<?php
include_once("../../addons/general/general.php");
include_once("../../addons/phpmathpublisher/mathpublisher.php") ;
$cnx = bdd_conectar();
$datos = (isset($_REQUEST['dato'])) ? $_REQUEST['dato'] : '%';
$usr = (isset($_REQUEST['usr'])) ? $_REQUEST['usr'] : '%';
$array = explode("_",$datos);
$q="SELECT id_indicador FROM series where id_usuario=". $usr ." and tem=".substr($array[1],0,3);
$rs = bdd_pg_query($cnx, $q);
$reg = bdd_pg_fetch_row($rs);
        $id = $reg[0];
        $q="SELECT f.nombre, f.tema, f.concepto, f.objetivo, f.uso, f.definicion_operativa, f.unidad_medida, n.descripcion,
                    t.descripcion,  p.descripcion,  u.descripcion, r.nombre, f.observacion, f.confiabilidad, f.formula
            FROM ficha_tecnica as f, clasificacion_nivel as n, clasificacion_privacidad as p, clasificacion_tecnica as t,
                    clasificacion_uso as u, responsable_indicador as r
            WHERE f.id_responsable_indicador = r.id_responsable_indicador AND f.id_clasificacion_uso = u.id_clasificacion_uso AND
                    n.id_clasificacion_nivel = f.id_clasificacion_nivel AND p.id_clasificacion_privacidad = f.id_clasificacion_privacidad AND
                    t.id_clasificacion_tecnica = f.id_clasificacion_tecnica and id_ficha_tecnica=".$id;
$rs = bdd_pg_query($cnx, $q);
$reg = bdd_pg_fetch_row($rs); 
$size=15;
$nameimg ='math_980_'. md5(trim($reg[14]).$size).'.png';
$fijo=array(
    'NOMBRE DEL INDICADOR',
    'Tema',
    'Concepto',
    'Objetivo',
    'Uso',
    'Definicion',
    'Unidad de Medida',
    'Clasificación por su nivel de uso',
    'Clasificación Tecnica',
    'Clasificación por su provacidad',
    'Otra Clasificación',
    'Responsable',
    'Observacion',
    'Fiabilidad',
    'Formula'
);
    echo "<table with='100%' aligth='center' border=1 cellPadding=1 cellSpacing=1> ";
for($i=0;$i<15;$i++){
    if ($i==0){
        echo "<tr bgcolor='#0B0B61' color='white' id='celda1".$i."' >";
            echo "<td with='20' aligth='center'> <FONT COLOR='white'> ";
                echo $fijo[$i];
            echo " </FONT> </td>";
            echo "<td with='80%' aligth='center'> <FONT COLOR='white'>";
                echo $reg[$i];
            echo " </FONT> </td> ";
        echo "</tr>";
    }else{
        echo "<tr bgcolor='#F2F2F2' id='celda".$i."' onmouseover='cambiar_color_over(this)' onmouseout='cambiar_color_out(this)' >";
            echo "<td with='20' aligth='center' >";
                echo $fijo[$i];
            echo "</td>";
            echo "<td with='80%' aligth='center'>";
            if($i==14){
                echo "<img src='../../addons/phpmathpublisher/img/".$nameimg."' />'";
            }else{
                echo $reg[$i];
            }
            
            echo "</td> ";
        echo "</tr>";
    }
}

  
////******
$q="SELECT DISTINCT ON (d.nombre) d.nombre, d.iniciales, f.nombre, f.contacto, f.correo, f.telefono, f.cargo,
             r.nombre, r.contacto, r.correo, r.telefono, r.cargo, d.confiabilidad, d.comentario
      FROM ficha_tecnica_variable as v, variable_dato as d, responsable_dato as r, fuente_dato as f, sentencia as s, conexion as c
      WHERE v.id_variable = d.id_variable AND r.id_responsable_dato = d.id_responsable AND f.id_fuente_dato = d.id_fuente AND
              s.id_sentencia = d.id_sentencia and v.id_ficha_tecnica=".$id;
$rs = bdd_pg_query($cnx, $q);
while ($reg = bdd_pg_fetch_row($rs)) {
    $fijo=array(
        'Nombre de la Variable',
        'Iniciales de la Variable',
        'Nombre de la Fuente de Datos',
        'Contacto en la Fuente de Datos',
        'Correo electronico',
        'Telefonono',
        'Cargo',
        'Nombre del Responsable del Datos',
        'Contacto Responsable del Datos',
        'Correo electronico',
        'Telefonono',
        'Cargo',
        'Fiabilidad del la Variable (%)',
        'Comentario'
     );

    for($i=0;$i<14;$i++){
        if ($i==0){
             echo "<tr bgcolor='#2E2EFE' id='celda1".$i."' >";
 
        }else{
            echo "<tr bgcolor='#F2F2F2' id='celda1".$i."' onmouseover='cambiar_color_over(this)' onmouseout='cambiar_color_out(this)'>";
        }
        echo "<td with='20' aligth='center'>";
            echo $fijo[$i];
        echo "</td>";    
        echo "<td with='80%' aligth='center'>";
            echo $reg[$i];
        echo "</td> ";   
        echo "</tr>";
    }
}
echo "</table>";
bdd_cerrar($cnx);

?>
<SCRIPT type="text/javascript" >
    function cambiar_color_over(celda){
   celda.style.backgroundColor="#DF7401"
}
function cambiar_color_out(celda){
   celda.style.backgroundColor="#F2F2F2"
}
</script>