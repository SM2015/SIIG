$(document).ready(function() {
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var id = $('input[id$="_nombre"]').attr('id').split('_')[0];

    $('#' + id + '_1 fieldset').append('<DIV class="span4" id="campos"><DIV>');
    $('#' + id + '_1 fieldset .sonata-ba-collapsed-fields').addClass('span6');
    $('input[type=text], select, textarea').css('width', '90%');

    $('#campos').load(Routing.generate('origen_dato_get_campos', {id: $('#' + id + '_origenDato').val()}),
    function() {
        agregame();
    });

    $('#' + id + '_origenDato').change(function() {
        $('#campos').load(Routing.generate('origen_dato_get_campos', {id: $(this).val()}),
        function() {
            agregame();
        });
    });

    function agregame() {
        $('.campos_disponibles a').click(function() {
            $("#"+id+'_formula').atCaret('insert', $(this).html()); 
        });
    }
});

