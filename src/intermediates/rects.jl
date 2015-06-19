function add_rects!(v::VegaVisualization)
    res = @compat VegaMark(_type = "rect",
                   from = Dict{Any, Any}("data" => "table"),
                   properties = VegaMarkProperties(enter = default_props()))

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end
