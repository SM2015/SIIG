/*
 ################ FORMATS ##################
 -------------------------------------------
 */


var formatAsPercentage = d3.format("%"),
        formatAsPercentage1Dec = d3.format(".1%"),
        formatPercent = d3.format("%"),
        formatAsInteger = d3.format(","),
        fsec = d3.time.format("%S s"),
        fmin = d3.time.format("%M m"),
        fhou = d3.time.format("%H h"),
        fwee = d3.time.format("%a"),
        fdat = d3.time.format("%d d"),
        fmon = d3.time.format("%b")
        ;

//var datasetPrincipal;
var datasetPrincipal_bk;
var zona=1;
var max_zonas = 3;
//var rangos_alertas;
//var grafico;
var color = d3.scale.category20();    //builtin range of colors

function colores_alertas(zona, indice, i) {

    var rangos_alertas = JSON.parse($('#' + zona + ' .titulo_indicador').attr('rangos_alertas'));    
    if (rangos_alertas.length === 0)
        return color(i);
    else {
        for (ii = 0; ii < rangos_alertas.length; ii++) {
            if (indice <= rangos_alertas[ii].limite_sup)
                return rangos_alertas[ii].color;
        }
        return 'lightblue';
    }
}

function dibujarGraficoPrincipal(zona, tipo) {
    $('#' + zona + ' .dimension').html('<h4>' + $('#' + zona + ' .dimensiones option:selected').html() + '</h4>');
    cerrarMenus();
    var grafico = crearGraficoObj(zona, tipo);

    grafico.dibujar();
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'))    
    construir_tabla_datos(zona, datasetPrincipal);
}


function crearGraficoObj(zona, tipo) {
    var grafico;
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));    
    if (tipo == null || tipo == 'pastel')
        grafico = new graficoPastel(zona, datasetPrincipal);
    else if (tipo == 'columnas')
        grafico = new graficoColumnas(zona, datasetPrincipal);
    else if (tipo == 'lineas')
        grafico = new graficoLineas(zona, datasetPrincipal);
    else if (tipo == 'mapa')
        grafico = new graficoMapa(zona, datasetPrincipal);
    
    return grafico;
}
function ascenderNivelDimension(zona, nivel) {
    var ultimo,
            ruta = '',
            $filtro = $('#' + zona + ' .filtros_dimensiones'),
            filtros_obj = jQuery.parseJSON($filtro.attr('data'));

    var nuevo_filtro = [{}];
    $.each(filtros_obj, function(i, obj) {

        if (i <= nivel) {
            nuevo_filtro[i] = obj;
            if (i == nivel)
                ruta += obj.etiqueta + ': ' + obj.valor;
            else
                ruta += '<A data="' + i + '">' + obj.etiqueta + ': ' + obj.valor + '</A> / ';
        }
        else {
            // Los que estén a la derecha del seleccionado deben volver al control de dimensiones                        
            $('#' + zona + ' .dimensiones').append("<OPTION VALUE='" + obj.codigo + "'>" + obj.etiqueta + "</OPTION>");
            if (i == parseInt(nivel) + 1)
                primero = obj.codigo;
        }
    });

    //El primer elemento 
    $('#' + zona + ' .dimensiones').children('option[value="' + primero + '"]').attr('selected', 'selected');

    $filtro.html(ruta);
    $filtro.attr('data', JSON.stringify(nuevo_filtro));

    $('#' + zona + ' .filtros_dimensiones A').click(function() {
        ascenderNivelDimension(zona, $(this).attr('data'));
    });

    dibujarGrafico(zona, $('#' + zona + ' .dimensiones').val());
    $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
    $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
    //filtros();
}

