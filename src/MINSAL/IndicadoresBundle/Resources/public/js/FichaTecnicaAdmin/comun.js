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

var zona = 1;
var max_zonas = 3;

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
	//en el caso de que se recuperen tipos de graficos null
	//se asignan directamente a tipo columnas
	if (tipo == null)
		tipo = "columnas";
	
    $('#' + zona + ' .dimension').html($('#' + zona + ' .dimensiones option:selected').html());
    cerrarMenus();
    var grafico = crearGraficoObj(zona, tipo);

    $('#' + zona + ' .titulo').show();
    grafico.dibujar();
    aplicarFormato();

    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));
    construir_tabla_datos(zona, datasetPrincipal);
}
function aplicarFormato() {
    d3.selectAll(".axis path, .axis line")
            .attr('fill', 'none')
            .attr('stroke', 'black');
    d3.selectAll(".line")
            .attr('fill', 'none')
            .attr('stroke-width', '2px');
    d3.selectAll(".slice")
            .attr('font-size', '11pt')
            .attr('font-family', 'sans-serif');
    d3.selectAll(".axis text")
            .attr('font-family', 'sans-serif')
            .attr('font-size', '9pt');
    d3.selectAll(".background").attr('fill', 'none');

    d3.selectAll(".x g text").attr("transform", "rotate(45)").attr('x', 7).attr('y', 10).attr('text-anchor', 'start');
}
function crearGraficoObj(zona, tipo) {
    var grafico;
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));
    if (tipo == 'pastel')
        grafico = new graficoPastel(zona, datasetPrincipal);
    else if (tipo == 'columnas')
        grafico = new graficoColumnas(zona, datasetPrincipal);
    else if (tipo == 'lineas')
        grafico = new graficoLineas(zona, datasetPrincipal);
    else if (tipo == 'mapa')
        grafico = new graficoMapa(zona, datasetPrincipal);
    else if (tipo == 'gauge')
	{
    	if (datasetPrincipal[1] != null)
    	grafico = new graficoColumnas(zona, datasetPrincipal);
    	else
        grafico = new graficoGauge(zona, datasetPrincipal);
	}
    else if (tipo == 'lineargauge' /*termometro*/)
    {
    	if (datasetPrincipal[1] != null)
    	grafico = new graficoColumnas(zona, datasetPrincipal);
    	else
        grafico = new graficoTermometro(zona, datasetPrincipal);
    }

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
    $('#' + zona).attr('orden', null);
    $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
    $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
}

