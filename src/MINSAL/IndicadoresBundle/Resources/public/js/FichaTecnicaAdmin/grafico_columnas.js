function dibujarGraficoColumnas(ubicacion, datos, colorChosen, categoryChoosen) {

    var margin = {top: 30, right: 5, bottom: 20, left: 50},
    width = 500 - margin.left - margin.right,
            height = 250 - margin.top - margin.bottom,
            barPadding = 1
            ;

    var currentDatasetBarChart = datos;

    var xScale = d3.scale.linear()
            .domain([0, currentDatasetBarChart.length])
            .range([0, width])
            ;

    var yScale = d3.scale.linear()
            .domain([0, d3.max(currentDatasetBarChart, function(d) {
                return d.measure;
            })])
            .range([height, 0])
            ;
var yAxis = d3.svg.axis()
    .scale(yScale)
    .orient("left")
    .tickFormat(formatPercent);
    $('#' + ubicacion).html('');
    var svg = d3.select("#" + ubicacion)
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .attr("id", "barChartPlot")
            ;

    var plot = svg
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            ;

    plot.selectAll("rect")
        .data(currentDatasetBarChart)
        .enter()
        .append("rect")
        .attr("x", function(d, i) {
            return xScale(i);
        })
        .attr("width", width / currentDatasetBarChart.length - barPadding)
        .attr("y", function(d) {
            return yScale(d.measure);
        })
        .attr("height", function(d) {
            return height - yScale(d.measure);
        })
        .append("title")
        .text(function(d) {
            return d.category + ": " + d.measure;
        });

    if (ubicacion == 'graficoPrimario')
        plot.selectAll("rect").on("click", function(d, i) {
            descenderNivelDimension(d.category);
        });
    if (colorChosen == null)
        plot.selectAll("rect").attr("fill", function(d, i) {
            return color(i);
        }); //set the color for each slice to be chosen from the color function defined above
    else
        plot.selectAll("rect").attr("fill", colorChosen);


    // Add y labels to plot	
    plot.selectAll("text")
        .data(currentDatasetBarChart)
        .enter()
        .append("text")
        .text(function(d) {
            return (d.measure);
        })
        .attr("text-anchor", "middle")
        .attr("text-color", "black")
        // Set x position to the left edge of each bar plus half the bar width
        .attr("x", function(d, i) {
            return (i * (width / currentDatasetBarChart.length)) + ((width / currentDatasetBarChart.length - barPadding) / 2);
        })
        .attr("y", function(d) {
            return yScale(d.measure) + 10;
        })
        .attr("class", "yAxis")
        ;    
    
    // Add x labels to chart	
    var xLabels = svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
        ;

    xLabels.selectAll("text.xAxis")
        .data(currentDatasetBarChart)
        .enter()
        .append("text")
        .text(function(d) {
            return d.category;
        })
        .attr("text-anchor", "middle")
        .attr("x", function(d, i) {
            return (i * (width / currentDatasetBarChart.length)) + ((width / currentDatasetBarChart.length - barPadding) / 2);
        })
        .attr("y", 15)
        .attr("class", "xAxis")
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

