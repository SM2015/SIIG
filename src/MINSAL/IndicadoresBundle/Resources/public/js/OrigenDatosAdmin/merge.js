$(document).ready(function(){
    //Verificar que al menos un campo esté seleccionado
    $('input:checkbox').change(function(){
        if ($('input:checkbox:checked').size() < 1){
            alert(trans.elija_al_menos_un_campo);
            $(this).attr('checked','ckecked');
        }
    });
});