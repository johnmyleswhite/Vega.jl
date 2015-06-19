@compat function wordcloud(; x::AbstractVector =  String[], y::AbstractVector = Int[])
    v = VegaVisualization(height = 400, width = 400, padding = "auto")

    add_data!(v, x = x, y = y)

    v.data[1].transform = [VegaTransform(Dict{Any, Any}("type" => "wordcloud", "text" => "data.x", "font" => "Helvetica Neue",
        "fontSize" => "data.y", "rotate" => Dict{Any, Any}("random" => [-60,-30,0,30,60])))]

    v.marks = Array(VegaMark,1)
    v.marks[1] = VegaMark(_type = "text",
                          from = Dict{Any, Any}("data" => "table"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                    x = VegaValueRef(field = "x"),
                                                                    y = VegaValueRef(field = "y"),
                                                                    angle = VegaValueRef(field = "angle"),
                                                                    align = VegaValueRef(value = "center"),
                                                                    baseline = VegaValueRef(value = "alphabetic"),
                                                                    font = VegaValueRef(field = "font"),
                                                                    fontSize = VegaValueRef(field = "fontSize"),
                                                                    text = VegaValueRef(field = "data.x")
                                                                    ),

                                                         update = VegaMarkPropertySet(fill = VegaValueRef(value = "steelblue")),
                                                         hover = VegaMarkPropertySet(fill = VegaValueRef(value = "#f00"))
    )
    )

    v
end