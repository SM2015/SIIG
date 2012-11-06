$(document).ready(function(){   
    //Verificar que al menos un campo esté seleccionado
    $('input:checkbox').change(function(){
        if ($('input:checkbox:checked').size() < 1){
            alert('Debe haber al menos un campo seleccionado');
            $(this).attr('checked','ckecked');
        }
    })
});