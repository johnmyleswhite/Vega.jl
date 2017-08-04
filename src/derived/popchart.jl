function popchart(; x::AbstractVector = Int[], y::AbstractVector = Int[], group::AbstractVector = [])

    v = VegaVisualization(width = 640, height = 400)
    add_data!(v, x = x, y = y, group = group)

    #Get unique table name
    table = v.data[1].name

    legend!(v)

    v.scales = Array{VegaScale}(3)
    v.scales[1] = VegaScale(name = "g", domain = [2,1], range = "width",  _type = "ordinal")
    v.scales[2] = VegaScale(name = "y", _type = "ordinal", range = "height", reverse = true, domain = VegaDataRef(data = table, field = "y"))
    v.scales[3] = VegaScale(name = "group", _type = "ordinal", domain = [1,2], range = ["#1f77b4", "#e377c2"])

    v.marks = Array{VegaMark}(2)

    #Y-axis labels
    v.marks[2] = VegaMark(
                            _type = "text",
                            from = VegaMarkFrom(data = table,
                                                transform = [VegaTransform(Dict{Any, Any}("type" => "aggregate", "groupby" => ["y"]))]),
                            properties = VegaMarkProperties(
                                                            enter = VegaMarkPropertySet(
                                                                                        x = VegaValueRef(field = Dict{Any, Any}("group" => "width"), mult = 0.5, offset = -15),
                                                                                        y = VegaValueRef(scale = "y", field = "y", offset = 11),
                                                                                        text = VegaValueRef(field = "y"),
                                                                                        baseline = VegaValueRef(value = "middle"),
                                                                                        align = VegaValueRef(value = "center"),
                                                                                        fill = VegaValueRef(value = "#000")
                                                                                        )
                                                            )
                        )




    v.marks[1] = VegaMark(
                            _type = "group",
                            from = VegaMarkFrom(data = table,
                                                transform = [VegaTransform(Dict{Any, Any}("type" => "facet", "groupby" => ["group"])),
                                                             VegaTransform(Dict{Any, Any}("type" => "formula", "field" => "reverse", "expr" => "datum.key==2"))]),
                            properties = VegaMarkProperties(update = VegaMarkPropertySet(
                                                                                        x = VegaValueRef(scale = "g", field = "key"),
                                                                                        y = VegaValueRef(value = 0),
                                                                                        width = VegaValueRef(scale = "g", band = true, offset = -30),
                                                                                        height = VegaValueRef(field = Dict{Any, Any}("group" => "height"))
                                                                                        )
                            ),
                            scales = [VegaScale(
                                name = "x",
                                _type = "linear",
                                range = "width",
                                reverse = VegaDataRef(field = "reverse"),
                                nice = true,
                                domain = VegaDataRef(data = table, field = "x")
                                )

                            ],
                            axes = [VegaAxis(_type = "x", scale = "x", format = "s")],

                            #Actual bars for chart
                            marks = [VegaMark(
                            _type = "rect",
                            properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                            x2 = VegaValueRef(scale = "x", value = 0),
                                                                                            y = VegaValueRef(scale = "y", field = "y"),
                                                                                            height = VegaValueRef(scale = "y", band = true, offset = -1),
                                                                                            fill = VegaValueRef(scale = "group", field = "group")


                                )

                                )

        )]


    )

    #Default to Paired color scale, 12
    colorscheme!(v; palette = ("Paired", 12))
    return v
end
