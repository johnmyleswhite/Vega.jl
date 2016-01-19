function dotplot(; x::AbstractVector = Real[], y::AbstractVector = Real[], group::AbstractVector = Real[], sorted::Bool = true)

    v = VegaVisualization(width = 800, height = 400)

    #Quick defaults
    add_data!(v, y = y, x = x, group = group)
    default_axes!(v)
    default_scales!(v)

    if group != Real[]
      legend!(v)
    end

    #Get unique table name
    table = v.data[1].name

    #Switch data source
    v.scales[1].domain.data = v.scales[2].domain.data = "aggregate"
    v.scales[1].domain.field = "average_x"

    #Switch y scale for categorical, padding and data source
    v.scales[2]._type = "ordinal"
    v.scales[2].padding = 1

    #Add gridlines
    ylab!(v, grid = true, layer = "back")

    #Calculate average
    push!(v.data, VegaData(name = "aggregate", source = table,
                          transform = [VegaTransform(Dict{Any, Any}("type" => "aggregate", "groupby"=> ["y", "group"], "summarize"=> Dict{Any, Any}("x" => ["average"])))
                                      ]
                )
       )

    if sorted
        v.scales[2].domain.sort = Dict{Any, Any}("field" => "average_x", "op" => "mean")
        v.scales[2].reverse = true
    end

    v.marks = [VegaMark(_type = "symbol",
                        from = VegaMarkFrom(data = "aggregate"),
                        properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "average_x"),
                                                                                      y = VegaValueRef(scale = "y", field = "y"),
                                                                                      size = VegaValueRef(value = 50),
                                                                                      shape = VegaValueRef(value = "circle"),
                                                                                      stroke = VegaValueRef(field = "group", scale = "group"),
                                                                                      strokeWidth = VegaValueRef(value = 2)
                                                                                    )
                                                       )
      )]

    return v
end