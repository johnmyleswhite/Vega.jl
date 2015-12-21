function piechart(; x::AbstractVector = Real[], y::AbstractVector = [], holesize::Int = 0)

    v = VegaVisualization(height = 250, width = 250)

    add_data!(v, x = x, y = y, group = x)

    #Get unique table name
    table = v.data[1].name

    legend!(v)
    default_scales!(v)

    v.scales[3].domain = VegaDataRef(data = table, field = "x")

    v.marks = [VegaMark(_type = "arc",
                       from = VegaMarkFrom(data = table,
                                           transform = [VegaTransform(Dict{Any, Any}("type"=> "pie", "field"=> "y"))]),
                       properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                                   endAngle = VegaValueRef(field = "layout_end"),
                                                                                   fill = VegaValueRef(field = "group", scale = "group"),
                                                                                   innerRadius = VegaValueRef(value = holesize),
                                                                                   outerRadius = VegaValueRef(value = v.height),
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
