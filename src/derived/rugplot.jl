function rugplot(; x::AbstractVector = Int[])
    v = VegaVisualization(width = 400, height = 20, padding = "auto")
    add_data!(v, x = x, y = zeros(Int,length(x)))

    v.marks = Array(VegaMark,1)
    v.marks[1] = VegaMark(_type = "group", name = "cell")
    v.marks[1].properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                            width = VegaValueRef(value = 400),
                                                                            height = VegaValueRef(value = 20)
                                                                          )
                                              )

    v.marks[1].scales = Array(VegaScale, 1)
    v.marks[1].scales[1] = VegaScale(name = "x",
                            _type = "linear",
                            domain = VegaDataRef(data = "table", field = "x"),
                            range = [0, 400],
                            zero = true,
                            reverse = false,
                            round = true,
                            nice = true
                            )

    #Creates axis and light gray lines
    v.marks[1].axes = Array(VegaAxis, 1)
    v.marks[1].axes[1] = VegaAxis(_type = "x",
                                  scale = "x",
                                  properties = Dict{Any, Any}("stroke" => Dict{Any, Any}("value" => "#000000"),
                                                              "opacity" => Dict{Any, Any}("value" => 0.08)
                                                             ),
                                  layer = "back",
                                  format = "",
                                  ticks = 5,
                                  titleOffset = 38,
                                  grid = true,
                                  title = ""
                              )


    #Add data
    v.marks[1].marks = Array(VegaMark, 1)
    v.marks[1].marks[1] = VegaMark(_type = "rect",
                                                       from = VegaMarkFrom(data = "table"),
                                                       properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                                                   y =  VegaValueRef(value = 0),
                                                                                                                   width =  VegaValueRef(value = 1),
                                                                                                                   height =  VegaValueRef(value = 14),
                                                                                                                   fill = VegaValueRef(value = "#4682b4"),
                                                                                                                   opacity = VegaValueRef(value = 0.7)
                                                                                                                    ),
                                                                                        update = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                                                   y =  VegaValueRef(value = 0),
                                                                                                                   width =  VegaValueRef(value = 1),
                                                                                                                   height =  VegaValueRef(value = 14),
                                                                                                                   fill = VegaValueRef(value = "#4682b4"),
                                                                                                                   opacity = VegaValueRef(value = 0.7)
                                                                                                                    )
                                                                                      )
                                  )

    return v
end