function piechart(; x::AbstractVector = Real[], y::AbstractVector = [], holesize::Int = 0)

    v = VegaVisualization(height = 250, width = 250)
    legend!(v)

    add_data!(v, x = x, y = y)

    default_scales!(v)

    v.scales[3].domain = VegaDataRef("table", "x")

    v.marks = [VegaMark(_type = "arc",
                       from = VegaMarkFrom(data = "table",
                                           transform = [VegaTransform(Dict{Any, Any}("type"=> "pie", "field"=> "y"))]),
                       properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                                   endAngle = VegaValueRef(field = "layout_end"),
                                                                                   fill = VegaValueRef(field = "x", scale = "group"),
                                                                                   innerRadius = VegaValueRef(value = holesize),
                                                                                   outerRadius = VegaValueRef(value = 250),
                                                                                   startAngle = VegaValueRef(field = "layout_start"),
                                                                                   stroke = VegaValueRef(value = "white"),
                                                                                   x = VegaValueRef(group = "width", mult = 0.5),
                                                                                   y = VegaValueRef(group = "height", mult = 0.5)
                                                                                  )
                                                      )
                        )
                ]

    return v
end
