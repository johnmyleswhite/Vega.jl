function horizon(; x::AbstractVector = [], y::AbstractVector = [])

    #Base for code to modify
    v = areaplot(x = x, y = y)
    v.height = 100
    v.name = "horizon"

    #Add signals to deal with mouse-clicks
    v.signals = [
                Dict{Any, Any}("name" => "layers", 
                               "init" => 2,
                               "streams" => [Dict{Any, Any}("type" => "click", "expr" => "1 + (layers % 4)")]
                               ),
                Dict{Any, Any}("name" => "vheight", 
                               "init" => Dict{Any, Any}("expr" => "height * layers"),
                               "streams" => [Dict{Any, Any}("type" => "layers, height", "expr" => "height * layers")]
                               ),
                Dict{Any, Any}("name"=> "opacity", 
                               "init"=> Dict{Any, Any}("expr"=> "pow(layers, -2/3)"),
                               "streams"=> [Dict{Any, Any}("type"=> "layers", "expr"=> "pow(layers, -2/3)")]
                               )
                ]

    #Add transform to data
    _data = VegaData(name = "layer_indices",
                 values =  [0, 1, 2, 3],
                 transform = [VegaTransform(Dict{Any, Any}("type" => "filter", "test" => "datum.data < layers")),
                              VegaTransform(Dict{Any, Any}("type" => "formula", "field"=> "offset", "expr" => "datum.data * -height"))
                             ]
                )

    push!(v.data, _data)

    #Drop y axis
    v.axes = [v.axes[1]]

    # Change scale based on mouse-click
    v.scales[2].range = [Dict{Any, Any}("signal" => "vheight"), 0]

    #Completely re-do marks
    v.marks = [
              VegaMark(
                      _type = "group",
                      properties = VegaMarkProperties(
                                                      update =   VegaMarkPropertySet(
                                                                                    width = VegaValueRef(field = Dict{Any, Any}("group" => "width")),
                                                                                    height = VegaValueRef(field = Dict{Any, Any}("group" => "height")),
                                                                                    clip = VegaValueRef(value = true)
                                                                                    )
                                                      ),

                      marks = [
                                VegaMark(
                                        _type = "group",
                                        from = VegaMarkFrom(data = "layer_indices"),
                                        properties =  VegaMarkProperties(update = VegaMarkPropertySet(y = VegaValueRef(field = "offset"))),
                                        marks = [
                                                  VegaMark(
                                                            _type = "area",
                                                            from = VegaMarkFrom(data = v.marks[1].from.data),
                                                            properties = VegaMarkProperties(
                                                                                            enter = VegaMarkPropertySet(
                                                                                                                        interpolate = VegaValueRef(value = "monotone"),
                                                                                                                        x = VegaValueRef(scale = "x", field = "x"),
                                                                                                                        fill = VegaValueRef(scale = "group", field = "group")
                                                                                                                        ),
                                                                                            update = VegaMarkPropertySet(
                                                                                                                        y = VegaValueRef(scale = "y", field = "y"),
                                                                                                                        y2 = VegaValueRef(scale = "y", value = 0),
                                                                                                                        fillOpacity = VegaValueRef(signal = "opacity")
                                                                                                                      )
                                                                                            )
                                                          )
                                                ]
                                      )
                              ]
                    )
              ]

    return v
end