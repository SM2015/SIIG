function dibujarGraficoLineas(ubicacion, datos, colorChosen, categoryChoosen) {

    var margin = {top: 20, right: 40, bottom: 10, left: 50},
    width = 500 - margin.left - margin.right,
            height = 160 - margin.top - margin.bottom
            ;
    var currentDatasetChart = datos;
    
    var xScale = d3.scale.linear()
            .domain([0, currentDatasetChart.length - 1])
            //.domain(d3.extent(currentDatasetChart, function(d) { return d.category; }))
            .range([0, width])
            ;

    var yScale = d3.scale.linear()
            .domain([0, d3.max(currentDatasetChart, function(d) {
                return d.measure;
            })])
            .range([height, 0])
            ;
    var yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left");
        
    var line = d3.svg.line()
            //.x(function(d) { return xScale(d.category); })
            .x(function(d, i) {
        return xScale(i);
    })
            .y(function(d) {
        return yScale(d.measure);
    })
            ;

    $('#' + ubicacion).html('');
    var svg = d3.select("#"+ubicacion).append("svg")
            .datum(currentDatasetChart)
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
    // create group and move it so that margins are respected (space for axis and title)

    var plot = svg
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            .attr("id", "lineChartPlot")
            ;
    
    if (colorChosen == null)
        plot.append("path")
            .attr("class", "line")
            .attr("d", line)
            // add color
            .attr("stroke", 'black')
            ;
    else
        plot.append("path")
            .attr("class", "line")
            .attr("d", line)
            // add color
            .attr("stroke", colorChosen)
            ;

    plot.selectAll(".dot")
        .data(currentDatasetChart)
        .enter().append("circle")
        .attr("class", "dot")
        /*.attr("fill", function(d) {
            return d.measure == d3.min(firstDatasetLineChart, function(d) {
                return d.measure;
            }) ? "red" : (d.measure == d3.max(firstDatasetLineChart, function(d) {
                return d.measure;
        }) ? "green" : "white")
        })*/        
        .attr("cx", line.x())
        .attr("cy", line.y())
        .attr("r", 3.5)
        .attr("stroke", colorChosen)
        .append("title")
        .text(function(d) {
            return d.category + ": " + d.measure;
        })
        ;

    // Add x labels to chart	
    var xLabels = svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
        ;

    xLabels.selectAll("text.xAxis")
        .data(currentDatasetChart)
        .enter()
        .append("text")
        .text(function(d) {
            return d.category;
        })
        .attr("text-anchor", "middle")
        // Set x position to the left edge of each bar plus half the bar width
        .attr("x", line.x())
        .attr("y", 7)        
        ;
            

    if (categoryChoosen != null)
        // Title
        svg.append("text")
                .attr("x", (width + margin.left + margin.right) / 2)
                .attr("y", 15)
                .attr("class", "title")
                .attr("text-anchor", "middle")
                .text("Datos de " + categoryChoosen)
                ;
        
}

//dsLineChart();


/* ** UPDATE CHART ** */

/* updates bar chart on request */
function updateLineChart(group, colorChosen) {

    var currentDatasetLineChart = datasetLineChartChosen(group);

    var basics = dsLineChartBasics();

    var margin = basics.margin,
            width = basics.width,
            height = basics.height
            ;

    var xScale = d3.scale.linear()
            .domain([0, currentDatasetLineChart.length - 1])
            .range([0, width])
            ;

    var yScale = d3.scale.linear()
            .domain([0, d3.max(currentDatasetLineChart, function(d) {
            return d.measure;
        })])
            .range([height, 0])
            ;

    var line = d3.svg.line()
            .x(function(d, i) {
        return xScale(i);
    })
            .y(function(d) {
        return yScale(d.measure);
    })
            ;

    var plot = d3.select("#lineChartPlot")
            .datum(currentDatasetLineChart)
            ;

    /* descriptive titles as part of plot -- start */
    var dsLength = currentDatasetLineChart.length;

    plot.select("text")
            .text(currentDatasetLineChart[dsLength - 1].measure)
            ;
    /* descriptive titles -- end */

    plot
            .select("path")
            .transition()
            .duration(750)
            .attr("class", "line")
            .attr("d", line)
            // add color
            .attr("stroke", colorChosen)
            ;

    var path = plot
            .selectAll(".dot")
            .data(currentDatasetLineChart)
            .transition()
            .duration(750)
            .attr("class", "dot")
            .attr("fill", function(d) {
        return d.measure == d3.min(currentDatasetLineChart, function(d) {
            return d.measure;
        }) ? "red" : (d.measure == d3.max(currentDatasetLineChart, function(d) {
            return d.measure;
        }) ? "green" : "white")
    })
            .attr("cx", line.x())
            .attr("cy", line.y())
            .attr("r", 3.5)
            // add color
            .attr("stroke", colorChosen)
            ;

    path
            .selectAll("title")
            .text(function(d) {
        return d.category + ": " + formatAsInteger(d.measure);
    })
            ;

}