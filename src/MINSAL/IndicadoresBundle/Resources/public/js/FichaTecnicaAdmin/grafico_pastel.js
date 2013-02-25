graficoPastel = function(ubicacion, datos, color_grafico, categoryChoosen) {
    this.tipo = 'pastel';
    if (ubicacion == '' || ubicacion == null)
        ubicacion = "graficoPrimario";

    var width = 350,
            height = 280,
            outerRadius = Math.min(width, height) / 2,
            innerRadius = outerRadius * .999,
            // for animation
            innerRadiusFinal = outerRadius * .5,
            innerRadiusFinal3 = outerRadius * .45
            ;

    this.dibujar = function() {
        $('#' + ubicacion + ' .grafico').html('');
        var vis = d3.select('#' + ubicacion + ' .grafico')
                .append("svg:svg")              //create the SVG element inside the <body>
                .data([datos])                   //associate our data with the document
                .attr("width", width)           //set the width and height of our visualization (these will be attributes of the <svg> tag
                .attr("height", height)
                .append("svg:g")                //make a group to hold our pie chart
                .attr("transform", "translate(" + parseFloat(outerRadius + 30) + "," + outerRadius + ")")    //move the center of the pie chart from 0, 0 to radius, radius
                .attr("id", "ChartPlot")
                ;

        var arc = d3.svg.arc()              //this will create <path> elements for us using arc data
                .outerRadius(outerRadius).innerRadius(innerRadius);

        // for animation
        var arcFinal = d3.svg.arc().innerRadius(innerRadiusFinal).outerRadius(outerRadius);
        var arcFinal3 = d3.svg.arc().innerRadius(innerRadiusFinal3).outerRadius(outerRadius);

        var pie = d3.layout.pie()           //this will create arc data for us given a list of values
                .value(function(d) {
            return parseFloat(d.measure);
        });    //we must tell it out to access the value of each element in our data array

        var arcs = vis.selectAll("g.slice")     //this selects all <g> elements with class slice (there aren't any yet)
                .data(pie)                          //associate the generated pie data (an array of arcs, each having startAngle, endAngle and value properties) 
                .enter()                            //this will create <g> elements for every "extra" data element that should be associated with a selection. The result is creating a <g> for every object in the data array
                .append("svg:g")                //create a group to hold each slice (we will have a <path> and a <text> element associated with each slice)
                .attr("class", "slice")    //allow us to style things in the slices (like text)
                .on("mouseover", mouseover)
                .on("mouseout", mouseout)
                ;
        arcs.on("click", function(d, i) {
            descenderNivelDimension(zona, d.data.category);
        });

        if (color_grafico == null)
            arcs.append("svg:path")
                    .attr("fill", function(d, i) {
                return colores_alertas(ubicacion, d.data.measure, i)
            });
        else
            arcs.append("svg:path")
                    .attr("fill", function(d, i) {
                return color_grafico;
            });

        arcs.attr("d", arc)     //this creates the actual SVG path using the associated data (pie) with the arc drawing function
                .append("svg:title") //mouseover title showing the figures
                .text(function(d) {
            return d.data.category + ": " + d.data.measure;
        });

        d3.selectAll("g.slice").selectAll("path")
                .transition()
                .duration(750)
                .delay(10)
                .attr("stroke", "white")
                .attr("stroke-width", 1.5)
                .attr("d", arcFinal)
                ;

        // Add a label to the larger arcs, translated to the arc centroid and rotated.
        // source: http://bl.ocks.org/1305337#index.html
        arcs.filter(function(d) {
            return d.endAngle - d.startAngle > .2;
        })
                .append("svg:text")
                .attr("dy", ".35em")
                .attr("text-anchor", "middle")
                .attr("transform", function(d) {
            return "translate(" + arcFinal.centroid(d) + ")rotate(" + angle(d) + ")";
        })
                //.text(function(d) { return formatAsPercentage(d.value); })
                .text(function(d) {
            return d.data.category;
        })
                ;

        // Computes the label angle of an arc, converting from radians to degrees.
        function angle(d) {
            var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
            return a > 90 ? a - 180 : a;
        }


        if (categoryChoosen != null)
            // Pie chart title			
            vis.append("svg:text")
                    .attr("dy", ".35em")
                    .attr("text-anchor", "middle")
                    .text("Datos de " + categoryChoosen)
                    .attr("class", "title")
                    ;

        function mouseover() {
            d3.select(this).select("path").transition()
                    .duration(750)
                    .attr("stroke", "red")
                    .attr("stroke-width", 2.5)
                    .attr("d", arcFinal3)
                    ;
        }

        function mouseout() {
            d3.select(this).select("path").transition()
                    .duration(750)
                    .attr("stroke", "white")
                    .attr("stroke-width", 1.5)
                    .attr("d", arcFinal)
                    ;
        }
    }
    this.ordenar = function(modo_orden, ordenar_por) { /*No hacer nada, el gráfico circular no se puede ordenar*/
        return
    }


}