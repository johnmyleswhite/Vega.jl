function areaplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[],
                   stacked::Bool = false)

    v = barplot(x = x, y = y, group = group)

    v.marks[1]._type = "area"
    v.marks[1].properties.enter.width = nothing
    v.marks[1].properties.enter.interpolate = VegaValueRef(value = "monotone")
    v.scales[1]._type = nothing
    v.scales[1].zero = false

    if stacked
    	v = barplot(x = x, y = y, group = group, stacked = true)
	    v.scales[1].zero = false
		  v.scales[1]._type = nothing
		  v.marks[1].marks[1]._type = "area"
		  v.marks[1].marks[1].properties.enter.interpolate = VegaValueRef(value = "monotone")
		  v.marks[1].marks[1].properties.enter.width = nothing
	  end

    return v
end