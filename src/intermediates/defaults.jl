function default_scales!(v::VegaVisualization)
    v.scales = Array(VegaScale, 3)

    v.scales[1] = VegaScale(name = "x",
                            _type = "linear",
                            range = "width",
                            domain = VegaDataRef("table", "x"))
    v.scales[2] = VegaScale(name = "y",
                            _type = "linear",
                            range = "height",
                            domain = VegaDataRef("table", "y"))
    v.scales[3] = VegaScale(name = "group",
                            _type = "ordinal",
                            range = "category10",
                            domain = VegaDataRef("table", "group"))

    return v
end

function default_axes!(v::VegaVisualization)
    v.axes = Array(VegaAxis, 2)

    v.axes[1] = VegaAxis(_type = "x", scale = "x", title = "x")
    v.axes[1].properties = Dict{Any, Any}("title" => Dict{Any, Any}("fontSize" => Dict{Any, Any}("value" => 14)))

    v.axes[2] = VegaAxis(_type = "y", scale = "y", title = "y", titleOffset = 40)
    v.axes[2].properties = Dict{Any, Any}("title" => Dict{Any, Any}("fontSize" => Dict{Any, Any}("value" => 14)))

    return v
end