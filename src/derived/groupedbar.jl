@compat function groupedbar(; x::AbstractArray = Int[], y::AbstractArray = Int[], group::AbstractArray = Int[])

    v = VegaVisualization(height = 240, width = 300)
    add_data!(v, x = x, y = y, group = group)
    default_axes!(v)
    default_legend!(v)

    v.scales = Array(VegaScale, 3)

    v.scales[1] = VegaScale(name = "x",
                            _type = "ordinal",
                            range = "width",
                            padding = 0.2,
                            domain = VegaDataRef("table", "data.x"))
    v.scales[2] = VegaScale(name = "y",
                            range = "height",
                            domain = VegaDataRef("table", "data.y"),
                            nice = true)
    v.scales[3] = VegaScale(name = "group",
                            _type = "ordinal",
                            range = "category20",
                            domain = VegaDataRef("table", "data.group"))

    v.marks = [VegaMark(_type = "group")]
    v.marks[1].from = Dict{Any, Any}("data" => "table",
                                     "transform" => [VegaTransform(Dict{Any, Any}("keys" => ["data.x"], "type" => "facet"))])

    v.marks[1].marks = [VegaMark(_type = "rect")]
    v.marks[1].marks[1].properties = VegaMarkProperties(enter = VegaMarkPropertySet(fill = VegaValueRef(field = "data.group", scale = "group"),
                                                                                    width = VegaValueRef(band = true, offset = -1, scale = "pos"),
                                                                                    x = VegaValueRef(field = "data.group", scale = "pos"),
                                                                                    y = VegaValueRef(field = "data.y", scale = "y"),
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
                                    domain = VegaDataRef("field", "data.group"))]

    return v

end