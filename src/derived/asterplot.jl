function asterplot(; x::AbstractVector = [], y::AbstractVector = Int[], weight::AbstractVector = Float64[], holesize = 0)

    v = piechart(x = x, y = y, holesize = holesize)

    #Shim weights into y2 slot
    for d in enumerate(v.data[1].values)
        if weight != Float64[]
            d[2]["y2"] = weight[d[1]]
        else
            d[2]["y2"] = 1
        end
    end

    v.marks[1].from.transform = [VegaTransform(Dict{Any, Any}("type" => "pie", "field" => "y2")),
                             VegaTransform(Dict{Any, Any}("type" => "formula", "expr" => "($(v.height) - $(v.marks[1].properties.enter.innerRadius.value)) * (datum.y/100.0) + $(v.marks[1].properties.enter.innerRadius.value)", "field" => "calcOuterRadius"))
                            ]

    v.marks[1].properties.enter.outerRadius = VegaValueRef(field = "calcOuterRadius")

    #make a copy of the entire properties, then change to make gray background
    push!(v.marks, deepcopy(v.marks[1]))

    #Change stroke to gray, remove fill, make outerRadius total height
    v.marks[2].properties.enter.stroke = VegaValueRef(value = "gray")
    v.marks[2].properties.enter.fill = nothing
    v.marks[2].properties.enter.outerRadius = VegaValueRef(value = v.height)

    return v

end