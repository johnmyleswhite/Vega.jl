type PlotDimensions
    width::Int
    height::Int
end

type PlotPadding
    top::Int
    left::Int
    bottom::Int
    right::Int
end

abstract PlotData
abstract PlotAxes
abstract PlotScales
abstract PlotMarks

type Plot
    dims::PlotDimensions
    padding::PlotPadding
    data::PlotData
    scales::PlotScales
    axes::PlotAxes
    marks::PlotMarks
end

function printjson(p::PlotPadding)
    return {"top" => p.top, "left" => p.left,
            "bottom" => p.bottom, "right" => p.right}
end

function printjson(p::Plot)
    res = Dict()
    res["width"] = p.dims.width
    res["height"] = p.dims.height
    res["padding"] = printjson(p.padding)
    res["data"] = printjson(p.data)
    res["scales"] = printjson(p.scales)
    res["axes"] = printjson(p.axes)
    res["marks"] = printjson(p.marks)
    return JSON.to_json(res)
end

# Hack to get automatic browser loading from the REPL on OS X
function Base.show(io::IO, p::Plot)
    io = open(JSONPATH, "w")
    println(io, printjson(p))
    close(io)

    io = open(HTMLPATH, "w")
    println(io, makehtml())
    close(io)

    # Open the browser
    run(`open $HTMLPATH`)

    sleep(2) # To make sure viz is loaded before deleting

    rm(JSONPATH)
    rm(HTMLPATH)

    return
end

function makehtml()
    d3path = Pkg.dir("Vega", "deps/vega/examples/lib/d3.v3.min.js")
    vegapath = Pkg.dir("Vega", "deps/vega/vega.js")
    specpath = JSONPATH
    html = "<html>
  <head>
    <title>Vega Interaction Test</title/>
    <script src='$d3path'></script>
    <script src='$vegapath'></script>
  </head>
  <body>
    <div style='text-align: center' id='view' class='view'></div>
  </body>
  <script type='text/javascript'>
  vg.parse.spec('$specpath', function(chart) {
    self.view = chart({el:'#view'}).update();
  });
  </script>
</html>"
    return html
end
