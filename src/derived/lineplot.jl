function lineplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[])
    v = vg()

    default_scales!(v)
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group)
    add_lines!(v)

    return v
end
