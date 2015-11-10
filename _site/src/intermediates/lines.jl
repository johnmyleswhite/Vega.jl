@compat function add_lines!(v::VegaVisualization)
	innermarks = Array(VegaMark, 1)
    innermarks[1] =
      VegaMark(_type = "line",
               properties = VegaMarkProperties(enter = default_props()))
    res = VegaMark(_type = "group",
                   from = VegaMarkFrom(data = "table",
                                       transform =[VegaTransform(Dict{Any, Any}("type" => "facet", "groupby" => ["group"]))]
                                       ),
                   marks = innermarks)

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end
