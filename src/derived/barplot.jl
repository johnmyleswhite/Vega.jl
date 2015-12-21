function barplot(;x::AbstractVector = Int[],
                  y::AbstractVector = Int[],
                  y2::AbstractVector = Int[],
                  group::AbstractVector = Int[],
                  stacked::Bool = false,
                  horizontal::Bool = false,
                  normalize::Bool = false)

    v = VegaVisualization()

    add_data!(v, x = x, y = y, group = group, y2 = y2)
    default_scales!(v; typeXaxis = "ordinal")
    default_axes!(v)

    #Get unique table name
    table = v.data[1].name

    #If non-zero group is passed, add a legend
    if group != Int[]
      legend!(v)
    end

    #old add_rects code
    res = VegaMark(_type = "rect",
                  from = VegaMarkFrom(data=table),
                  properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                              y = VegaValueRef(scale = "y", field = "y"))
                                                  )
                  )

    v.marks == nothing? v.marks = [res] : push!(v.marks, res)
    #end add_rects code

    v.marks[1].properties.enter.width = VegaValueRef(scale = "x", band = true, offset = -1)
    v.marks[1].properties.enter.y = VegaValueRef(scale = "y", field = "y")
    v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", field = "y2")
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "group")

    if stacked
      push!(v.data, VegaData(name = "stats", source = table,
                             transform = [VegaTransform(Dict{Any, Any}("type"=> "aggregate", "groupby" => ["x"], "summarize"=>[Dict{Any,Any}("field" => "y", "ops" => ["sum"])]))]))

      # bind the y scale to layout start and layout end
      v.marks[1].properties.enter.y = VegaValueRef(scale = "y", field = "layout_start")
      v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", field = "layout_end")

      v.scales[2].domain = VegaDataRef(data = "stats", field = "sum_y")

      v.marks[1].from = VegaMarkFrom(data = table,
                                     transform = [VegaTransform(Dict{Any, Any}("type" => "stack", "groupby" => ["x"], "sortby" => ["group"], "field"=>"y", "offset" => normalize == true? "normalize" : "zero"))])

      if normalize
        ylim!(v, min = 0, max = 1)
      end

    end

    #Return horizontal bar chart
    if horizontal
        coord_flip!(v)
    end

    return v
end
