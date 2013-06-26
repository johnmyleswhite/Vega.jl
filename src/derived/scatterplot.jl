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
              "zero" => false,
              "domain" => {"data" => "table", "field" => "data.x"}
            },
            {
              "name" => "y",
              "type" => "linear",
              "range" => "height",
              "nice" => true,
              "zero" => false,
              "domain" => {"data" => "table", "field" => "data.y"}
            },
            {
              "name" => "group",
              "type" => "ordinal",
              "range" => "category10",
              "domain" => {"data" => "table", "field" => "data.group"}
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
                  "stroke" => {"scale" => "group", "field" => "data.group"},
                  "fill" => {"scale" => "group", "field" => "data.group"},
                  "fillOpacity" => {"value" => 0.5}
                }
              }
            }
          ]
end

function scatterplot(;x::Vector = Float64[],
                      y::Vector = Float64[],
                      group::Vector = ones(Int, length(x)),
                      color::Vector = Int[],
                      width::Int = 450,
                      height::Int = 450,
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
