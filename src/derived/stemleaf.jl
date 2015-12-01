function stemleaf(; y::AbstractArray{Int} = Int[])

    #Stem and Leaf calculations
    sort!(y)
    leaf = Int[x % 10 for x in y]
    stem = Int[fld(x, 10) for x in y]

    position = Int[]
    i = stem[1]
    counter = 1

    for elem in stem
        if elem == i
            push!(position, counter)
            counter += 1
        else
            counter = 1
            push!(position, counter)
            i = elem
            counter += 1
        end
    end
    #End Stem and Leaf calculations


    v = scatterplot(x = position, y = stem, group = leaf)
    ylim!(v, min = minimum(stem), max = maximum(stem), reverse = true)
    legend!(v, show = false)
    colorscheme!(v, palette = "black")

    #Switch from circles to text
    v.marks[1]._type = "text"
    v.marks[1].properties.enter.shape = VegaValueRef(value = "")
    v.marks[1].properties.enter.size = VegaValueRef(value = "")
    v.marks[1].properties.enter.text = VegaValueRef(field = "group")
    v.marks[1].properties.enter.fillOpacity = VegaValueRef(value = 1)

    #Text offsets
    v.marks[1].properties.enter.baseline = VegaValueRef(value = "middle")
    v.marks[1].properties.enter.y = VegaValueRef(scale = "y", field = "y", offset = 0.5)
    v.marks[1].properties.enter.x = VegaValueRef(scale = "x", field = "x", offset = -10)

    #Hide x ticks, axis, labels
    xlab!(v, title = " ", properties = Dict{Any, Any}("ticks" => Dict{Any, Any}("stroke" => VegaValueRef(value = "transparent")),
                                         "axis" => Dict{Any, Any}("stroke" => VegaValueRef(value = "transparent")),
                                         "labels" => Dict{Any, Any}("fill" => VegaValueRef(value = "transparent"))
                                        )
         )

    #Hide y ticks
    ylab!(v, title = " ", ticks = length(unique(stem)), tickSizeEnd = 0, properties = Dict{Any, Any}("ticks" => Dict{Any, Any}("stroke" => VegaValueRef(value = "transparent"))
                                        )
         )

    return v

end