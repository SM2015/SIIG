$(document).ready(function() {
    //Ocultar los indicadores asignados
    $('div[id$="_gruposIndicadores"]').hide();

    // Recuperar los indicadores del usuario
    $('div[id$="_gruposIndicadores"] span').each(function(i, nodo) {
        //alert($(nodo).html().trim());
        $('div[id$="salas"] input:checkbox[value=' + $(nodo).html().trim() + ']').attr('checked', true);

    });

    //Mandar al servidor a guardar o borrar la asignación de sala al usuario
    $('div[id$="salas"] input:checkbox').change(function() {
        var accion;
        if ($(this).is(':checked'))
            accion = 'add';
        else
            accion = 'remove';
        $.get(Routing.generate('usuario_asignar_sala',
                {id: $('input[id$="_id"]').val(), id_sala: $(this).val(), accion: accion}));
    });

    $('ul[id$="_realRoles"] span').each(function(i, nodo){
        
        $(this).html($(this).html().replace('ROLE_SONATA_ADMIN_',''));
        $(this).html($(this).html().replace('ROLE_SONATA_USER_ADMIN_',''));        
    });
});
