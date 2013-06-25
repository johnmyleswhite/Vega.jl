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

type PlotData
    x::Vector
    y::Vector
    group::Vector
    color::Vector
    function PlotData(x::Vector, y::Vector, group::Vector, color::Vector)
        n = length(x)
        if length(y) != n
            throw(ArgumentError("x and y must have the same length"))
        end
        if length(group) != n
            if length(group) != 0
                throw(ArgumentError("Not enough groups"))
            else
                group = ones(Int, n)
            end
        end
        if length(color) != n
            if length(color) != 0
                throw(ArgumentError("Not enough colors"))
            else
                color = ones(Int, n)
            end
        end
        new(x, y, group, color)
    end
end

type PlotAxes
end

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

function printjson(p::PlotData)
    n = length(p.x)
    data = Array(Dict, 1)
    data[1] = Dict()
    data[1]["name"] = "table"
    data[1]["values"] = Array(Dict, n)
    for i in 1:n
        data[1]["values"][i] = {"x" => p.x[i],
                                "y" => p.y[i],
                                "group" => p.group[i],
                                "color" => p.color[i]}
    end
    return data
end

function printjson(p::PlotAxes)
    return [
            {"type" => "x", "scale" => "x"},
            {"type" => "y", "scale" => "y"}
           ]
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

# Open a URL in a browser
function openurl(url::String) 
    @osx_only     run(`open $url`)
    @windows_only run(`start $url`)
    @linux_only   run(`xdg-open $url`)
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
    openurl(HTMLPATH)

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

function plot(;x::Vector = Float64[],
               y::Vector = Float64[],
               group::Vector = Int[],
               color::Vector = Int[],
               kind::Symbol = :scatter,
               width::Int = 400,
               height::Int = 400,
               top::Int = 80,
               left::Int = 80,
               bottom::Int = 80,
               right::Int = 80)
    if kind == :scatter
        scatterplot(x = x, y = y, group = group, color = color) # etc...
    elseif kind == :bar
        barplot(x = x, y = y, group = group, color = color) # etc...
    elseif kind == :area
        areaplot(x = x, y = y, group = group, color = color) # etc...
    elseif kind == :line
        lineplot(x = x, y = y, group = group, color = color) # etc...
    else
        error("Unknown kind of plot")
    end
end
