type LinePlotData <: PlotData
    x::Vector
    y::Vector
    group::Vector
    function LinePlotData(x::Vector, y::Vector, group::Vector)
        if length(x) != length(y) || length(x) != length(group)
            throw(ArgumentError("x, y and group must all have the same length"))
        else
            new(x, y, group)
        end
    end
end

type LinePlotScales <: PlotScales
end

type LinePlotAxes <: PlotAxes
end

type LinePlotMarks <: PlotMarks
end

function printjson(p::LinePlotData)
    n = length(p.x)
    data = Array(Dict, 1)
    data[1] = Dict()
    data[1]["name"] = "table"
    data[1]["values"] = Array(Dict, n)
    for i in 1:n
        data[1]["values"][i] = {"x" => p.x[i],
                                "y" => p.y[i],
                                "group" => p.group[i]}
    end
    return data
end

function printjson(p::LinePlotScales)
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
          },
          {
            "name" => "color",
            "type" => "ordinal",
            "range" => "category10",
            "domain" => {"data" => "table", "field" => "data.group"}
          }
         ]
end

function printjson(p::LinePlotAxes)
    return [
            {"type" => "x", "scale" => "x"},
            {"type" => "y", "scale" => "y"}
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
                      "stroke" => {"scale" => "color", "field" => "data.group"},
                      "strokeWidth" => {"value" => 2}
                    }
                  }
                }
              ]
            },
            {
              "type" => "text",
              "from" => {
                "data" => "table"
              },
              "properties" => {
                "enter" => {
                  "x" => {"scale" => "x", "field" => "data.x", "offset" => 2},
                  "y" => {"scale" => "y", "field" => "data.y"},
                  "fill" => {"scale" => "color", "field" => "data.group"},
                  "text" => {"field" => "data.group"},
                  "baseline" => {"value" => "middle"}
                }
              }
            }
           ]
end

function lineplot(x::Vector,
                  y::Vector,
                  group::Vector;
                  width::Int = 500,
                  height::Int = 500,
                  top::Int = 40,
                  left::Int = 40,
                  bottom::Int = 40,
                  right::Int = 40)
    Plot(PlotDimensions(width, height),
         PlotPadding(top, left, bottom, right),
         LinePlotData(x, y, group),
         LinePlotScales(),
         LinePlotAxes(),
         LinePlotMarks())
end
