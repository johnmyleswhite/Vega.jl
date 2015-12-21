function bubblechart(; x::AbstractVector = Int[],
					   y::AbstractVector = Int[],
					   group::AbstractVector = [],
					   pointSize::AbstractVector = Int[],
					   pointShape::AbstractString = "circle")

    v = scatterplot(x = x, y = y, group = group)
    #Get name before destroying
    table = v.data[1].name

    empty!(v.data)
    add_data!(v, name = table, x = x, y = y, group = group, y2 = pointSize)

    v.marks[1].properties.enter.size = VegaValueRef(field = "y2", mult = 30)
    v.marks[1].properties.enter.shape = VegaValueRef(value = pointShape)

    return v

end