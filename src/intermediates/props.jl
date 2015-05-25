function default_props()
    return VegaMarkPropertySet(x = VegaValueRef(scale = "x",
                                                field = "data.x"),
                               y = VegaValueRef(scale = "y",
                                                field = "data.y"))
end
