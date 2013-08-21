function scatterplot(;x::AbstractVector = Int[],
                      y::AbstractVector = Int[],
                      group::AbstractVector = Int[])
    v = vg()

    default_scales!(v)
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_points!(v)

    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "data.group")
    v.marks[1].properties.enter.fillOpacity = VegaValueRef(value = 0.5)

    return v
end
