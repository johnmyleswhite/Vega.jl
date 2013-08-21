function add_points!(v::VegaVisualization)
    res = VegaMark(_type = "symbol",
                   from = {"data" => "table"},
                   properties = VegaMarkProperties(enter = default_props()))

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end