function filtroRuta(filtros_obj){
    var ruta = '';
    //var filtros_obj = );
    var cant_obj = filtros_obj.length;
    $.each(filtros_obj, function(i, obj) {
        if (i == (cant_obj - 1))
            ruta += obj.etiqueta + ': ' + obj.valor;
        else
            ruta += '<A data="' + i + '">' + obj.etiqueta + ': ' + obj.valor + '</A> / ';
    });
    return ruta;
}
function descenderNivelDimension(zona, category) {
    if ($('#' + zona + ' .dimensiones option').length <= 1) {
        alert('No hay más niveles para descender');
        return;
    }
    var $dimension = $('#' + zona + ' .dimensiones option:selected');
    var $filtro = $('#' + zona + ' .filtros_dimensiones');
    var separador1 = '',
            separador2 = '';

    // Construir la cadena de filtros
    var filtros = $filtro.attr('data');
    var filtro_a_agregar = '{"codigo":"' + $dimension.val() + '",' +
            '"etiqueta":"' + $dimension.html() + '",' +
            '"valor":"' + category + '"' +
            "}";

    if (filtros != '' && filtros != null)
        separador1 += ',';
    else
        filtros = '[';

    filtros = filtros.replace(']', '');
    $filtro.attr('data', filtros + separador1 + filtro_a_agregar + ']');

    var ruta = filtroRuta(jQuery.parseJSON($filtro.attr('data')));
    $filtro.html(ruta);

    //Borrar la opcion del control de dimensiones
    $dimension.remove();

    $('#' + zona + ' .filtros_dimensiones A').click(function() {
        ascenderNivelDimension(zona, $(this).attr('data'));
    });

    dibujarGrafico(zona, $('#' + zona + ' .dimensiones').val());
    $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
    $('#' + zona + '.ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
    //filtros()
}

function dibujarGrafico(zona, dimension) {
    if (dimension === null)
        return;
    var filtro = $('#' + zona + ' .filtros_dimensiones').attr('data');
    $.getJSON(Routing.generate('indicador_datos',
            {id: $('#' + zona + ' .titulo_indicador').attr('data-id'), dimension: dimension}),
    {filtro: filtro},
    function(resp) {
        $('#' + zona).attr('datasetPrincipal', JSON.stringify(resp.datos));
        $('#' + zona).attr('datasetPrincipal_bk', JSON.stringify(resp.datos));
        //datasetPrincipal = resp.datos;
        //datasetPrincipal_bk = datasetPrincipal;

        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
        controles_filtros(zona);        
    });

}

function ordenarDatos(zona, ordenar_por, modo_orden) {    
    if (modo_orden === '-1')
        return;
    if (ordenar_por === 'dimension')
        $('#'+zona+' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
    else
        $('#'+zona+' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');

    cerrarMenus();
    $('#'+zona).attr('orden','[{"tipo":"'+ordenar_por+'", "modo": "'+modo_orden+'"}]');            
    var grafico = crearGraficoObj(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    grafico.ordenar(modo_orden, ordenar_por);
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));
    construir_tabla_datos(zona, datasetPrincipal);
}

function aplicarFiltro(zona) {
    var elementos = '';
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));
    
    $('#'+zona+' .capa_dimension_valores input:checked').each(function() {
        elementos += $(this).val() + '&';
    });    
    $.post(Routing.generate('indicador_datos_filtrar'),
            {datos: datasetPrincipal, desde: $('#'+zona+' .filtro_desde').val(), hasta: $('#'+zona+' .filtro_hasta').val(),
                elementos: elementos},
    function(resp) {
        //datasetPrincipal = resp.datos;
        $('#' + zona).attr('datasetPrincipal', JSON.stringify(resp.datos));
        dibujarGraficoPrincipal(zona, $('#'+zona+' .tipo_grafico_principal').val());
    }, 'json');
}

function controles_filtros(zona) {
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));    
    
    var lista_datos_dimension = '<DIV><input type="button" class="aplicar_filtro" value="' + trans.filtrar + '"/>' +
            '<input type="button" class="quitar_filtro" value="' + trans.quitar_filtro + '"/></DIV>';
    lista_datos_dimension += '<DIV class="capa_dimension_valores span12">' + trans.filtrar_por_elemento;
    $.each(datasetPrincipal, function(i, dato) {
        lista_datos_dimension += '<li><input class="detenerclic" type="checkbox" id="categorias_a_mostrar' + zona+i + '" ' +
                'name="categorias_a_mostrar[]" value="' + dato.category + '" /><label class="detenerclic" for="categorias_a_mostrar' + zona+i + '" >' + dato.category + '</label></li>';
    });    
    lista_datos_dimension += '</DIV>';
    
    $('#'+zona+' .lista_datos_dimension').html(lista_datos_dimension);

    $('.detenerclic').click(function(event) {
        event.stopPropagation();
    })
    $('#'+zona+' .aplicar_filtro').click(function() {
        aplicarFiltro(zona);
    });
    $('#'+zona+' .quitar_filtro').click(function() {
        $('#'+zona+' .filtro_desde').val('');
        $('#'+zona+' .filtro_hasta').val('');
        $('#'+zona+' .capa_dimension_valores input:checked').each(function() {
            $(this).attr('checked', false);
        });
        //datasetPrincipal = datasetPrincipal_bk;
        $('#' + zona).attr('datasetPrincipal', $('#' + zona).attr('datasetPrincipal_bk'))        
        dibujarGraficoPrincipal(zona, $('#'+zona+' .tipo_grafico_principal').val());
    });
}
function cerrarMenus() {
    $('.open').each(function(i, nodo) {
        $(nodo).removeClass('open');
    })
}

