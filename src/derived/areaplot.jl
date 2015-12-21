function areaplot(;x::AbstractVector = Int[],
                   y::AbstractVector = Int[],
                   group::AbstractVector = Int[],
                   stacked::Bool = false,
                   normalize::Bool = false)


    if stacked
    	v = barplot(x = x, y = y, group = group, stacked = true)

        #Get unique table name
        table = v.data[1].name

	    v.scales[1].points = true
		  v.scales[1]._type = nothing

        innermark = VegaMark(_type="area", properties=VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                                                                                                     y = VegaValueRef(scale = "y", field = "y"))))

        innermark.properties.enter.y = VegaValueRef(scale = "y", field = "layout_start")
        innermark.properties.enter.y2 = VegaValueRef(scale = "y", field = "layout_end")
        innermark.properties.enter.fill = VegaValueRef(scale = "group", field = "group")
        innermark.properties.enter.interpolate = VegaValueRef(value="monotone")

        mark = VegaMark(_type = "group",
                        from = VegaMarkFrom(data=table,
                                            transform=[VegaTransform(Dict{Any,Any}("type"=>"stack", "groupby" => ["x"], "sortby" => ["group"], "field" => "y", "offset" => normalize == true? "normalize" : "zero")),
                                                       VegaTransform(Dict{Any,Any}("type"=>"facet", "groupby" => ["group"]))]),
                        marks = [innermark])

        v.marks = [mark]

      if normalize
        ylim!(v, min = 0, max = 1)
      end

	else
        v = barplot(x = x, y = y, group = group)

        v.marks[1]._type = "area"
        v.marks[1].properties.enter.width = nothing
        v.marks[1].properties.enter.interpolate = VegaValueRef(value = "monotone")
        v.scales[1]._type = "linear"
        v.scales[1].zero = false
    end

    return v
end
