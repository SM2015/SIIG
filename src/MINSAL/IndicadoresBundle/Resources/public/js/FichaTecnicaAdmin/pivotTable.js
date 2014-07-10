var idIndicadorActivo;
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
    $('#export').click(function(){
       var t = $('.pvtTable');
        tableToExcel(t[0],'indicador');
    });
    $('#export_grp').click(function() {        
        $('#myModalLabel2').html(trans.guardar_imagen);
        $('#myModal2').modal('show');
    });
    
    $('#ver_ficha').click(function() {
        if (idIndicadorActivo != null){ 
            $.get(Routing.generate('get_indicador_ficha',
                    {id: idIndicadorActivo}),
                    function(resp) {
                        resp.replace('span12', 'span10');
                        $('#fichaTecnicaContent').html(resp);
                        $('#fichaTecnicaContent').html('<table>' + $('#fichaTecnicaContent table').html() + '</table>');
                        $('#fichaTecnica').modal('show');
                    });
        }
    });
    
    $('A.indicador').click(function() {
        var id_indicador = $(this).attr('id');
        var nombre_indicador = $(this).html();
        //var derivers = $.pivotUtilities.derivers;

        var renderers = $.extend($.pivotUtilities.renderers,
                $.pivotUtilities.gchart_renderers);
                
        
        $.getJSON(Routing.generate('get_datos_indicador', {id: id_indicador}), function(mps) {
            $("#output").pivotUI(mps, {
                renderers: renderers,
                menuLimit: 500,
                unusedAttrsVertical: false
            }, false, 'es');
            $('#marco-sala').attr('data-content', nombre_indicador);
            $('#myTab a:first').tab('show');
            idIndicadorActivo = id_indicador;
        });
    });
});

var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (table !== undefined){        
        if (!table.nodeType) table = document.getElementById(table);
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML};
        window.location.href = uri + base64(format(template, ctx));
    }
}
})();