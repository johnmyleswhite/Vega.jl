function streamplot(;x::AbstractVector = Int[], y::AbstractVector = Int[], group::AbstractVector = Int[])

    v = areaplot(x = x, y = y, group = group, stacked = true)
    v.scales[1]._type = "ordinal"
    v.width = 900
    v.height = 400
    v.marks[1].from.transform[1].x["offset"] = "center"

    return v

end