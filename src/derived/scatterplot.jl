function scatterplot(;x::AbstractVector = Int[],
                      y::AbstractVector = Int[],
                      group::AbstractVector = Int[],
                      pointShape::AbstractString = "circle",
                      pointSize::Real = 50)

    v = VegaVisualization()

    add_data!(v, x = x, y = y, group = group)

    #Get unique table name
    table = v.data[1].name

    default_scales!(v)
    default_axes!(v)

    #if non-null array for group, add legend

    if group != Int[]
        legend!(v)
    end

    #Old add_points! code
    res = VegaMark(_type = "symbol",
                from = VegaMarkFrom(data=table),
                properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                            y = VegaValueRef(scale = "y", field = "y"))
                                                )
                                )


    v.marks == nothing? v.marks = [res] : push!(v.marks, res)
    #End add_points! code

    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "group")
    v.marks[1].properties.enter.size = VegaValueRef(value = pointSize)
    v.marks[1].properties.enter.shape = VegaValueRef(value = pointShape)

    return v

end
