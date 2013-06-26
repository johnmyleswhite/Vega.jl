type AreaPlotScales <: PlotScales
end

type AreaPlotMarks <: PlotMarks
end

function printjson(p::AreaPlotScales)
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

function printjson(p::AreaPlotMarks)
    return [
            {
             "type" => "area",
             "from" => {"data" => "table"},
             "properties" => {
               "enter" => {
                 "interpolate" => {"value" => "monotone"},
                 "x" => {"scale" => "x", "field" => "data.x"},
                 "y" => {"scale" => "y", "field" => "data.y"},
                 "y2" => {"scale" => "y", "value" => 0},
                 "fill" => {"scale" => "group", "field" => "data.group"}
               }
             }
            }
           ]
end

function areaplot(;x::Vector = Float64[],
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
         AreaPlotScales(),
         PlotAxes(),
         AreaPlotMarks())
end
