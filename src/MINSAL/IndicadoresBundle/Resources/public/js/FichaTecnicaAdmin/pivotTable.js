google.load("visualization", "1", {packages: ["corechart", "charteditor"]});
$(document).ready(function() {
    $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });
    function ajax_states() {
        $(document).bind("ajaxStart.mine", function() {
            $('#div_carga').show();
        });
        $(document).bind("ajaxStop.mine", function() {
            $('#div_carga').hide();
        });
    }
    ajax_states();
    $('A.indicador').click(function() {
        var id_indicador = $(this).attr('id');
        var nombre_indicador = $(this).html();
        //var derivers = $.pivotUtilities.derivers;

        delete $.pivotUtilities.renderers['Heatmap'];
        delete $.pivotUtilities.renderers['Row Heatmap'];
        delete $.pivotUtilities.renderers['Col Heatmap'];

        var renderers = $.extend($.pivotUtilities.renderers,
                $.pivotUtilities.gchart_renderers);

        $.getJSON(Routing.generate('get_datos_indicador', {id: id_indicador}), function(mps) {
            $("#output").pivotUI(mps, {
                renderers: renderers,
                menuLimit: 500                
            });
            $('.marco-sala').attr('data-content', nombre_indicador);
            $('#myTab a:first').tab('show');
        });
    });
});