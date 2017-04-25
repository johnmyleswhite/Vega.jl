function heatmap(;
                 x::AbstractVector = Float64[],
                 y::AbstractVector = Float64[],
                 color::AbstractVector = Int[])

    v = VegaVisualization(width = 800, height = 500)
    add_data!(v, x = x, y = y, group = color)

    #Get unique table name
    table = v.data[1].name

    #Use defaults as shortcut, update properties as necessary
    default_scales!(v)
    v.scales[1]._type = "ordinal"
    v.scales[2]._type = "ordinal"

    v.scales[3]._type = "linear"
    v.scales[3].range = ["#313695", "#4575b4", "#74add1", "#abd9e9", "#e0f3f8", "#ffffbf", "#fee090", "#fdae61", "#f46d43", "#d73027", "#a50026"]
    cmin,cmax = extrema(color)
    v.scales[3].domain = collect(linspace(cmin,cmax,length(v.scales[3].range)))

    #Use defaults for axes
    default_axes!(v)

    #Use default legend
    legend!(v)
    v.legends[1].values = [cmin, cmax]
    v.legends[1].title = ""

    #Marks
    v.marks = Array{VegaMark}(1)
    v.marks[1] = VegaMark(_type = "rect",
                          from = VegaMarkFrom(data = table),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                      width = VegaValueRef(scale = "x", band = true),
                                                                                      y = VegaValueRef(scale = "y", field = "y"),
                                                                                      height = VegaValueRef(scale = "y", band = true),
                                                                                      fill = VegaValueRef(scale = "group", field = "group")
                                                                                      )
                                                          )
                                               )


    return v
end
