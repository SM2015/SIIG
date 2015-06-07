window.SONATA_CONFIG = {
    USE_ICHECK: true,
    USE_SELECT2: true
};
$(document).ready(function() {
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $campos = $('textarea[id$="_camposIndicador"]');
    //$('DIV[id$="_camposIndicador"]').hide();
    $campos.hide();

    var campos_list = $campos.html().split(',');

    var listado = '<UL id="campos_orden">';
    $.each(campos_list, function(i, nodo) {
        listado += '<ol class="ui-state-default" data="' + nodo + '"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>' + nodo + '</ol>';
    });
    listado += '</UL>';
    $campos.parent().append(listado);

    $("#campos_orden").sortable({
        stop: function(event, ui) {
            cambiar_orden();
        }
    });

    //Al seleccionar una variable pasarla al campo de la fórmula
    //.on("select2-removing", function(e) { log ("removing val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    $('select[id$="_variables"]').on("select2-selecting", function(e) { 
        var variable = $.trim(e.choice.text.match(/(\([0-9A-Z_]+\)$)/g));
        variable = variable.replace('(','{').replace(')','}');
        $("input[id$='_formula']").atCaret('insert', variable);
    }).on("select2-removed", function(e) { 
        var variable = $.trim(e.choice.text.match(/(\([0-9A-Z_]+\)$)/g));
        variable = variable.replace('(','{').replace(')','}');
        $("input[id$='_formula']").val($("input[id$='_formula']").val().replace(variable, ''));
    });

    //Verificar que cuando se elija la clasificación técnica
    // solo se pueda marcar uno por categoría
    $('ul[id$="_clasificacionTecnica"] input').on('ifChecked', function(event){
        var categoria, $cambiar;
        var id = $(this).attr('id');
        
        categoria = $(this).parent().next('span').html().trim().split(' -- ')[0];
        
        $('ul[id$="_clasificacionTecnica"] span:contains(' + categoria + ')').prev().children('input[id!='+id+']').iCheck('uncheck');
        
    });
    
    function cambiar_orden() {
        var campos_nvo_orden = '';
        $("#campos_orden").children().each(function(i, nodo) {
            campos_nvo_orden += $(nodo).attr('data') + ',';
        });

        $campos.html(campos_nvo_orden.substring(0, campos_nvo_orden.length - 1));
    }
    
    alertas_aplicar_estilos();
    $('div[id$=_alertas]').on('sonata.add_element', function(event) {
        alertas_aplicar_estilos();
    });
    
    function alertas_aplicar_estilos(){
        $('div[id$=_alertas] select[id$=_color]').css('width','150px');
        $('div[id$=_alertas] label').remove();
        $('div[id$=_alertas] textarea[id$=_comentario]').css('width','350px');
    }
});
