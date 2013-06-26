type LinePlotScales <: PlotScales
end

type LinePlotMarks <: PlotMarks
end

function printjson(p::LinePlotScales)
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

function printjson(p::LinePlotMarks)
    return [
            {
              "type" => "group",
              "from" => {
                "data" => "table",
                "transform" => [{"type" => "facet", "keys" => ["data.group"]}]
              },
              "marks" => [
                {
                  "type" => "line",
                  "properties" => {
                    "enter" => {
                      "x" => {"scale" => "x", "field" => "data.x"},
                      "y" => {"scale" => "y", "field" => "data.y"},
                      "stroke" => {"scale" => "group", "field" => "data.group"},
                    }
                  }
                }
              ]
            }
           ]
end

function lineplot(;x::Vector = Float64[],
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
         LinePlotScales(),
         PlotAxes(),
         LinePlotMarks())
end
