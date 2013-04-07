graficoMapa = function(ubicacion, datos, colorChosen, categoryChoosen) {
    //Variable de prueba, buscar una mejor forma de hacer esto
    // Esta variable me permite asociar el elmento del gráfico con los códigos utilizados
    // por los departamentos
    this.dibujar = function() {
        var dimension = $('#' + ubicacion + ' .dimensiones').val();                
        var elemento_id_codigo = new Object();

        var width = 400,
            height = 250,
            currentDatasetChart = datos,
            centered,
            arreglo_datos = new Object();

        var categorias = currentDatasetChart.map(function(d) {
            return d.id_category;
        });
        var medidas = currentDatasetChart.map(function(d) {
            return d.measure;
        });
        $.each(categorias, function(i, nodo) {            
            arreglo_datos[nodo] = medidas[i];
        });
        //Recuperar las coordenadas a utilizar 
        var coordenadas = $('#' + ubicacion + ' .dimensiones option[value="'+dimension+'"]');
        coordenadas = $(coordenadas[0]);
        if (coordenadas.attr('data-escala') === 'null'
            || coordenadas.attr('data-x') === 'null'
            || coordenadas.attr('data-y') === 'null'){
                alert(trans.no_mapa);
                $('#' + ubicacion + ' .tipo_grafico_principal').val('columnas');
                dibujarGrafico(ubicacion, $('#' + ubicacion + ' .dimensiones').val());
                return;
        }
        var projection = d3.geo.albers()
                .scale(coordenadas.attr('data-escala'))
                .origin([coordenadas.attr('data-x'), coordenadas.attr('data-y')])
                .translate([0, 0]);

        var path = d3.geo.path()
                .projection(projection);
        
        $('#' + ubicacion + ' .grafico').html('');
        var svg = d3.select("#" + ubicacion + ' .grafico')
                .append("svg")
                .attr("width", width)
                .attr("height", height)
                .attr("id", "ChartPlot");

        svg.append("rect")
                .attr("class", "background")
                .attr("width", width)
                .attr("height", height)
                .on("contextmenu", right_click)
                .on("click", function(d, i) {
            descenderNivelDimension(ubicacion, d.properties.NAME);
        });

        var g = svg.append("g")
                .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
                .append("g")
                .attr("id", "states");

        var filtro = $('#' + ubicacion + ' .filtros_dimensiones').attr('data');

        d3.json(Routing.generate('indicador_datos_mapa',
                {id: $('#' + ubicacion + ' .titulo_indicador').attr('data-id'), dimension: dimension,
                    filtro: filtro, tipo_peticion: 'mapa'}),
        function(json) {
            if (json.features === '') {
                alert(trans.no_mapa);
                $('#' + ubicacion + ' .tipo_grafico_principal').val('columnas');
                dibujarGrafico(ubicacion, $('#' + ubicacion + ' .dimensiones').val());
                return;
            }
            var seccion = g.selectAll("path").data(json.features).enter().append("path").attr("d", path);

            seccion.append("title").
                    text(function(d) {
                if (arreglo_datos[d.properties.ID] === undefined)
                    return d.properties.NAME;
                else
                    return d.properties.NAME + ': ' + arreglo_datos[d.properties.ID];
            });

            seccion.attr('fill', function(d, i) {
                if (arreglo_datos[d.properties.ID] === undefined)
                    return '#E5DBDB';
                else
                    return colores_alertas(ubicacion, arreglo_datos[d.properties.ID], i);
            });
            seccion.on("contextmenu", right_click)
                    .on("click", function(d, i) {
                if (arreglo_datos[d.properties.ID] !== undefined)
                    descenderNivelDimension(ubicacion, d.properties.NAME);
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
    };
    this.ordenar = function(modo_orden, ordenar_por) {
        //No hacer nada, el mapa no se puede ordenar
        return;
    }

}