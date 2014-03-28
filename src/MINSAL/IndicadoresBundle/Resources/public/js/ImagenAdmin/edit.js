$(document).ready(function() {    
    
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var id = $('input[id$="_titulo"]').attr('id').split('_')[0];

    $('#' + id + '_1 fieldset').append('<DIV class="nailthumb-container square span4" id="div_imagen"> <img src = "'+$('#ruta_imagen').val()+'" /><DIV>');
    $('#' + id + '_1 fieldset .sonata-ba-collapsed-fields').addClass('span6');
        
    jQuery('.nailthumb-container').nailthumb({width:400,height:270,method:'resize',fitDirection:'top left'});
    
    
});