function filtroRuta(filtros_obj) {
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
        alert(trans.no_mas_niveles);
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
    $('#' + zona).attr('orden', null);
    $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
    $('#' + zona + '.ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
}

function dibujarGrafico(zona, dimension) {
    if (dimension === null)
        return;
    var filtro = $('#' + zona + ' .filtros_dimensiones').attr('data');
    //validar las entradas de las fechas
    var patron = /^\d{4}-\d{2}$/;
    var filtrofecha = {};
    
    if($('#fechainicio'+zona).val().match(patron) && $('#fechainicio'+zona).val() != ''
       && $('#fechafin'+zona).val().match(patron) && $('#fechafin'+zona).val() != ''
       && $('#filtro_por_fecha'+zona).is(':checked') == true)
    {
    	var min = $('#fechainicio'+zona).val().split('-');
        var max = $('#fechafin'+zona).val().split('-');
        filtrofecha = {mesmin : min[1],aniomin : min[0],mesmax:max[1],aniomax:max[0]};
    }
    
    $.getJSON(Routing.generate('indicador_datos',
            {id: $('#' + zona + ' .titulo_indicador').attr('data-id'), dimension: dimension}),
    {filtro: filtro, ver_sql: false, filtrofecha : filtrofecha},
    function(resp) {
    	    	
    	///////crear la cadena con el rango de datos
    	////
    	mensajerango = "";
    	val = resp.datos[0];
	    if (val.min_anio != undefined)
	    {
	    	if (val.min_mes == undefined)
	    		mensajerango += " ["+trans.de+" "+val.min_anio;
	    	else
	    		mensajerango += " [" + trans.de + " 01/"+("0" + val.min_mes).slice(-2)+"/"+val.min_anio;
	    	
	    	val = resp.datos[resp.datos.length-1];
	    	if (val.min_mes == undefined)
	    		mensajerango += " "+trans.a+" "+val.max_anio+"] ";
	    	else
	    		mensajerango += " "+trans.a+" 01/"+("0" + val.max_mes).slice(-2)+"/"+val.max_anio+"] ";
	    	
	    	$('#' + zona + ' .titulo_indicador').html($('#' + zona + ' .titulo_indicador').attr('nombre') + mensajerango);
                	    	
	    	$('#'+zona).attr("rangoanio" , resp.datos[0].min_anio+":"+resp.datos[resp.datos.length-1].max_anio);
	    	//$('#fechainicio'+zona).datepicker("option", { yearRange : $('#'+zona).attr("rangoanio") , disabled : false});
	        //$('#fechafin'+zona).datepicker("option",  { yearRange : $('#'+zona).attr("rangoanio") , disabled : false});
                $('label[for='+$('#filtro_por_fecha'+zona).attr("id")+']').text(trans.filtro_fecha+" - Rango disponible("+$('#'+zona).attr("rangoanio")+")");
                //$('#filtro_por_fecha'+zona).text(trans.filtro_fecha+" - Rango disponible("+$('#'+zona).attr("rangoanio")+")");
	        $('#filtro_por_fecha'+zona).removeAttr("disabled");
	    }
            else
	    {
	    	//$('#fechainicio'+zona).datepicker("option", "disabled", true);
	        //$('#fechafin'+zona).datepicker("option", "disabled", true);
	        $('#filtro_por_fecha'+zona).attr("disabled","disabled"); 
	    }
    	
        var datos = JSON.stringify(resp.datos);
        $('#' + zona).attr('datasetPrincipal_bk', datos);
        if ($('#' + zona).attr('orden') !== undefined
                && $('#' + zona).attr('orden') !== null
                && $('#' + zona).attr('orden') !== '')
        {
            if ($('#' + zona).attr('orden-aplicado') !== 'true') {
                var ordenobj = JSON.parse($('#' + zona).attr('orden'));
                datos = JSON.stringify(ordenarArreglo(resp.datos, ordenobj[0].tipo, ordenobj[0].modo));
                $('DIV.zona_actual').attr('orden-aplicado', 'true');
            }
        }

        $('#' + zona).attr('datasetPrincipal', datos);

        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
        controles_filtros(zona);
    });

}

function ordenarDatos(zona, ordenar_por, modo_orden) {
    if (modo_orden === '-1')
        return;
    if (ordenar_por === 'dimension')
        $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
    else
        $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');

    cerrarMenus();
    $('#' + zona).attr('orden', '[{"tipo":"' + ordenar_por + '", "modo": "' + modo_orden + '"}]');
    var grafico = crearGraficoObj(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    grafico.ordenar(modo_orden, ordenar_por);
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));
    construir_tabla_datos(zona, datasetPrincipal);
    aplicarFormato();
}

function aplicarFiltro(zona) {
    var elementos = '';
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));

    $('#' + zona + ' .capa_dimension_valores input:checked').each(function() {
        elementos += $(this).val() + '&';
    });
    $.post(Routing.generate('indicador_datos_filtrar'),
            {datos: datasetPrincipal, desde: $('#' + zona + ' .filtro_desde').val(), hasta: $('#' + zona + ' .filtro_hasta').val(),
                elementos: elementos},
    function(resp) {
        $('#' + zona).attr('datasetPrincipal', JSON.stringify(resp.datos));
        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    }, 'json');
    $('#' + zona).attr('orden', '');
    $('#' + zona + ' .titulo_indicador').attr('filtro-elementos', '');
}

