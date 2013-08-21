function default_scales!(v::VegaVisualization)
    v.scales = Array(VegaScale, 3)

    v.scales[1] = VegaScale(name = "x",
                            _type = "linear",
                            range = "width",
                            domain = VegaDataRef("table", "data.x"))
    v.scales[2] = VegaScale(name = "y",
                            _type = "linear",
                            range = "height",
                            domain = VegaDataRef("table", "data.y"))
    v.scales[3] = VegaScale(name = "group",
                            _type = "ordinal",
                            range = "category10",
                            domain = VegaDataRef("table", "data.group"))

    return v
end

function default_axes!(v::VegaVisualization)
    v.axes = Array(VegaAxis, 2)

    v.axes[1] = VegaAxis(_type = "x", scale = "x", title = "x")
    v.axes[1].properties = {"title" => {"fontSize" => {"value" => 14}}}
    v.axes[2] = VegaAxis(_type = "y", scale = "y", title = "y")
    v.axes[2].properties = {"title" => {"fontSize" => {"value" => 14}}}

    return v
end

function default_legend!(v::VegaVisualization)
    v.legends = Array(VegaLegend, 1)
    v.legends[1] = VegaLegend(fill = "group", title = "Group")
    return v
end
