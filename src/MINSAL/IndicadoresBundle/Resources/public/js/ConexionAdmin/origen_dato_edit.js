$(document).ready(function(){   
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $id = $('input[id$="_nombre"]').attr('id').split('_')[0];
    
    //Borrar el botón para agregar y crear otro
    $('input[name$="btn_create_and_create"]').remove();
     
     //Si existe la capa configurar, cargar los datos
     if ($('#configurar').length){
         $('#configurar').load(Routing.generate('origen_dato_leer', { id: $('#configurar').attr('data') }));
     }
});