function construir_tabla_datos(zona, datos) {
    var tabla_datos = '<TABLE class="table" >';
    $.each(datos, function(i, fila) {
        if (i === 0) {
            // Los nombres de los campos
            tabla_datos += '<THEAD><TR>';
            for (var campo in fila) {

                if (campo === 'category')
                    campo = $('#' + zona + ' .dimension h4').html();
                else if (campo === 'measure')
                    campo = trans.indicador + ' (' + $('#' + zona + ' .titulo_indicador').attr('formula') + ')';
                tabla_datos += '<TH>' + campo.toUpperCase() + '</TH>';
            }
            tabla_datos += '</TR></THEAD>';
        }

        //los datos
        tabla_datos += '<TBODY><TR>';
        for (var i in fila)
            tabla_datos += '<TD>' + fila[i] + '</TD>';
        tabla_datos += '</TR></TBODY>';

    });
    tabla_datos += '</TABLE>';
    
    $('#' + zona + ' .info').html(tabla_datos);
}

function dibujarControles(zona, datos) {
    $('#' + zona + ' .titulo_indicador').html(datos.nombre_indicador)
            .attr('data-unidad-medida', datos.unidad_medida)
            .attr('formula', datos.formula)
            .attr('data-id', datos.id_indicador)
            .attr('rangos_alertas', JSON.stringify(datos.rangos));

    var combo_dimensiones = trans.cambiar_dimension + ": <SELECT class='dimensiones' name='dimensiones'>";
    $.each(datos.dimensiones, function(codigo, dimension) {
        combo_dimensiones += "<option value='" + codigo + "'>" + dimension + "</option>";
    });
    combo_dimensiones += "</SELECT>"

    var combo_tipo_grafico = trans.tipo_grafico + ": <SELECT class='tipo_grafico_principal' name='tipo_grafico_principal' >";
    combo_tipo_grafico += "<OPTION VALUE='columnas'>Columnas</OPTION>" +
            "<OPTION VALUE='pastel'>Pastel</OPTION>" +
            "<OPTION VALUE='mapa'>Mapa</OPTION>" +
            "<OPTION VALUE='lineas'>Lineas</OPTION>";
    combo_tipo_grafico += "</SELECT>";

    var combo_ordenar_por_dimension = trans.orden + ": <SELECT class='ordenar_dimension'>" +
            "<OPTION VALUE='-1'></OPTION>" +
            "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
            "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
            "</SELECT>";
    var combo_ordenar_por_medida = trans.orden + ": <SELECT class='ordenar_medida'>" +
            "<OPTION VALUE='-1'></OPTION>" +
            "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
            "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
            "</SELECT>";
    var filtro_posicion = trans.filtro_posicion + " " + trans.desde +
            "<INPUT class='valores_filtro filtro_desde' type='text' length='5' value=''> " + trans.hasta +
            "<INPUT class='valores_filtro filtro_hasta' type='text' length='5' value=''> ";
    var opciones_dimension = '<div class="btn-group dropup">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' + trans.dimension_opciones + '">' +
            '<i class="icon-check"></i>' +
            '<span class="caret"></span>' +
            '</button>' +
            '<ul class="opciones_dimension dropdown-menu" role="menu" >' +
            '<li><A class="detenerclic">' + combo_dimensiones + '</A></li>' +
            '<li><A class="detenerclic">' + combo_ordenar_por_dimension + '</A></li>' +
            '<li><A class="detenerclic">' + filtro_posicion + '</A></li>' +
            '<li class="lista_datos_dimension"></li>' +
            '</ul>' +
            '</div>';

    var opciones = '<div class="btn-group dropdown">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' + trans.opciones + '">' +
            '<i class="icon-cog"></i>' +
            '<span class="caret"></span>' +
            '</button>' +
            '<ul class="dropdown-menu" role="menu" >' +
            '<li><A class="ver_ficha_tecnica" '
            + ' href="' + Routing.generate('get_indicador_ficha', {id: datos.id_indicador}) + '"><i class="icon-briefcase"></i> ' + trans.ver_ficha_tecnica + '</A></li>' +
            '<li><A class="ver_tabla_datos" ><i class="icon-list-alt" ></i> ' + trans.tabla_datos + ' </A></li>' +
            '<li><A class="ver_imagen" ><i class="icon-picture"></i> ' + trans.descargar_grafico + '</A></li>' +
            '<li><A class="agregar_como_favorito" data-indicador="' + datos.id_indicador + '" >';
    if ($('#fav-' + datos.id_indicador).length === 0)
        opciones += '<i class="icon-star"></i> ' + trans.agregar_favorito + '</A></li>';
    else
        opciones += '<i class="icon-star-empty"></i> ' + trans.quitar_favoritos + '</A></li>';
    opciones += '</ul>' +
            '</div>';
    var opciones_indicador = '<div class="btn-group">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" >' + trans.indicador_opciones +
            '<span class="caret"></span>' +
            '</button>' +
            '<ul class="dropdown-menu" role="menu" >' +
            '<li><A class="detenerclic">' + combo_tipo_grafico + '</A></li>' +
            '<li><A class="detenerclic">' + combo_ordenar_por_medida + '</A></li>';


    $('#' + zona + ' .controlesDimension').html('');
    $('#' + zona + ' .controlesDimension').append(opciones_dimension);




    var rangos_alertas = datos.rangos;

    var alertas = '';
    alertas += '<TABLE class="table"><CAPTION>' + trans.alertas_indicador + '</CAPTION>' +
            '<THEAD>' +
            '<TR>' +
            '<TH>' + trans.color + '</TH>' +
            '<TH>' + trans.limite_inf + '</TH>' +
            '<TH>' + trans.limite_sup + '</TH>' +
            '<TH>' + trans.comentario + '</TH>' +
            '</TR>' +
            '</THEAD>' +
            '<TBODY>';

    var max_rango = 0;
    $.each(rangos_alertas, function(i, rango) {
        var comentario_rango = '';
        if (rango.comentario === null)
            comentario_rango = '';
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
    $('#' + zona + ' .titulo_indicador').attr('data-max_rango', max_rango);
    alertas += '<TR><TD bgcolor="lightblue"></TD>' +
            '<TD colspan="3">' + trans.rango_no_especificado + '</TD>'
    '</TR></TBODY><TABLE>';
    $('#' + zona + ' .alertas').html('');
    $('#' + zona + ' .grafico').html('');
    if (rangos_alertas.length > 0) {
        opciones_indicador += '<li><A class="detenerclic">' +
                trans.max_escala_y +
                ": <SELECT class='max_y'>" +
                "<OPTION VALUE='indicador' selected='selected'>" + trans.max_indicador + "</OPTION>" +
                "<OPTION VALUE='rango_alertas'>" + trans.max_rango_alertas + "</OPTION>" +
                "</SELECT>" +
                '</A></li></ul></div>';
        $('#' + zona + ' .controles').append(opciones_indicador);

        $('#' + zona + ' .controles').append('<div class="btn-group">' +
                '<a class="btn btn-warning dropdown-toggle" data-toggle="dropdown" title="' + trans.alertas_indicador + '">' +
                '<i class="icon-exclamation-sign"></i>' +
                '<span class="caret"></span>' +
                '</a>' +
                '<ul class="dropdown-menu">' +
                alertas +
                '</ul>' +
                '</div>');
    } else {
        opciones_indicador += '</ul></div>';
        $('#' + zona + ' .controles').append(opciones_indicador);
    }
    $('#' + zona + ' .controles').append(opciones);

    $('#' + zona + ' .max_y').change(function() {
        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    });
    $('#' + zona + ' .ordenar_medida').change(function() {
        ordenarDatos(zona, 'medida', $(this).val());
    });

    $('#' + zona + ' .ordenar_dimension').change(function() {
        ordenarDatos(zona, 'dimension', $(this).val());
    });

    $('#' + zona + ' .dimensiones').change(function() {
        $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
        $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
        dibujarGrafico(zona, $(this).val());
    });

    $('#' + zona + ' .tipo_grafico_principal').change(function() {
        dibujarGraficoPrincipal(zona, $(this).val());
    });
    $('#' + zona + ' .agregar_como_favorito').click(function() {
        alternar_favorito(zona, $(this).attr('data-indicador'));
        cerrarMenus();
    });
    $('#' + zona + ' .info').hide();
    $('#' + zona + ' .ver_tabla_datos').click(function() {
        $('#' + zona + ' .info').toggle();
        cerrarMenus();
    });

    $('#' + zona + ' .ver_imagen').click(function() {
        canvg('canvas', $("#" + zona + ' .grafico').html().trim());
        Canvas2Image.saveAsPNG(document.getElementById('canvas'));
        cerrarMenus();
    });

    $('#' + zona + ' .ver_ficha_tecnica').click(function() {
        //ver_ficha_tecnica($(this).attr('data-indicador'));
        cerrarMenus();
    });
}

function alternar_favorito(zona, id_indicador) {
    //Revisar si ya es favorito
    var es_favorito;
    ($('#fav-' + id_indicador).length === 0) ? es_favorito = false : es_favorito = true;
    var cant_favoritos = parseInt($('#cantidad_favoritos').html());
    cant_favoritos = (es_favorito) ? cant_favoritos - 1 : cant_favoritos + 1;
    $('#cantidad_favoritos').html(cant_favoritos);

    if (es_favorito) {
        $('#' + zona + ' .agregar_como_favorito').html('<i class="icon-star"></i>' + trans.agregar_favorito);
        $('#li_fav-' + id_indicador).remove();
    } else {
        $('#' + zona + ' .agregar_como_favorito').html('<i class=" icon-star-empty"></i>' + trans.quitar_favoritos);
        $('#listado-favoritos').append("<li id='li_fav-" + id_indicador + "'><A data-id='" + id_indicador + "' " +
                "id='fav-" + id_indicador + "' " +
                "data-unidad-medida='" + $('#' + zona + ' .titulo_indicador').attr('data-unidad-medida') + "'>" +
                $('#' + zona + ' .titulo_indicador').html() +
                "</A></li>");

        $('#fav-' + id_indicador).click(function() {
            $('#'+zona+' .controles').html('');
            $('#'+zona+' .filtros_dimensiones').html('').attr('data', '');

            recuperarDimensiones(id_indicador);
        });
    }
    $.get(Routing.generate('indicador_favorito'),
            {id: $('#' + zona + ' .titulo_indicador').attr('data-id'), es_favorito: es_favorito}
    );
}

function limpiarZona(zona){
    $('#' + zona + ' .controles').html('');
    $('#' + zona + ' .filtros_dimensiones').attr('data', '');
    $('#' + zona + ' .filtros_dimensiones').html('');
}

function limpiarZona2(zona){
    limpiarZona(zona);
    $('#'+zona+' .titulo_indicador')
            .html('')
            .attr('data-unidad-medida','')
            .attr('formula','')
            .attr('rangos_alertas','')
            .attr('data-id','')
            .attr('data-max_rango','')
    $('#'+zona).attr('datasetprincipal','')
            .attr('datasetprincipal_bk','');
    $('#'+zona+' .grafico').html('');
    $('#'+zona+' .dimension').html('');
    $('#'+zona+' .controlesDimension').html('');    
}
function recuperarDimensiones(id_indicador, datos) {
    var zona_g = $('DIV.zona_actual').attr('id');
    limpiarZona(zona_g);
    $.getJSON(
            Routing.generate('indicador_dimensiones', {id: id_indicador}),
    function(resp) {
        //Construir el campo con las dimensiones disponibles
        if (resp.resultado === 'ok') {
            $('#canvas').hide();
            dibujarControles(zona_g, resp);
            if (datos !==null){
                if(JSON.stringify(datos.filtro) !== '""'){
                    var $filtro = $('#' + zona_g + ' .filtros_dimensiones');
                    $filtro.attr('data', datos.filtro);
                    filtro_obj = jQuery.parseJSON($filtro.attr('data'));
                    var ruta = filtroRuta(filtro_obj);
                    $filtro.html(ruta);
                   
                    for (i=0; i< filtro_obj.length; i++){
                        $('#' + zona_g + ' .dimensiones')
                            .children('option[value=' + filtro_obj[i].codigo + ']')
                            .remove();
                    }
                    
                    $('#' + zona_g + ' .filtros_dimensiones A').click(function() {
                        ascenderNivelDimension(zona_g, $(this).attr('data'));
                    });
                }
                $('#' + zona_g + ' .titulo_indicador').attr('data-id', datos.idIndicador);
                $('#' + zona_g).attr('orden', datos.orden);
                $('#' + zona_g + ' .dimensiones').val(datos.dimension);
                $('#' + zona_g + ' .tipo_grafico_principal').val(datos.tipoGrafico);
            }
            dibujarGrafico(zona_g, $('#' + zona_g + ' .dimensiones').val());
        }

    });
}