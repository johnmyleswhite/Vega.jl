function lineplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[],
                   points::Bool = false,
                   pointShape::AbstractString = "circle",
                   pointSize::Real = 10)

    v = VegaVisualization(name = "lineplot")

    add_data!(v, x = x, y = y, group = group)

    #Get unique table name
    table = v.data[1].name

    default_scales!(v)
    default_axes!(v)

    #If non-null array passed, put legend
    if group != Int[]
        legend!(v)
    end

    #Old add_lines! code
      innermarks = VegaMark(_type = "line",
                            properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                        y = VegaValueRef(scale = "y", field = "y"))
                                                                              )
                              )


      res = VegaMark(_type = "group",
                     from = VegaMarkFrom(data = table,
                                         transform =[VegaTransform(Dict{Any, Any}("type" => "facet", "groupby" => ["group"]))]
                                         ),
                     marks = [innermarks])

      v.marks == nothing? v.marks = [res] : push!(v.marks, res)

    #End add_lines!

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

    return v
end
