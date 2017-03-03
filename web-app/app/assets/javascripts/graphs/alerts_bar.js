function alertsBar() {

    var color = ["#C3C3C3", "#E0E0E0", "#00BFE9","#147A91", "#144753"];

    var margin = {top: 20, right: 20, bottom: 100, left: 40},
    width = 600 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

    // Parse the date / time
    var	parseDate = d3.time.format("%Y-%m").parse;

    var x = d3.scale.ordinal().rangeRoundBands([0, width], .05);

    var y = d3.scale.linear().range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .ticks(5)
        .tickSize(.05*height)
        .outerTickSize(0)
    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(5)
        .tickSize(.05*height);

    var svg = d3.select(".bar-graph").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
    .append("g")
        .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")");

    d3.csv(window.location.origin+"/bar-data.csv", function(error, data) {

        data.forEach(function(d) {
            d.date = d.date;
            d.value = +d.value;
        });

    x.domain(data.map(function(d) { return d.date; }));
    y.domain([0, d3.max(data, function(d) { return d.value; })]);

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .selectAll("text")
        .style("text-anchor", "middle")


    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)

    svg.selectAll("bar")
        .data(data)
        .enter().append("rect")
        .style("fill", function(d,i){
          return color[i]
        })
        .attr("x", function(d) { return x(d.date); })
        .attr("width", x.rangeBand())
        .attr("y", function(d) { return y(d.value); })
        .attr("height", function(d) { return height - y(d.value); })
        .on("mouseover", function(d){
          bar = d3.select(this)

          svg.append("text")
            .attr("x", function() {
              return x(d.date)+ 0.5*x.rangeBand(); })
            .attr("y", function() { return y(d.value)-5; })
            .text(function(){
              return(d.value)
            })
            .attr("class","text-bar")
            })
            .on("mouseout", function(){
              d3.select(".text-bar").remove()
            })

    });
}
