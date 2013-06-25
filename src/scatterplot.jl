type ScatterPlotScales <: PlotScales
end

type ScatterPlotMarks <: PlotMarks
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

function scatterplot(;x::Vector = Float64[],
                      y::Vector = Float64[],
                      group::Vector = Int[],
                      color::Vector = Int[],
                      width::Int = 400,
                      height::Int = 400,
                      top::Int = 80,
                      left::Int = 80,
                      bottom::Int = 80,
                      right::Int = 80)
    Plot(PlotDimensions(width, height),
         PlotPadding(top, left, bottom, right),
         PlotData(x, y, group, color),
         ScatterPlotScales(),
         PlotAxes(),
         ScatterPlotMarks())
end