function controles_filtros(zona) {
    var datasetPrincipal = JSON.parse($('#' + zona).attr('datasetPrincipal'));

    var lista_datos_dimension = '<DIV class="filtro_elementos"><input type="button" class="btn aplicar_filtro" value="' + trans.filtrar + '"/>' +
            '<input type="button" class="btn quitar_filtro" value="' + trans.quitar_filtro + '"/></DIV>';
    lista_datos_dimension += '<DIV class="capa_dimension_valores span12" >' + trans.filtrar_por_elemento + '<BR>';
    $.each(datasetPrincipal, function(i, dato) {
        lista_datos_dimension += '<label class="forcheckbox" for="categorias_a_mostrar' + zona + i + '" ><input type="checkbox" id="categorias_a_mostrar' + zona + i + '" ' +
                'name="categorias_a_mostrar[]" value="' + dato.category + '" /> ' + dato.category + '</label>';
    });
    lista_datos_dimension += '</DIV>';

    $('#' + zona + ' .lista_datos_dimension').html(lista_datos_dimension);       
    
    // Corrige un error de bootstrap para permitir usar controles dentro de un dropdown
    $('.dropdown-menu SELECT, .dropdown-menu LABEL, .dropdown-menu INPUT').click(function(event) {
        $(this).focus();
        event.stopPropagation();
    });    
    //Corrige un error de bootstrap para que funcione un menu dropdown en tabletas
    $('body').on('touchstart.dropdown', '.dropdown-menu', function(e) {
        e.stopPropagation();
    }); 
    
    $('#' + zona + ' .aplicar_filtro').click(function() {
        aplicarFiltro(zona);
    });
    $('#' + zona + ' .quitar_filtro').click(function() {
        $('#' + zona + ' .filtro_desde').val('');
        $('#' + zona + ' .filtro_hasta').val('');
        $('#' + zona + ' .capa_dimension_valores input:checked').each(function() {
            $(this).attr('checked', false);
        });
        //datasetPrincipal = datasetPrincipal_bk;
        $('#' + zona).attr('datasetPrincipal', $('#' + zona).attr('datasetPrincipal_bk'))
        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    });
    if ($('#' + zona + ' .titulo_indicador').attr('filtro-elementos') !== undefined
            && $('#' + zona + ' .titulo_indicador').attr('filtro-elementos') !== '') {
        var filtroElementos = $('#' + zona + ' .titulo_indicador').attr('filtro-elementos').split(',');
        for (var j = 0; j < filtroElementos.length; j++) {
            $('#' + zona + ' .capa_dimension_valores input[value="' + filtroElementos[j] + '"]').attr('checked', true);
        }
        aplicarFiltro(zona);
    }
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
                    campo = $('#' + zona + ' .dimension').html();
                else if (campo === 'measure')
                    campo = trans.indicador + ' (' + $('#' + zona + ' .titulo_indicador').attr('formula') + ')';
                tabla_datos += '<TH>' + campo.toUpperCase() + '</TH>';
            }
            tabla_datos += '</TR></THEAD><TBODY>';
        }

        //los datos
        tabla_datos += '<TR>';
        for (var i in fila)
            tabla_datos += '<TD>' + fila[i] + '</TD>';
        tabla_datos += '</TR>';

    });
    tabla_datos += '</TBODY></TABLE>';

    $('#' + zona + ' .info').html(tabla_datos);
}

