type BarPlotData <: PlotData
    x::Vector
    y::Vector
    function BarPlotData(x::Vector, y::Vector)
        n = length(x)
        if length(y) != n
            throw(ArgumentError("x and y must have the same length"))
        else
            new(x, y)
        end
    end
end

type BarPlotScales <: PlotScales
end

type BarPlotAxes <: PlotAxes
end

type BarPlotMarks <: PlotMarks
end

function printjson(p::BarPlotData)
    n = length(p.x)
    data = Dict()
    data["name"] = "table"
    data["values"] = Array(Dict, n)
    for i in 1:n
        data["values"][i] = {"x" => p.x[i], "y" => p.y[i]}
    end
    return [data]
end

function printjson(p::BarPlotAxes)
    return [
            {"type" => "x", "scale" => "x"},
            {"type" => "y", "scale" => "y"}
           ]
end

function printjson(p::BarPlotScales)
    return [
            {
              "name" => "x",
              "type" => "ordinal",
              "range" => "width",
              "domain" => {"data" => "table", "field" => "data.x"}
            },
            {
              "name" => "y",
              "range" => "height",
              "nice" => true,
              "domain" => {"data" => "table", "field" => "data.y"}
            }
           ]
end

function printjson(p::BarPlotMarks)
    return [
            {
             "type" => "rect",
             "from" => {"data" => "table"},
             "properties" =>
             {
              "enter" =>
              {
               "x" => {"scale" => "x", "field" => "data.x"},
               "width" => {"scale" => "x", "band" => true, "offset" => -1},
               "y" => {"scale" => "y", "field" => "data.y"},
               "y2" => {"scale" => "y", "value" => 0}
              },
              "update" =>
              {
               "fill" => {"value" => "steelblue"}
              },
              "hover" =>
              {
               "fill" => {"value" => "red"}
              }
             }
            }
           ]
end

function barplot(x::Vector,
                 y::Vector;
                 width::Int = 400,
                 height::Int = 200,
                 top::Int = 10,
                 left::Int = 10,
                 bottom::Int = 10,
                 right::Int = 10)
    Plot(PlotDimensions(width, height),
         PlotPadding(top, left, bottom, right),
         BarPlotData(x, y),
         BarPlotScales(),
         BarPlotAxes(),
         BarPlotMarks())
end
