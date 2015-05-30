function barplot(;x::AbstractVector = Int[],
                  y::AbstractVector = Int[],
                  y2::AbstractVector = Int[],
                  group::AbstractVector = Int[])
    v = VegaVisualization()

    default_scales!(v)
    v.scales[1]._type = "ordinal"
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group, y2 = y2)
    add_rects!(v)

    v.marks[1].properties.enter.width = VegaValueRef(scale = "x", band = true, offset = -1)
    v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", field = "data.y2")
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "data.group")

    return v
end
