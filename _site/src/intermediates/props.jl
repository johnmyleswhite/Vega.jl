function default_props()
    return VegaMarkPropertySet(x = VegaValueRef(scale = "x",
                                                field = "x"),
                               y = VegaValueRef(scale = "y",
                                                field = "y"))
end
