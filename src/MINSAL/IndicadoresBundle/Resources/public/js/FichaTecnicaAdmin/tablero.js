$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });    
            
    capa = $("div.tablero .row-fluid");
    var posicion = capa.position();
    capa.css({'position': 'absolute',
        'bottom': '15px',
        'top': posicion.top});
    $('#listado_indicadores').accordion({
        heightStyle: "fill"
    });

    $('#listado_indicadores A').click(function() {
        $('#controles').html('');
        $('#filtros_dimensiones').html('').attr('data', '');

        recuperarDimensiones($(this).attr('data-id'));
    });
    var $tit_categoria = $('#listado_indicadores h4');

    var espacio_tit_categoria = $tit_categoria.height() * 1.8 * $tit_categoria.length;

    $('#listado_indicadores div').css({'max-height': capa.height() - espacio_tit_categoria, 'height':'150px'});
    
    $('#ocultar_panel_izq').attr('title', trans.ocultar_listado_indicadores);
    $('#ocultar_panel_izq').click(function(){
       $('#listado_indicadores').toggle('explode',{},500);
       if ($(this).attr('class')=='icon-arrow-left')
            $(this).attr('class','icon-arrow-right').attr('title', trans.mostrar_listado_indicadores);        
        else
            $(this).attr('class','icon-arrow-left').attr('title', trans.ocultar_listado_indicadores);
    });

    //dibujarGraficoPrincipal($('#tipo_grafico_primario').val());

    function recuperarDimensiones(id_indicador) {

        $.getJSON(
                Routing.generate('indicador_dimensiones', {id: id_indicador}),
        function(resp) {
            //Construir el campo con las dimensiones disponibles
            if (resp.resultado == 'ok') {
                $('#titulo_indicador').html(resp.nombre_indicador)
                        .attr('data-unidad-medida', resp.unidad_medida)
                        .attr('data-id', resp.id_indicador);
                formula = resp.formula;                
                var combo_dimensiones = trans.cambiar_dimension + ": <SELECT ID='dimensiones' name='dimensiones'>";
                $.each(resp.dimensiones, function(codigo, dimension) {
                    combo_dimensiones += "<option value='" + codigo + "'>" + dimension + "</option>";
                });
                combo_dimensiones += "</SELECT>"

                var combo_tipo_grafico = trans.tipo_grafico + ": <SELECT id='tipo_grafico_principal' name='tipo_grafico_principal' >";
                combo_tipo_grafico += "<OPTION VALUE='columnas'>Columnas</OPTION>" +
                        "<OPTION VALUE='pastel'>Pastel</OPTION>" +
                        "<OPTION VALUE='mapa'>Mapa</OPTION>" +
                        "<OPTION VALUE='lineas'>Lineas</OPTION>";
                combo_tipo_grafico += "</SELECT>";

                var combo_ordenar_por_dimension = trans.orden + ": <SELECT id='ordenar_dimension'>" +
                        "<OPTION VALUE='-1'></OPTION>" +
                        "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
                        "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
                        "</SELECT>";
                var combo_ordenar_por_medida = trans.orden + ": <SELECT id='ordenar_medida'>" +
                        "<OPTION VALUE='-1'></OPTION>" +
                        "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
                        "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
                        "</SELECT>";
                var filtro_posicion = trans.filtro_posicion + " " + trans.desde +
                        "<INPUT class='valores_filtro' id='filtro_desde' type='text' length='5' value=''> " + trans.hasta +
                        "<INPUT class='valores_filtro' id='filtro_hasta' type='text' length='5' value=''> ";
                var opciones_dimension = '<div class="btn-group dropup">' +
                        '<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">' + trans.dimension_opciones +
                            '<span class="caret"></span>' +
                        '</button>' +
                        '<ul id="opciones_dimension" class="dropdown-menu" role="menu" >' +
                        '<li><A class="detenerclic">' + combo_dimensiones + '</A></li>' +
                        '<li><A class="detenerclic">' + combo_ordenar_por_dimension + '</A></li>' +
                        '<li><A class="detenerclic">' + filtro_posicion + '</A></li>' +
                        '<li id="lista_datos_dimension"></li>' +
                        '</ul>' +
                        '</div>';

                var opciones = '<div class="btn-group dropdown">' +
                        '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="'+trans.opciones+'">' +
                            '<i class="icon-cog"></i>'+
                            '<span class="caret"></span>' +
                        '</button>' +
                        '<ul id="opciones" class="dropdown-menu" role="menu" >' +
                        '<li><A id="ver_ficha_tecnica" '
                        +' href="'+Routing.generate('get_indicador_ficha',{id: resp.id_indicador})+'"><i class="icon-briefcase"></i> '+trans.ver_ficha_tecnica+'</A></li>'+
                        '<li><A id="ver_tabla_datos"><i class="icon-list-alt"></i> '+trans.tabla_datos+' </A></li>'+
                        '<li><A id="ver_imagen"><i class="icon-picture"></i> '+trans.descargar_grafico+'</A></li>'+
                        '<li><A id="agregar_como_favorito" data-indicador="'+resp.id_indicador+'" href="#">';
                if ($('#fav-'+id_indicador).length==0)                
                    opciones += '<i class="icon-star"></i> '+trans.agregar_favorito+'</A></li>';
                else
                    opciones += '<i class="icon-star-empty"></i> '+trans.quitar_favoritos+'</A></li>';
                opciones +='</ul>' +
                        '</div>';
                var opciones_indicador = '<div class="btn-group">' +
                        '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" >' + trans.indicador_opciones+
                            '<span class="caret"></span>' +
                        '</button>' +
                        '<ul class="dropdown-menu" role="menu" >' +
                        '<li><A class="detenerclic">' + combo_tipo_grafico + '</A></li>' +
                        '<li><A class="detenerclic">' + combo_ordenar_por_medida + '</A></li>';                        
                

                $('#controlesDimension').html('');                
                $('#controlesDimension').append(opciones_dimension);
                

                $('#ordenar_dimension').change(function() {
                    ordenarDatos('dimension', $(this).val());
                });
                

                $('#dimensiones').change(function() {
                    $('#ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
                    $('#ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
                    dibujarGrafico($(this).val());
                });                
                            
                rangos_alertas = resp.rangos;

                var alertas = '';
                alertas += '<TABLE class="table"><CAPTION>' + trans.alertas_indicador + '</CAPTION>' +
                        '<THEAD>' +
                        '<TR>' +
                        '<TH>' + trans.color + '</TH>' +
                        '<TH>' + trans.limite_inf + '</TH>' +
                        '<TH>' + trans.limite_sup + '</TH>' +
                        '<TH>' + trans.comentario+ '</TH>' +
                        '</TR>' +
                        '</THEAD>' +
                        '<TBODY>';

                var max_rango=0;
                $.each(rangos_alertas, function(i, rango) {
                    var comentario_rango = '';
                    if (rango.comentario == null)
                        comentario_rango='';
                    else
                        comentario_rango = rango.comentario
                    alertas += '<TR>' +
                            '<TD bgcolor="' + rango.color + '"></TD>' +
                            '<TD>' + rango.limite_inf + '</TD>' +
                            '<TD>' + rango.limite_sup + '</TD>' +
                            '<TD>' + comentario_rango + '</TD>' +
                            '</TR>';
                    max_rango = rango.limite_sup;
                });
                $('#titulo_indicador').attr('data-max_rango',max_rango);
                alertas += '<TR><TD bgcolor="lightblue"></TD>'+
                            '<TD colspan="3">'+trans.rango_no_especificado+'</TD>'
                            '</TR></TBODY><TABLE>';
                $('#alertas').html('');
                $('#graficoPrimario').html('');
                if (rangos_alertas.length > 0){
                    opciones_indicador += '<li><A class="detenerclic">'+
                            trans.max_escala_y + 
                            ": <SELECT id='max_y'>" +
                                "<OPTION VALUE='indicador' selected='selected'>" + trans.max_indicador + "</OPTION>" +
                                "<OPTION VALUE='rango_alertas'>" + trans.max_rango_alertas + "</OPTION>" +
                            "</SELECT>"+
                        '</A></li></ul></div>';
                    $('#controles').append(opciones_indicador);
                
                    $('#controles').append('<div class="btn-group">'+
                                        '<a class="btn btn-warning dropdown-toggle" data-toggle="dropdown" href="#" title="'+trans.alertas_indicador+'">'+                                            
                                             '<i class="icon-exclamation-sign"></i>'+
                                             '<span class="caret"></span>'+
                                        '</a>'+
                                        '<ul class="dropdown-menu">'+
                                            alertas+
                                        '</ul>'+
                                        '</div>');                    
                }else{
                    opciones_indicador +=  '</ul></div>';
                    $('#controles').append(opciones_indicador);
                }
                $('#controles').append(opciones);
                $('#max_y').change(function() {
                    dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
                });
                $('#ordenar_medida').change(function() {
                    ordenarDatos('medida', $(this).val());
                });
                $('#tipo_grafico_principal').change(function() {
                    dibujarGraficoPrincipal($(this).val());
                });
                $('#agregar_como_favorito').click(function() {
                    alternar_favorito($(this).attr('data-indicador'));                    
                });
                $('#info').hide();
                $('#ver_tabla_datos').click(function() {
                    $('#info').toggle();
                });
                
                $('#canvas').hide();
                $('#ver_imagen').click(function() {                    
                    canvg('canvas', $("#graficoPrimario").html().trim());
                    Canvas2Image.saveAsPNG(document.getElementById('canvas'))
                });
                
                $('#ver_ficha_tecnica').click(function() {
                    //ver_ficha_tecnica($(this).attr('data-indicador'));                    
                });
            
                dibujarGrafico($('#dimensiones').val());
                //filtros();
            }

        });
    }

    function alternar_favorito(id_indicador){        
        //Revisar si ya es favorito
        var es_favorito;                    
        ($('#fav-'+id_indicador).length==0)? es_favorito=false:es_favorito=true;
        var cant_favoritos = parseInt($('#cantidad_favoritos').html());
        cant_favoritos = (es_favorito)? cant_favoritos - 1: cant_favoritos + 1;
        $('#cantidad_favoritos').html(cant_favoritos);

        if (es_favorito){
            $('#agregar_como_favorito').html('<i class="icon-star"></i>'+trans.agregar_favorito);
            $('#li_fav-'+id_indicador).remove();
        } else{
            $('#agregar_como_favorito').html('<i class=" icon-star-empty"></i>'+trans.quitar_favoritos);
            $('#listado-favoritos').append("<li id='li_fav-"+id_indicador+"'><A href='#' data-id='"+id_indicador+"' "+
                    "id='fav-"+id_indicador+"' "+
                    "data-unidad-medida='"+$('#titulo_indicador').attr('data-unidad-medida')+"'>"+
                    $('#titulo_indicador').html()+
                "</A></li>");

            $('#fav-'+id_indicador).click(function() {
                $('#controles').html('');
                $('#filtros_dimensiones').html('').attr('data', '');

                recuperarDimensiones(id_indicador);
            });
        }
        $.get(Routing.generate('indicador_favorito'),
            {id: $('#titulo_indicador').attr('data-id'), es_favorito: es_favorito}
            );
    }
    
    function ver_ficha_tecnica(id_indicador){ 
        $.get(Routing.generate('get_indicador_ficha',{id: id_indicador}));
    }


});