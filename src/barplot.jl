type BarPlotScales <: PlotScales
end

type BarPlotMarks <: PlotMarks
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

function barplot(;x::Vector = Float64[],
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
         BarPlotScales(),
         PlotAxes(),
         BarPlotMarks())
end
