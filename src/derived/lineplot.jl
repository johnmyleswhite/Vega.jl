function lineplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[])
    v = VegaVisualization()

    default_scales!(v)
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_lines!(v)

    v.marks[1].marks[1].properties.enter.stroke = VegaValueRef(scale = "group", field="group")

    #Default to Paired color scale, 12
    colorscheme!(v, ("Paired", 12))
    return v
end
