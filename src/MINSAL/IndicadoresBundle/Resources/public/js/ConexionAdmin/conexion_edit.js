$(document).ready(function() {
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $id = $('input[id$="_usuario"]').attr('id').split('_')[0];

    // La barra con los botones de acción
    // Agregaré el de probar conexión     
    $('#btn_probar_conexion').appendTo('div .form-actions');
    $('#btn_probar_conexion').after("<span id='resultado_probar_conexion'></span>");

    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });
    $('#btn_probar_conexion').click(function() {
        /* A cada nombre de campo se le agrega como prefijo el id que se está usando 
         * para el formulario, lo quitaré para que sea más fácil de manipular del lado del servidor
         */
        var patron = new RegExp($id + "%5B", "ig");
        var datos = $("form").serialize().replace(patron, '').replace(/%5D/ig, '').replace(/%5B/ig, '');

        $('#resultado_probar_conexion').load(Routing.generate('origen_dato_conexion_probar'), datos);

    });
});

