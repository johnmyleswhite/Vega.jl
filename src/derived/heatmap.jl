function heatmap(;
                 x::Vector = Float64[],
                 y::Vector = Float64[],
                 color::Vector = Int[])

    v = VegaVisualization(width = 800, height = 500)
    add_data!(v, x = x, y = y, group = color)

    #Use defaults as shortcut, update properties as necessary
    default_scales!(v)
    v.scales[1]._type = "ordinal"
    v.scales[2]._type = "ordinal"

    v.scales[3]._type = "linear"
    v.scales[3].domain = [0,0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
    v.scales[3].range = ["#313695", "#4575b4", "#74add1", "#abd9e9", "#e0f3f8", "#ffffbf", "#fee090", "#fdae61", "#f46d43", "#d73027", "#a50026"]

    #Use defaults for axes
    default_axes!(v)

    #Use default legend
    default_legend!(v)
    v.legends[1].values = [0, 0.5, 1]
    v.legends[1].title = ""

    #Marks
    v.marks = Array(VegaMark, 1)
    v.marks[1] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = "table"),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                      width = VegaValueRef(value = 26),
                                                                                      y = VegaValueRef(scale = "y", field = "y"),
                                                                                      height = VegaValueRef(scale = "y", band = true),
                                                                                      fill = VegaValueRef(scale = "group", field = "group")
                                                                                      )
                                                          )
                                               )


    return v
end
