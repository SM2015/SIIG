graficoMapa = function(ubicacion, datos, colorChosen, categoryChoosen) {
    //Variable de prueba, buscar una mejor forma de hacer esto
    // Esta variable me permite asociar el elmento del gráfico con los códigos utilizados
    // por los departamentos
    var dimension = $('#dimensiones').val();
    var elemento_id_codigo = new Object();
    var depto_id_codigo = new Object();

    depto_id_codigo['2660'] = 'CA';
    depto_id_codigo['2661'] = 'CH';
    depto_id_codigo['2662'] = 'CH';
    depto_id_codigo['2663'] = 'LL';
    depto_id_codigo['2664'] = 'LP';
    depto_id_codigo['2665'] = 'LU';
    depto_id_codigo['2666'] = 'MO';
    depto_id_codigo['2667'] = 'SM';
    depto_id_codigo['2668'] = 'SS';
    depto_id_codigo['2669'] = 'SV';
    depto_id_codigo['2670'] = 'SA';
    depto_id_codigo['2671'] = 'SO';
    depto_id_codigo['2672'] = 'US';

    if (dimension == 'departamento')
        elemento_id_codigo = depto_id_codigo;
    else if (dimension == 'municipio') {
        d3.json(Routing.generate('indicador_datos_municipios'),
                function(json) {
                    var datos_munis = json.municipios;
                    var id_muni = datos_munis.map(function(d) {
                        return d.id;
                    });
                    var abrev_muni = datos_munis.map(function(d) {
                        return d.abrev;
                    })
                    var arreglo_muni = new Object();
                    $.each(id_muni, function(i, nodo) {
                        arreglo_muni[nodo] = abrev_muni[i];
                    });
                    elemento_id_codigo = arreglo_muni;
                });
    }

    var width = 560,
            height = 300,
            centered;
    var currentDatasetChart = datos;
    var arreglo_datos = new Object();

    var categorias = currentDatasetChart.map(function(d) {
        return d.category;
    });
    var medidas = currentDatasetChart.map(function(d) {
        return d.measure;
    })
    $.each(categorias, function(i, nodo) {
        arreglo_datos[nodo] = medidas[i];
    })

    var projection = d3.geo.albers()
            .scale(10000)
            .origin([-88.7, 13.7])
            //.parallels([12,14])  
            .translate([0, 0]);

    var path = d3.geo.path()
            .projection(projection);

    $('#' + ubicacion).html('');
    var svg = d3.select("#" + ubicacion)
            .append("svg")
            .attr("width", width)
            .attr("height", height);

    svg.append("rect")
            .attr("class", "background")
            .attr("width", width)
            .attr("height", height)
            .on("contextmenu", right_click)
            .on("click", function(d, i) {
        alert('hola')
        if (dimension == 'departamento')
            descenderNivelDimension(elemento_id_codigo[d.properties.ID_1]);
        else if (dimension == 'municipio')
            descenderNivelDimension(elemento_id_codigo[d.properties.ID_2]);
    });

    var g = svg.append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
            .append("g")
            .attr("id", "states");

    var filtro = $('#filtros_dimensiones').attr('data');

    d3.json(Routing.generate('indicador_datos_mapa',
            {id: $('#titulo_indicador').attr('data-id'), dimension: dimension, filtro: filtro}),
    function(json) {
        if (json.features == '') {
            alert(trans.no_mapa);
            $('#tipo_grafico_principal').val('columnas');
            dibujarGrafico($('#dimensiones').val());
            return;
        }
        var seccion = g.selectAll("path").data(json.features).enter().append("path").attr("d", path);

        seccion.append("title").
                text(function(d) {
            if (dimension == 'departamento')
                return d.properties.NAME_1 + ': ' + arreglo_datos[elemento_id_codigo[d.properties.ID_1]];
            else if (dimension == 'municipio')
                return d.properties.NAME_2 + ': ' + arreglo_datos[elemento_id_codigo[d.properties.ID_2]];
        });
        seccion.attr('fill', function(d, i) {
            if (dimension == 'departamento')
                return colores_alertas(arreglo_datos[elemento_id_codigo[d.properties.ID_1]], i)
            else if (dimension == 'municipio')
                return colores_alertas(arreglo_datos[elemento_id_codigo[d.properties.ID_2]], i)
        });
        seccion.on("contextmenu", right_click)
                .on("click", function(d, i) {
            alert('hola')
            if (dimension == 'departamento')
                descenderNivelDimension(elemento_id_codigo[d.properties.ID_1]);
            else if (dimension == 'municipio')
                descenderNivelDimension(elemento_id_codigo[d.properties.ID_2]);
        });
    });

    function right_click(d) {
        var x = 0,
                y = 0,
                k = 1;

        if (d && centered !== d) {
            var centroid = path.centroid(d);
            x = -centroid[0];
            y = -centroid[1];
            k = 4;
            centered = d;
        } else {
            centered = null;
        }

        g.selectAll("path")
                .classed("active", centered && function(d) {
            return d === centered;
        });

        g.transition()
                .duration(1000)
                .attr("transform", "scale(" + k + ")translate(" + x + "," + y + ")")
                .style("stroke-width", 1.5 / k + "px");

        //descenderNivelDimension(depto_id_codigo[d.properties.ID_1]);
        d3.event.preventDefault();
    }
    this.ordenar = function(modo_orden, ordenar_por) {
        //No hacer nada, el mapa no se puede ordenar
        return
    }

}