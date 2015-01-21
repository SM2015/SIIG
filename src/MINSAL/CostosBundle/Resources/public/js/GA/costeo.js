window.SONATA_CONFIG = {
    USE_ICHECK: false
};

$(document).ready(function () {
    options = {
        monthNames: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec']
    };
    $('#anio_mes').monthpicker(options);
    
    var sSwfPath = "/bundles/indicadores/js/DataTables/media/swf/copy_csv_xls_pdf.swf";
    
    var oLanguage = {
        "sLengthMenu": "Display _MENU_ records per page",
        "sZeroRecords": trans.nada_encontrado,
        "sInfo": trans.mostrando_n_de_n,
        "sInfoEmpty": trans.mostrando_0,
        "sInfoFiltered": trans.filtrados_dequ
    };
    
    var table = $('#gaCostos').DataTable({
            "bJQueryUI": true,
            "paging": false,
            "scrollY": "400px",
            "scrollCollapse": true,
            "scrollX": true,
            "sDom": '<"H"Tfr>t<"F"ip>',
            "oTableTools": {
                "sSwfPath": sSwfPath,
                "aButtons": [
                    {
                        "sExtends": "collection",
                        "sButtonText": trans.exportar,
                        "aButtons": [{
                                "sExtends": "csv",
                                "sTitle": 'GA'+$('#anio_mes').val()+'_'+$('#establecimiento').val()
                            }, {
                                "sExtends": "xls",
                                "sTitle": 'GA'+$('#anio_mes').val()+'_'+$('#establecimiento').val()
                            }, {
                                "sExtends": "pdf",
                                "sTitle": 'GA'+$('#anio_mes').val()+'_'+$('#establecimiento').val()
                            }]
                    }
                ]
            },
            "oLanguage": oLanguage
        });
    $('.togle_columns').on( 'click', function (e) {
        //e.preventDefault();

        // Get the column API object
        var column = table.column( $(this).attr('data-column') );
 
        // Toggle the visibility
        column.visible( ! column.visible() );
    });
});


