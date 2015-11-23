function piechart(; x::AbstractArray = Real[], y::AbstractArray = [], holesize::Int = 0)

    v = VegaVisualization(height = 250, width = 250)
    v.legends = [VegaLegend(fill = "group", title = "group")]

    add_data!(v, x = x, y = y)

    v.scales = [VegaScale(name = "group",
                      domain = VegaDataRef("table", "x"),
                      range = "category10",
                      _type = "ordinal")]

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

    #Default to Paired color scale, 12
    colorscheme!(v; palette = ("Paired", 12))
    return v
end
