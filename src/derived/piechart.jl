@compat function piechart(; x::AbstractArray = Real[], y::AbstractArray = [], holesize::Int = 0)

    v = VegaVisualization()
    v.legends = [VegaLegend(fill = "color", title = "group")]

    add_data!(v, x = x, y = y)

    v.scales = [VegaScale(name = "color",
                      domain = VegaDataRef("table", "data.x"),
                      range = "category10",
                      _type = "ordinal")]

    v.marks = [VegaMark(_type = "arc",
                       from = Dict{Any, Any}("data"=> "table", "transform"=> [Dict{Any, Any}("type"=> "pie", "value"=> "data.y")]),
                       properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                                   endAngle = VegaValueRef(field = "endAngle"),
                                                                                   fill = VegaValueRef(field = "data.x", scale = "color"),
                                                                                   innerRadius = VegaValueRef(value = holesize),
                                                                                   outerRadius = VegaValueRef(value = 250),
                                                                                   startAngle = VegaValueRef(field = "startAngle"),
                                                                                   stroke = VegaValueRef(value = "white"),
                                                                                   x = VegaValueRef(group = "width", mult = 0.5),
                                                                                   y = VegaValueRef(group = "height", mult = 0.5)
                                                                                  )
                                                      )
                        )
                ]

    return v
end