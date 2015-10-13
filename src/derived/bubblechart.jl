function bubblechart(; x::AbstractVector = Int[], y::AbstractVector = Int[], group::AbstractVector = [], size::AbstractVector = Int[])

    v = scatterplot(x = x, y = y, group = cont)
    empty!(v.data)
    add_data!(v, x = x, y = y, group = cont, y2 = size)

    v.marks[1].properties.enter.size = VegaValueRef(field = "y2", mult = 30)

    return v

end