function dibujarControles(zona, datos) {
	//////agregar un nuevo atributo con el nombre del indicador
	////
    $('#' + zona + ' .titulo_indicador').html(datos.nombre_indicador)
            .attr('data-unidad-medida', datos.unidad_medida)
            .attr('nombre', datos.nombre_indicador)
            .attr('formula', datos.formula)
            .attr('data-id', datos.id_indicador)
            .attr('filtro-elementos', '')
            .attr('rangos_alertas', JSON.stringify(datos.rangos));

    var combo_dimensiones = trans.cambiar_dimension + ":<SELECT class='dimensiones' name='dimensiones'>";
    $.each(datos.dimensiones, function(codigo, datosDimension) {
        combo_dimensiones += "<option value='" + codigo + "' data-escala='" + datosDimension.escala +
                "' data-x='" + datosDimension.origenX +
                "' data-y='" + datosDimension.origenY +
                "' data-graficos='" + JSON.stringify(datosDimension.graficos) + "'>" + datosDimension.descripcion + "</option>";
    });
    combo_dimensiones += "</SELECT>";

    var combo_tipo_grafico = trans.tipo_grafico + ": <SELECT class='tipo_grafico_principal'  ></SELECT>";

    var combo_ordenar_por_dimension = trans.ordenar_x + ": <SELECT class='ordenar_dimension'>" +
            "<OPTION VALUE='-1'></OPTION>" +
            "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
            "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
            "</SELECT>";
    var combo_ordenar_por_medida = trans.ordenar_y + ": <SELECT class='ordenar_medida'>" +
            "<OPTION VALUE='-1'></OPTION>" +
            "<OPTION VALUE='desc'>" + trans.descendente + "</OPTION>" +
            "<OPTION VALUE='asc'>" + trans.ascendente + "</OPTION>" +
            "</SELECT>";
    var filtro_posicion = trans.filtro_posicion + " " + trans.desde +
            "<INPUT class='valores_filtro filtro_desde' type='text' length='5' value=''> " + trans.hasta +
            "<INPUT class='valores_filtro filtro_hasta' type='text' length='5' value=''> ";
    
    /////quitar el filtro por posicion
    filtro_posicion = "";
    //////agregar filtros por fecha
    var filtro_fecha = '<input type="checkbox" id="filtro_por_fecha'+zona+'" /><label for="filtro_por_fecha'+zona+'">' + trans.filtro_fecha +'</label><br/><div id="div_rango_fechas'+zona+'" style="display:none;clear:both"> '+ trans.desde +
    " <INPUT class='valores_filtro fecha_desde' id='fechainicio"+zona+"' type='month' style='width:180px;' /><br/>" + trans.hasta +
    " <INPUT class='valores_filtro fecha_hasta' id='fechafin"+zona+"' type='month'  style='width:180px;'/>" + 
    ' <input type="button" class="btn" id="btn_filtrar_fecha'+zona+'" value="' + trans.filtrar + '"/></div>';
     
    var opciones_dimension = '<div class="btn-group dropdown sobre_div">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' + trans.dimension_opciones + '">' +
            '<i class="icon-check"></i>' +
            '</button>' +
            '<ul class="opciones_dimension dropdown-menu" role="menu" >' +
            '<li><A >' + combo_dimensiones + '</A></li>' +
            //cambiar filtro_posicion por filtro_fecha
            '<li ><A >' + filtro_fecha + '</A></li>' +
            '<li class="lista_datos_dimension"></li>' +
            '</ul>' +
            '</div>';

    var opciones = '<div class="btn-group dropdown sobre_div">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' + trans.opciones + '">' +
            '<i class="icon-cog"></i>' +
            '</button>' +
            '<ul class="dropdown-menu" role="menu" >' +
            '<li><A class="ver_ficha_tecnica" ' + 
            ' ><i class="icon-briefcase"></i> ' + trans.ver_ficha_tecnica + '</A></li>' +
            '<li><A class="ver_tabla_datos" ><i class="icon-list-alt" ></i> ' + trans.tabla_datos + ' </A></li>' +
            '<li><A class="ver_sql" ><i class="icon-eye-open" ></i> ' + trans.ver_sql + ' </A></li>' +
            //'<li><A class="ver_imagen" ><i class="icon-picture"></i> ' + trans.descargar_grafico + '</A></li>' +
            '<li><A class="quitar_indicador" ><i class="icon-remove-sign"></i> ' + trans.quitar_indicador + '</A></li>' +
            '<li><A class="agregar_como_favorito" data-indicador="' + datos.id_indicador + '" >';
    if ($('#fav-' + datos.id_indicador).length === 0)
        opciones += '<i class="icon-star"></i> ' + trans.agregar_favorito + '</A></li>';
    else
        opciones += '<i class="icon-star-empty"></i> ' + trans.quitar_favoritos + '</A></li>';
    opciones += '</ul>' +
            '</div>';
    var opciones_indicador = '<div class="btn-group sobre_div">' +
            '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' + trans.opciones_grafico + '">' +
            '<i class="icon-signal"></i>' +
            '</button>' +
            '<ul class="dropdown-menu" role="menu" >' +
            '<li><label>&nbsp;</label></li>' +
            //'<li><A class="zoom">Zoom <i class="icon-zoom-in"></i></A></li>' +
            '<li><A >' + combo_ordenar_por_medida + '</A></li>' +
            '<li><A >' + combo_ordenar_por_dimension + '</A></li>' +
            '<li><A >' + combo_tipo_grafico + '</A></li>'
            ;

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
        opciones_indicador += '<li><A >' +
                trans.max_escala_y +
                ": <SELECT class='max_y'>" +
                "<OPTION VALUE='indicador' selected='selected'>" + trans.max_indicador + "</OPTION>" +
                "<OPTION VALUE='rango_alertas'>" + trans.max_rango_alertas + "</OPTION>" +
                "</SELECT>" +
                '</A></li></ul></div>';
        $('#' + zona + ' .controles').append(opciones_indicador);

        $('#' + zona + ' .controles').append('<div class="btn-group sobre_div">' +
                '<a class="btn btn-warning dropdown-toggle" data-toggle="dropdown" title="' + trans.alertas_indicador + '">' +
                '<i class="icon-exclamation-sign"></i>' +
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
    $('#' + zona + ' .controles').append(opciones_dimension);
    $('#' + zona + ' .controles').append('<a id="'+zona+'_ultima_lectura" data-placement="bottom" data-toggle="popover" class="btn-small btn pull-right" href="#" >'+datos.ultima_lectura+'</a>');
    $('#'+zona+'_ultima_lectura').popover({title: trans.ultima_lectura, content: trans.ultima_lectura_exp});
    
    ////agregar los calendarios
    ////
    //$('#fechainicio').datepicker({ altField: "#fechainicio"});
    //$('#fechafin').datepicker({ altField: "#fechafin"});
    
        $('#filtro_por_fecha'+zona).change(function(){
    	if (this.checked == true)
    	{
    		$('#div_rango_fechas'+zona).css({'display':'inline'});
    	}
    	else
    	{
    		$('#div_rango_fechas'+zona).css({'display':'none'});
    	}
    });
    
    $('#btn_filtrar_fecha'+zona).click(function(){
        if ($('#fechainicio'+zona).val() != '' && $('#fechafin'+zona).val() != '')
        {
            setTiposGraficos(zona);
            if ($('#' + zona + ' .tipo_grafico_principal').val() != null) {
                $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
                $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
                dibujarGrafico(zona, $('#' + zona + ' .dimensiones').val());
                $('#' + zona).attr('orden', null);
            }
        }
    });
    
   //EDITADO PARA EL BOTON DE MAXIMIZAR
   /////////
   opciones_maximizar = '<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" title="' 
  	 + trans.maximizar + '" id="'+ zona +'_maximizar">' +    '<i class="icon-zoom-in" id= "'
  	 + zona +'_icon_maximizar"> </i></button>'
      	
  $('#' + zona + ' .controles').append(opciones_maximizar);
  
   $('#' + zona + '_maximizar').click(function(event){
  	if ($('#' + zona + '_icon_maximizar').hasClass('icon-zoom-out'))
  		{
  		   minimizar(zona,contenedor);
  		}
  	else
  		{
  			var tecla = (event.keyCode) ? event.keyCode : event.which ;
	   		if (tecla != 27){
		   		$('#' + zona + '_icon_maximizar').removeClass('icon-zoom-in');
		   		$('#' + zona + '_icon_maximizar').addClass('icon-zoom-out');
		   		
		   		contenedor = document.createElement('div');
		   		$(contenedor).attr('alt',$('#' + zona).index());
		   		$(contenedor).css({'position':'absolute','left':'0px','top':'0px','zIndex':'9999' ,'width':'100%','height':'100%','background-color':'#F4F3FA','display':'none'});
		   		$(contenedor).attr('id','contenedor_maximizado');
		   		$(contenedor).append($('#' + zona));
		   		
		   		scapemsg = document.createElement('div');
		   		$(scapemsg).css({'position':'absolute',
		   						'right':'15px',
		   						'-webkit-border-radius': '10px',
		   					    'border-radius': '10px',
		   					    'background-color': 'rgba(200, 200, 200, .5)',		   					 
		   					    'color': 'rgba(133, 133, 123, .5)',
		   					    'padding':'10px',
		   					    'font-color':'black',
		   					    'font-size':'18px',
		   					    'font-weight':'bold',
		   						'top':'15px'});
		   		
		   		$(scapemsg).html(trans.teclaescape);
		   		$(contenedor).append(scapemsg);
		   		
		   		$(document.body).append($(contenedor));
		   		$(contenedor).fadeIn('slow',function(){
		   			$('#' + zona).animate({height:$(document).height()-20 , width: $(document).width()-20});
		       //     dibujarGrafico(zona, $('#' + zona + ' .dimensiones').val());
		   		});
	   		}
  		}
  });

  $(document.body).keyup(function(event){
	   var tecla = (event.keyCode) ? event.keyCode : event.which ;
	   if (tecla == 27){
		      minimizar(zona,contenedor)
		   }
  })
  
  function minimizar(zona,contenedor){
 		$('#' + zona + '_icon_maximizar').removeClass('icon-zoom-out');
  		$('#' + zona + '_icon_maximizar').addClass('icon-zoom-in');		
  		posicion = $(contenedor).attr('alt');
  		if (posicion == 0)
  		$('.area_grafico').eq(posicion).before($('#' + zona));
  		else
  		$('.area_grafico').eq(posicion - 1).after($('#' + zona));
  		$('#contenedor_maximizado').remove();
  		$('#' + zona).animate({height:370 , width: 370});
  }
  
  /////////
  /////////
    
    $('#' + zona + ' .max_y').change(function() {
        dibujarGraficoPrincipal(zona, $('#' + zona + ' .tipo_grafico_principal').val());
    });
    $('#' + zona + ' .ordenar_medida').change(function() {
        ordenarDatos(zona, 'medida', $(this).val());
    });

    $('#' + zona + ' .ordenar_dimension').change(function() {
        ordenarDatos(zona, 'dimension', $(this).val());
    });

    setTiposGraficos(zona);

    $('#' + zona + ' .dimensiones').change(function() {
        setTiposGraficos(zona);
        if ($('#' + zona + ' .tipo_grafico_principal').val() != null) {
            $('#' + zona + ' .ordenar_dimension').children('option[value="-1"]').attr('selected', 'selected');
            $('#' + zona + ' .ordenar_medida').children('option[value="-1"]').attr('selected', 'selected');
            dibujarGrafico(zona, $(this).val());
            $('#' + zona).attr('orden', null);
        }
    });

    $('#' + zona + ' .tipo_grafico_principal').change(function() {
        dibujarGraficoPrincipal(zona, $(this).val());
    });
    $('#' + zona + ' .agregar_como_favorito').click(function() {
        alternar_favorito(zona, $(this).attr('data-indicador'));
        cerrarMenus();
    });
//    $('#' + zona + ' .zoom').click(function() {
//        $('#' + zona ).toggleClass('zona_maximizada');
//    });
    $('#' + zona + ' .quitar_indicador').click(function() {
        limpiarZona2(zona);
    });
    $('#' + zona + ' .info').hide();
    $('#' + zona + ' .ver_tabla_datos').click(function() {
        $('#myModalLabel2').html();
        $('#sql').html($('#' + zona + ' .info').html());
        $('#sql table').dataTable({
            "bJQueryUI": true,
            "sDom": '<"H"Tfr>t<"F"ip>',
            "oTableTools": {
                "sSwfPath": sSwfPath,
                "aButtons": [
                    {
                        "sExtends": "collection",
                        "sButtonText": trans.exportar,
                        "aButtons": [{
                                "sExtends": "csv",
                                "sTitle": $('#' + zona + ' .titulo_indicador').html()
                            }, {
                                "sExtends": "xls",
                                "sTitle": $('#' + zona + ' .titulo_indicador').html()
                            }, {
                                "sExtends": "pdf",
                                "sTitle": $('#' + zona + ' .titulo_indicador').html()
                            }]
                    }
                ]
            },
            "oLanguage": {
                "sLengthMenu": "Display _MENU_ records per page",
                "sZeroRecords": trans.nada_encontrado,
                "sInfo": trans.mostrando_n_de_n,
                "sInfoEmpty": trans.mostrando_0,
                "sInfoFiltered": trans.filtrados_de
            }
        });
        $('#myModal2').modal('show');
        //cerrarMenus();
    });

    $('#' + zona + ' .ver_sql').click(function() {
        var filtro = $('#' + zona + ' .filtros_dimensiones').attr('data');
        var dimension = $('#' + zona + ' .dimensiones').val();

        $.getJSON(Routing.generate('indicador_ver_sql',
                {id: $('#' + zona + ' .titulo_indicador').attr('data-id'), dimension: dimension}),
        {filtro: filtro, ver_sql: true},
        function(resp) {
            $('#myModalLabel2').html($('#' + zona + ' .titulo_indicador').html());
            $('#sql').html(resp.datos);
            $('#myModal2').modal('show');
        });
    });

    $('#' + zona + ' .ver_imagen').click(function() {
        var svg = $('<div>').append($('#' + zona + ' svg g').clone()).html();
        
        var html = '<H5 style="text-align:center; font-size: 20px;">' + $('#' + zona + ' .titulo_indicador').html() +
                ' (por ' + $('#' + zona + ' .dimension').html() + ')</H5>' +
                '<H6 style="font-size: 20px;">' + $('#' + zona + ' .filtros_dimensiones').html() + '</H6>' +
                '<svg id="ChartPlot" width="95%" viewBox="-5 0 450 360" preserveAspectRatio="none" height="350" style="font-size: 20px;">' + svg + '</svg>';
        $('#sql').html('<canvas id="canvasGrp" width="400" height="350" style="font-size: 20px;"></canvas>');

        var canvas = document.getElementById("canvasGrp");

        rasterizeHTML.drawHTML(html, canvas);
        $('#myModalLabel2').html(trans.guardar_imagen);
        $('#myModal2').modal('show');
    });

    $('#' + zona + ' .ver_ficha_tecnica').click(function() {
        $.get(Routing.generate('get_indicador_ficha',
                {id: $('#' + zona + ' .titulo_indicador').attr('data-id')}),
        function(resp) {
            $('#myModalLabel2').html($('#' + zona + ' .titulo_indicador').html());
            $('#sql').html(resp);
            //Dejar solo el código html de la tabla, quitar todo lo demás

            $('#sql').html('<table>' + $('#sql table').html() + '</table>');
            $('#sql .sonata-ba-view-title').remove();
            $('#sql table').append('<thead><TR><TH>Campo</TH><TH>Descripcion</TH></TR></thead>');
            $('#sql table').dataTable({
                "bFilter": false,
                "bSort": false,
                "sDom": '<"H"T>',
                "bInfo": false,
                "iDisplayLength": 30,
                "oTableTools": {
                    "sSwfPath": sSwfPath,
                    "aButtons": [
                        {
                            "sExtends": "collection",
                            "sButtonText": trans.exportar,
                            "aButtons": [{
                                    "sExtends": "xls",
                                    "sTitle": $('#' + zona + ' .titulo_indicador').html()
                                }, {
                                    "sExtends": "pdf",
                                    "sTitle": $('#' + zona + ' .titulo_indicador').html()
                                }]
                        }
                    ]
                },
            });
            $('#sql .DTTT_container').css('float', 'left');
            $('#myModal2').modal('show');
        }, 'html');
    });
}

function setTiposGraficos(zona) {
    var tipos_graficos = '';
    var graficos = jQuery.parseJSON($('#' + zona + ' .dimensiones option:selected').attr('data-graficos'));
    $.each(graficos, function(i, grafico) {
        tipos_graficos += "<OPTION VALUE='" + grafico.codigo + "'>" + grafico.descripcion + "</OPTION>";
    });
    $('#' + zona + ' .tipo_grafico_principal').html(tipos_graficos);
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
            $('#' + zona + ' .controles').html('');
            $('#' + zona + ' .filtros_dimensiones').html('').attr('data', '');

            recuperarDimensiones(id_indicador);
        });
    }
    $.get(Routing.generate('indicador_favorito'),
            {id: $('#' + zona + ' .titulo_indicador').attr('data-id'), es_favorito: es_favorito}
    );
}

