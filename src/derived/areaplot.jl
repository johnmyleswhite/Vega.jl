function areaplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[])
    v = vg()

    default_scales!(v)
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_area!(v)

	  v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", value = 0)
	  v.marks[1].properties.enter.interpolate = VegaValueRef(scale = "y", value = "monotone")
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "data.group")

    return v
end
