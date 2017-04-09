function groupedbar(; x::AbstractVector = Int[], y::AbstractVector = Int[], group::AbstractVector = Int[], horizontal::Bool = false)

    v = VegaVisualization(height = 300, width = 500, name = "groupedbar")

    #This seems like it should be a method, but so easy to do right here
    if typeof(x) == Vector{Char}
        x = String[string(s) for s in x]
    end

    add_data!(v, x = x, y = y, group = group)
    default_axes!(v)
    legend!(v)

    #Get unique table name
    table = v.data[1].name

    default_scales!(v, typeXaxis = "ordinal")
    v.scales[1].padding = 0.2
    v.scales[2].nice = true


    v.marks = [VegaMark(_type = "group")]
    v.marks[1].from = VegaMarkFrom(data = table,
                                   transform = [VegaTransform(Dict{Any, Any}("groupby" => ["x"], "type" => "facet"))])

    v.marks[1].marks = [VegaMark(_type = "rect")]
    v.marks[1].marks[1].properties = VegaMarkProperties(enter = VegaMarkPropertySet(fill = VegaValueRef(field = "group", scale = "group"),
                                                                                    width = VegaValueRef(band = true, offset = -1, scale = "pos"),
                                                                                    x = VegaValueRef(field = "group", scale = "pos"),
                                                                                    y = VegaValueRef(field = "y", scale = "y"),
                                                                                    y2 = VegaValueRef(scale = "y", value = 0)
                                                                                    )
                                                        )
    v.marks[1].properties = VegaMarkProperties(enter = VegaMarkPropertySet(width = VegaValueRef(band = true, scale = "x"),
                                                                            x = VegaValueRef(field = "key", scale = "x")
                                                )
                                                )

    v.marks[1].scales = [VegaScale(name = "pos",
                                    _type = "ordinal",
                                    range = "width",
                                    domain = VegaDataRef(field = "group"))]

    if horizontal == true
        coord_flip!(v)
    end

    return v

end
