<?php
include_once("indicadores.php");
include_once("../../addons/general/general.php");
$nombre= 	(isset($_REQUEST['nombre'])) ? $_REQUEST['nombre'] : NULL;
$tema= 	(isset($_REQUEST['tema'])) ? $_REQUEST['tema'] : NULL;
$cnivel=		(isset($_REQUEST['cnivel'])) ? $_REQUEST['cnivel'] : NULL;
$ctecnica= 	(isset($_REQUEST['ctecnica'])) ? $_REQUEST['ctecnica'] : NULL;
$cuso= 	(isset($_REQUEST['cuso'])) ? $_REQUEST['cuso'] : NULL;
$responsable=		(isset($_REQUEST['responsable'])) ? $_REQUEST['responsable'] : NULL;
$cnx = bdd_conectar();
    $data = array('Marcar');
    $urls = array('Marcar');
if ($nombre <> '[Seleccione Uno ..]'){
    echo listarTodos("ficha_tecnica where id_ficha_tecnica='".$nombre."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
}else{
    if($tema<> '[Seleccione Uno ..]' and $cnivel=='[Seleccione Uno ..]' and $ctecnica=='[Seleccione Uno ..]' and $cuso=='[Seleccione Uno ..]' and $responsable=='[Seleccione Uno ..]'){
        echo listarTodos("ficha_tecnica where tema='".$tema."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
    }else{
        if($tema== '[Seleccione Uno ..]' and $cnivel=='[Seleccione Uno ..]' and $ctecnica<>'[Seleccione Uno ..]' and $cuso=='[Seleccione Uno ..]' and $responsable=='[Seleccione Uno ..]'){
            echo listarTodos("ficha_tecnica where id_clasificacion_tecnica='".$ctecnica."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
        }else{
            if($tema== '[Seleccione Uno ..]' and $cnivel<>'[Seleccione Uno ..]'  and $ctecnica=='[Seleccione Uno ..]' and $cuso=='[Seleccione Uno ..]' and $responsable=='[Seleccione Uno ..]'){
                echo listarTodos("ficha_tecnica where id_clasificacion_nivel='".$cnivel."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
            }else{
               if($tema== '[Seleccione Uno ..]' and $cnivel=='[Seleccione Uno ..]'  and $ctecnica=='[Seleccione Uno ..]' and $cuso<>'[Seleccione Uno ..]' and $responsable=='[Seleccione Uno ..]'){
                   echo listarTodos("ficha_tecnica where id_clasificacion_uso='".$cuso."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
                }else{
                    if($tema== '[Seleccione Uno ..]' and $cnivel=='[Seleccione Uno ..]'  and $ctecnica=='[Seleccione Uno ..]' and $cuso=='[Seleccione Uno ..]' and $responsable<>'[Seleccione Uno ..]'){
                        echo listarTodos("ficha_tecnica where id_responsable_indicador='".$responsable."' ", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
                    }else{
                       echo listarTodos("ficha_tecnica", $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador');
                    }
                }
            }
        }
    }
}    
    bdd_cerrar($cnx);
?>