function limpiarZona(zona) {
    $('#' + zona + ' .controles').html('');
    $('#' + zona + ' .filtros_dimensiones').attr('data', '');
    $('#' + zona + ' .filtros_dimensiones').html('');
    $('#' + zona).attr('orden', null);
}

function limpiarZona2(zona) {
    limpiarZona(zona);
    $('#' + zona + ' .titulo_indicador')
            .html('')
            .attr('data-unidad-medida', '')
            .attr('formula', '')
            .attr('rangos_alertas', '')
            .attr('data-id', '')
            .attr('data-max_rango', '')
    $('#' + zona).attr('datasetprincipal', '')
            .attr('datasetprincipal_bk', '');
    $('#' + zona + ' .grafico').html('');
    $('#' + zona + ' .dimension').html('');
    $('#' + zona + ' .controlesDimension').html('');
    $('#' + zona + ' .titulo').hide();
}
function recuperarDimensiones(id_indicador, datos) {
    var zona_g = $('DIV.zona_actual').attr('id');
    limpiarZona(zona_g);
    $.getJSON(
            Routing.generate('indicador_dimensiones', {id: id_indicador}),
    function(resp) {
        //Construir el campo con las dimensiones disponibles

        if (resp.resultado === 'ok') {
            if (resp.dimensiones == '') {
                alert(trans.no_graficos_asignados);
            } else {
                dibujarControles(zona_g, resp);
                if (datos !== null) {
                    if (JSON.stringify(datos.filtro) !== '""') {
                        var $filtro = $('#' + zona_g + ' .filtros_dimensiones');
                        $filtro.attr('data', datos.filtro);
                        filtro_obj = jQuery.parseJSON($filtro.attr('data'));
                        var ruta = filtroRuta(filtro_obj);
                        $filtro.html(ruta);

                        for (i = 0; i < filtro_obj.length; i++) {
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
                    $('#' + zona_g).attr('orden-aplicado', 'false');
                    $('#' + zona_g + ' .dimensiones').val(datos.dimension);
                    $('#' + zona_g + ' .filtro_desde').val(datos.filtroPosicionDesde);
                    $('#' + zona_g + ' .filtro_hasta').val(datos.filtroPosicionHasta);
                    $('#' + zona_g + ' .titulo_indicador').attr('filtro-elementos', datos.filtroElementos);
                    $('#' + zona_g + ' .tipo_grafico_principal').val(datos.tipoGrafico);
                }
                dibujarGrafico(zona_g, $('#' + zona_g + ' .dimensiones').val());
            }
        }

    });
}

function ordenarArreglo(datos, ordenar_por, modo_orden) {
    if (ordenar_por === 'dimension')
        var datos_ordenados = datos.sort(
                (modo_orden === 'asc') ?
                function(a, b) {
                    return d3.ascending((isNaN(a.category)) ? a.category : parseFloat(a.category), (isNaN(b.category)) ? b.category : parseFloat(b.category));
                } :
                function(a, b) {
                    return d3.descending((isNaN(a.category)) ? a.category : parseFloat(a.category), (isNaN(b.category)) ? b.category : parseFloat(b.category));
                }
        );
    else
        var datos_ordenados = datos.sort(
                (modo_orden === 'asc') ? function(a, b) {
            return d3.ascending(parseFloat(a.measure), parseFloat(b.measure));
        } :
                function(a, b) {
                    return d3.descending(parseFloat(a.measure), parseFloat(b.measure));
                }
        );
    return datos_ordenados;
}