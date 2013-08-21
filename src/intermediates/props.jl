function default_props()
    return VegaMarkPropertySet(x = VegaValueRef(scale = "x",
                                                field = "data.x"),
                               y = VegaValueRef(scale = "y",
                                                field = "data.y"),
                               stroke = VegaValueRef(scale = "group",
                                                     field = "data.group"))
end
