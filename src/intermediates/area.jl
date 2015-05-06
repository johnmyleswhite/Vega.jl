function add_area!(v::VegaVisualization)
    res = VegaMark(_type = "area",
                   from = Dict("data" => "table"),
                   properties = VegaMarkProperties(enter = default_props()))

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end
