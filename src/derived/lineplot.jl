function lineplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[],
                   points::Bool = false,
                   pointShape::AbstractString = "circle",
                   pointSize::Real = 10)

    v = VegaVisualization(name = "lineplot")

    default_scales!(v)
    default_axes!(v)

    #If non-null array passed, put legend
    if group != Int[]
        default_legend!(v)
    end

    add_data!(v, x = x, y = y, group = group)
    add_lines!(v)

    v.marks[1].marks[1].properties.enter.stroke = VegaValueRef(scale = "group", field="group")

    #Make line width a little thicker
    v.marks[1].marks[1].properties.enter.strokeWidth = VegaValueRef(value = 2)

    #Add points if desired
    if points

        copymark = deepcopy(v.marks[1].marks[1])
        push!(v.marks[1].marks, copymark)
        v.marks[1].marks[2]._type = "symbol"
        v.marks[1].marks[2].properties.enter.size = VegaValueRef(value = pointSize)
        v.marks[1].marks[2].properties.enter.shape = VegaValueRef(value = pointShape)

    end

    #Default to Paired color scale, 12
    colorscheme!(v; palette = ("Paired", 12))
    return v
end
