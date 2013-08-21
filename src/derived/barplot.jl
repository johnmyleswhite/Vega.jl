function barplot(;x::AbstractVector = Int[],
                  y::AbstractVector = Int[],
                  group::AbstractVector = Int[])
    v = vg()

    default_scales!(v)
    v.scales[1]._type = "ordinal"
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_rects!(v)

    v.marks[1].properties.enter.width = VegaValueRef(scale = "x", band = true, offset = -1)
    v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", value = 0)
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "data.group")

    return v
end
