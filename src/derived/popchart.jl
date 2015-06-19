@compat function popchart(; x::AbstractArray = Int[], y::AbstractArray = Int[], group::AbstractArray = [])

    v = VegaVisualization()
    add_data!(v, x = x, y = y, group = group)

    v.scales = Array(VegaScale, 3)
    v.scales[1] = VegaScale(name = "g", domain = [0,1], range = [340, 10])
    v.scales[2] = VegaScale(name = "y", _type = "ordinal", range = "height", reverse = true, domain = VegaDataRef("table", "data.y"))
    v.scales[3] = VegaScale(name = "group", _type = "ordinal", domain = [1,2], range = ["#1f77b4", "#e377c2"])

    v.marks = Array(VegaMark,2)

    v.marks[1] = VegaMark(
    _type = "text",
    from = Dict{Any, Any}("data" => "table",
                          "transform" => [Dict{Any, Any}("type" => "unique",  "field" => "data.y", "as" => "y")]
                         ),
    properties = VegaMarkProperties(
    enter = VegaMarkPropertySet(
    x = VegaValueRef(value = 325),
    y = VegaValueRef(scale = "y", field = "y", offset = 11),
    text = VegaValueRef(field = "y"),
    baseline = VegaValueRef(value = "middle"),
    align = VegaValueRef(value = "center"),
    fill = VegaValueRef(value = "#000")
    ))
    )

    v.marks[2] = VegaMark(
    _type = "group",
    from = Dict{Any, Any}(
            "data" => "table",
    "transform" => [Dict{Any, Any}("type" => "facet", "keys" => ["data.group"])]),
    properties = VegaMarkProperties(update = VegaMarkPropertySet(
                                                                x = VegaValueRef(scale = "g", field = "index"),
                                                                y = VegaValueRef(value = 0),
                                                                width = VegaValueRef(value = 300),
                                                                height = VegaValueRef(group = "height")
                                                                )
    ),
    scales = [VegaScale(
        name = "x",
        _type = "linear",
        range = "width",
        reverse = VegaDataRef(field = "index"),
        nice = true,
        domain = VegaDataRef(data = "table", field = "data.x")
        )

    ],
    axes = [VegaAxis(_type = "x", scale = "x", format = "s")],

    marks = [VegaMark(
    _type = "rect",
    properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "data.x"),
                                                                    x2 = VegaValueRef(scale = "x", value = 0),
                                                                    y = VegaValueRef(scale = "y", field = "data.y"),
                                                                    height = VegaValueRef(scale = "y", band = true, offset = -1),
                                                                    fillOpacity = VegaValueRef(value = 0.6),
                                                                    fill = VegaValueRef(scale = "group", field = "data.group")


        )

        )

        )]


    )

    v
end