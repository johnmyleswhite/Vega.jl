function add_lines!(v::VegaVisualization)
	innermarks = Array(VegaMark, 1)
    innermarks[1] =
      VegaMark(_type = "line",
               properties = VegaMarkProperties(enter = default_props()))
    res = VegaMark(_type = "group",
                   from = Dict(
                           "data" => "table",
                           "transform" =>
                             [Dict("type" => "facet", "keys" => ["data.group"])]
                          ),
                   marks = innermarks)

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end
