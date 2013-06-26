type HeatMapScales <: PlotScales
end

type HeatMapMarks <: PlotMarks
end

function printjson(p::HeatMapScales)
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
            "name" => "color",
            "type" => "ordinal",
            "range" => "category20",
            "nice" => true,
            "zero" => false,
            "domain" => {"data" => "table", "field" => "data.color"}
          }
         ]
end

function printjson(p::HeatMapMarks)
    return [
            {
             "type" => "symbol",
             "from" => {"data" => "table"},
             "properties" => {
               "enter" => {
                 "shape" => {"value" => "square"},
                 "x" => {"scale" => "x", "field" => "data.x"},
                 "y" => {"scale" => "y", "field" => "data.y"},
                 "fill" => {"scale" => "color", "field" => "data.color"}
               }
             }
            }
           ]
end

function heatmap(;x::Vector = Float64[],
                 y::Vector = Float64[],
                 group::Vector = Int[],
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
         HeatMapScales(),
         PlotAxes(),
         HeatMapMarks())
end
