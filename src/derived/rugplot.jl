function rugplot(; x::AbstractVector = Int[])
    v = VegaVisualization(width = 400, height = 20, padding = "auto")

    add_data!(v, x = x, y = zeros(Int,length(x)))

    #Get unique table name
    table = v.data[1].name

    default_scales!(v)

    #Creates axis and light gray lines
    v.axes = Array(VegaAxis, 1)
    v.axes[1] = VegaAxis(_type = "x",
                                  scale = "x",
                                  properties = Dict{Any, Any}("stroke" => Dict{Any, Any}("value" => "#000000"),
                                                              "opacity" => Dict{Any, Any}("value" => 0.08)
                                                             ),
                                  layer = "back",
                                  ticks = 5,
                                  titleOffset = 38,
                                  grid = true,
                              )


    #Add data
    v.marks = Array(VegaMark, 1)
    v.marks[1] = VegaMark(_type = "rect",
                           from = VegaMarkFrom(data = table),
                           properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                       y =  VegaValueRef(value = 0),
                                                                                       width =  VegaValueRef(value = 1),
                                                                                       height =  VegaValueRef(value = 14),
                                                                                       fill = VegaValueRef(scale = "group", field = "group"),
                                                                                       opacity = VegaValueRef(value = 0.7)
                                                                                        )
                                                          )
                          )

    return v
end