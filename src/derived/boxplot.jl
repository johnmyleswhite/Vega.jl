function boxplot(;y::AbstractVector = Int[], group::AbstractVector = Int[])

    #If x is missing, create ones array of same length
    if group == Int[]
      group = [" " for x in 1:length(y)]
    end

    v = VegaVisualization(height = 200, width = 600, name = "boxplot")

    #Set box size
    v.signals = [Dict{Any, Any}("name" => "boxSize", "init" => 40)]

    #Add data defaults
    add_data!(v, x = group , y = y)

    #Get unique table name
    table = v.data[1].name

    #Calculate moments
    stats = VegaData(name = "stats",
                     source = table,
                     transform = [VegaTransform(Dict{Any, Any}("type" => "aggregate", "groupby" => "x", "summarize" => Dict{Any, Any}("y" => ["min", "max", "median", "q1", "q3", "valid"])))]
                    )

    push!(v.data, stats)

    #Calculate whiskers
    whiskers = VegaData(name = "iqrcalcs",
                        source = "stats",
                        transform = [VegaTransform(Dict{Any, Any}("type" => "formula", "field" => "lower", "expr" => "max(datum.min_y,datum.q1_y-1.5*(datum.q3_y-datum.q1_y))")),
                                     VegaTransform(Dict{Any, Any}("type" => "formula", "field" => "upper", "expr" => "min(datum.max_y,datum.q1_y+1.5*(datum.q3_y-datum.q1_y))"))
                                    ]
                        )

    push!(v.data, whiskers)

    #Axes
    v.axes = Array{VegaAxis}(2)
    v.axes[1] = VegaAxis(_type = "x", scale = "x")
    v.axes[2] = VegaAxis(_type = "y", scale = "y", tickSize = 0, offset = 5, properties = Dict{Any, Any}("axis" => Dict{Any, Any}("stroke" => Dict{Any, Any}("value" => "transparent"))))

    #Scales
    v.scales = Array{VegaScale}(3)
    v.scales[2] = VegaScale(name = "y", _type = "ordinal", range = "height", points = true, round = true,
                            padding = 1.5, domain = VegaDataRef(data = table, field = "x"))


    v.scales[1] = VegaScale(name = "x", _type = "linear", domain = VegaDataRef(data = table, field = "y"),
                            range = "width", round = true, nice = true)

    v.scales[3] = VegaScale(name = "group", _type = "ordinal", domain = VegaDataRef(data = table, field = "x"),
                            range = "ordinal20", round = true, nice = true)

    #Marks
    v.marks = Array{VegaMark}(8)
    v.marks[2] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                                             properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "lower"),
                                                                                                         x2 = VegaValueRef(scale = "x", field = "q1_y"),
                                                                                                         yc = VegaValueRef(scale = "y", field = "x"),
                                                                                                         height = VegaValueRef(value = 1),
                                                                                                         fill = VegaValueRef(value = "#888")

                                                                                                        )
                                                         )
    )

    v.marks[8] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                                             properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "q3_y"),
                                                                                                         x2 = VegaValueRef(scale = "x", field = "upper"),
                                                                                                         yc = VegaValueRef(scale = "y", field = "x"),
                                                                                                         height = VegaValueRef(value = 1),
                                                                                                         fill = VegaValueRef(value = "#888")

                                                                                                        )
                                                         )
    )

    v.marks[1] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                                              properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "q1_y"),
                                                                                                         x2 = VegaValueRef(scale = "x", field = "q3_y"),
                                                                                                         yc = VegaValueRef(scale = "y", field = "x"),
                                                                                                         height = VegaValueRef(signal = "boxSize"),
                                                                                                         fill = VegaValueRef(scale = "group", field = "x"),
                                                                                                         stroke = VegaValueRef(value = "#888")

                                                                                                        )
                         )
    )


     v.marks[3] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "median_y"),
                                                                                      width = VegaValueRef(value = 2),
                                                                                      yc = VegaValueRef(scale = "y", field = "x"),
                                                                                      height = VegaValueRef(signal = "boxSize"),
                                                                                      fill = VegaValueRef(value = "#000")
                                                                                                        )
                         )
    )


     v.marks[4] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "lower"),
                                                                                      width = VegaValueRef(value = 1),
                                                                                      yc = VegaValueRef(scale = "y", field = "x"),
                                                                                      height = VegaValueRef(signal = "boxSize", mult = 0.5),
                                                                                      fill = VegaValueRef(value = "#000")
                                                                                                        )
                         )
    )

     v.marks[5] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "iqrcalcs"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "upper"),
                                                                                      width = VegaValueRef(value = 1),
                                                                                      yc = VegaValueRef(scale = "y", field = "x"),
                                                                                      height = VegaValueRef(signal = "boxSize", mult = 0.5),
                                                                                      fill = VegaValueRef(value = "#000")
                                                                                                        )
                         )
    )

    v.marks[6] = VegaMark(_type = "symbol",
                      from = VegaMarkFrom(data = "iqrcalcs"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "min_y"),
                                                                                      size = VegaValueRef(value = 40),
                                                                                      yc = VegaValueRef(scale = "y", field = "x"),
                                                                                      stroke = VegaValueRef(value = "#000")

                                                                                                        )
                         )
    )


    v.marks[7] = VegaMark(_type = "symbol",
                      from = VegaMarkFrom(data = "iqrcalcs"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "max_y"),
                                                                                      size = VegaValueRef(value = 40),
                                                                                      yc = VegaValueRef(scale = "y", field = "x"),
                                                                                      stroke = VegaValueRef(value = "#000")

                                                                                                        )
                         )
    )

    #Default to Paired color scale, 12
    colorscheme!(v; palette = ("Paired", 12))
    return v


    return v

end
