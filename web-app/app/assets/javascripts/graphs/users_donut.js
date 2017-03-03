function usersDonut() {
  var width = 384,
    height = 320,
    radius = Math.min(width/1.5, height/1.5) / 2;

  var arc = d3.svg.arc()
    .outerRadius(radius - 4)
    .innerRadius(radius - 48);

  var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.count; });

  var svg = d3.select(".users-graph").append("svg")
    .attr("width", width - 40)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + (width - 40) / 2 + "," + (height -40) / 2 + ")");

  d3.csv(window.location.origin+"/users-stats.csv", type, function(error, data) {
    if (error) throw error;

    var color = d3.scale.ordinal()
      .range( grad_color(d3.values(data).length));


    console.log(d3.max(d3.values(data)))


    var g = svg.selectAll(".arc")
      .data(pie(data))
      .enter().append("g")
      .attr("class", "arc");

    g.append("text")
      .attr("id", "category_text")
      .text();

    g.append("text")
      .attr("y","1em")
      .attr("id", "num_text")
      .text();

    g.append("text")
      .attr("y","1em")
      .attr("id", "center_text")
      .text();

    var case_text = "Registered"
    d3.select("#center_text")
      .html(case_text)
      .attr("x", -7*case_text.length/2)
      .attr("y",1.4*radius)
    d3.select("#category_text")
      .text(d3.format(",")(d3.sum(data, function(d) { return d.count;  })))
      .attr("x", -8*(String(d3.max(d3.values(data)).count)).length)
      .attr("y",1.2*radius)

    g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return color(d.data.status); })
      .on("click", function(d){
        d3.select("#num_text")
          .attr("y",2*radius)
          .attr("x", -75.0*(d3.max(d3.values(data)).status).length/2.5)
      });

    g.append("image")
      .attr("transform", function(d,i) {
        if (i>0){
          distance = -radius*1.25
        } else {
          distance = radius*1.05
        }
        return "translate(" + distance + ",0)"; })
      .attr("xlink:href",function(d,i){
        return window.location.origin+"/"+d.data.status + ".svg"
      })
      .attr("width", 20)
      .attr("height", 20)
      .attr()

  });

  function grad_color(elems) {
    var base_colors = ["#144753","#00BFE9"]
    base_len = base_colors.length
    jump = Math.ceil(base_len/elems)
    output_vector = []
    i = 0
    for ( ; i < base_len; ) {
      output_vector.push(base_colors[i])
      i = i + jump
    }
    console.log(output_vector)
    return output_vector
  }

  function type(d) {
    d.count = +d.count;
    return d;
  }
}
