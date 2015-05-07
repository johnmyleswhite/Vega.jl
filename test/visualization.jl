d = [VegaData(values = [Dict{Any, Any}("x" => 1, "y" => 1),
                        Dict{Any, Any}("x" => 2, "y" => 3),
                        Dict{Any, Any}("x" => 3, "y" => 10),
                        Dict{Any, Any}("x" => 4, "y" => 3)])]

s = [VegaScale(name = "x",
               _type = "ordinal",
               range = "width",
               domain = VegaDataRef("table", "data.x"))
       VegaScale(name = "y",
                 _type = "linear",
                 range = "height",
                 domain = VegaDataRef("table", "data.y"))]

m = [VegaMark(_type = "rect",
    from = Dict{Any, Any}("data" => "table"),
              properties =
                VegaMarkProperties(enter =
                  VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "data.x"),
                                      width = VegaValueRef(scale = "x", band = true, offset = -1),
                                      y = VegaValueRef(scale = "y", field = "data.y"),
                                      y2 = VegaValueRef(scale = "y", value = 0)),
                 update = VegaMarkPropertySet(fill = VegaValueRef(value = "steelblue")),
                 hover = VegaMarkPropertySet(fill = VegaValueRef(value = "red"))))]

v = VegaVisualization(data = d,
                      scales = s,
                      marks = m)