type ScatterPlotData <: PlotData
    x::Vector
    y::Vector
    function ScatterPlotData(x::Vector, y::Vector)
        n = length(x)
        if length(y) != n
            throw(ArgumentError("x and y must have the same length"))
        else
            new(x, y)
        end
    end
end

type ScatterPlotScales <: PlotScales
end

type ScatterPlotAxes <: PlotAxes
end

type ScatterPlotMarks <: PlotMarks
end

function printjson(p::ScatterPlotData)
    n = length(p.x)
    data = Array(Dict, 1)
    data[1] = Dict()
    data[1]["name"] = "table"
    data[1]["values"] = Array(Dict, n)
    for i in 1:n
        data[1]["values"][i] = {"x" => p.x[i], "y" => p.y[i]}
    end
    return data
end

function printjson(p::ScatterPlotAxes)
    return [
            {"type" => "x", "scale" => "x"},
            {"type" => "y", "scale" => "y"}
           ]
end

function printjson(p::ScatterPlotScales)
    return [
            {
              "name" => "x",
              "type" => "linear",
              "range" => "width",
              "nice" => true,
              "domain" => {"data" => "table", "field" => "data.x"}
            },
            {
              "name" => "y",
              "type" => "linear",
              "range" => "height",
              "nice" => true,
              "domain" => {"data" => "table", "field" => "data.y"}
            }
           ]
end

function printjson(p::ScatterPlotMarks)
    return [
            {
              "type" => "symbol",
              "from" => {"data" => "table"},
              "properties" => {
                "enter" => {
                  "x" => {"scale" => "x", "field" => "data.x"},
                  "y" => {"scale" => "y", "field" => "data.y"},
                  "stroke" => {"value" => "steelblue"},
                  "fillOpacity" => {"value" => 0.5}
                },
                "update" => {
                  "fill" => {"value" => "transparent"},
                  "size" => {"value" => 100}
                },
                "hover" => {
                  "fill" => {"value" => "pink"},
                  "size" => {"value" => 300}
                }
              }
            }
           ]
end

function scatterplot(x::Vector,
                     y::Vector;
                     width::Int = 500,
                     height::Int = 500,
                     top::Int = 40,
                     left::Int = 40,
                     bottom::Int = 40,
                     right::Int = 40)
    Plot(PlotDimensions(width, height),
         PlotPadding(top, left, bottom, right),
         ScatterPlotData(x, y),
         ScatterPlotScales(),
         ScatterPlotAxes(),
         ScatterPlotMarks())
end
