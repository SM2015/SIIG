graficoMapa = function(ubicacion, datos, colorChosen, categoryChoosen) {
    //Variable de prueba, buscar una mejor forma de hacer esto
    // Esta variable me permite asociar el elmento del gráfico con los códigos utilizados
    // por los departamentos
    var dimension = $('#dimensiones').val();
    var elemento_id_codigo = new Object();     
    
    d3.json(Routing.generate('indicador_datos_mapa',{dimension: dimension, tipo_peticion: 'equivalencias'}),
        function(json) {
            var datos_equivalencias = json.equivalencias;
            var id_equivalencia = datos_equivalencias.map(function(d) {
                return d.id;
            });
            var abrev_equivalencia = datos_equivalencias.map(function(d) {
                return d.abrev;
            });
            var arreglo_equivalencia = new Object();
            $.each(id_equivalencia, function(i, nodo) {
                arreglo_equivalencia[nodo] = abrev_equivalencia[i];
            });
            elemento_id_codigo = arreglo_equivalencia;
        });    

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
    });
    $.each(categorias, function(i, nodo) {
        arreglo_datos[nodo] = medidas[i];
    });

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
                descenderNivelDimension(elemento_id_codigo[d.properties.ID]);        
            });

    var g = svg.append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
            .append("g")
            .attr("id", "states");

    var filtro = $('#filtros_dimensiones').attr('data');

    d3.json(Routing.generate('indicador_datos_mapa',
            {id: $('#titulo_indicador').attr('data-id'), dimension: dimension, 
                filtro: filtro, tipo_peticion: 'mapa'}),
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
                    if (arreglo_datos[elemento_id_codigo[d.properties.ID]] == null)
                        return d.properties.NAME;
                    else
                        return d.properties.NAME + ': ' + arreglo_datos[elemento_id_codigo[d.properties.ID]];
            });
        
        seccion.attr('fill', function(d, i) {
                if (arreglo_datos[elemento_id_codigo[d.properties.ID]] == null)
                    return '#E5DBDB';
                else
                    return colores_alertas(arreglo_datos[elemento_id_codigo[d.properties.ID]], i);            
            });
        seccion.on("contextmenu", right_click)
                .on("click", function(d, i) {            
                    if (arreglo_datos[elemento_id_codigo[d.properties.ID]] != null)
                        descenderNivelDimension(elemento_id_codigo[d.properties.ID]);            
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