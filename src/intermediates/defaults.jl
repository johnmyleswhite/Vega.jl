#Set default color scheme to use ColorBrewer scales
#Not all functions use default_scales, so need to set default using colorscheme!
#ordinal, time, utc,
#quantitative: linear, log, pow, sqrt, quantile, quantize, threshold
function default_scales!(v::VegaVisualization;
                        typeXaxis::AbstractString = "linear",
                        typeYaxis::AbstractString = "linear")

    v.scales = Array(VegaScale, 3)

    v.scales[1] = VegaScale(name = "x",
                            _type = typeXaxis,
                            range = "width",
                            domain = VegaDataRef("table", "x"))
    v.scales[2] = VegaScale(name = "y",
                            _type = typeYaxis,
                            range = "height",
                            domain = VegaDataRef("table", "y"))

    v.scales[3] = VegaScale(name = "group",
                            _type = "ordinal",
                            range = ColorBrewer.colorSchemes["Paired"]["12"],
                            domain = VegaDataRef("table", "group"))
    return v
end

function default_axes!(v::VegaVisualization)

    v.axes = Array(VegaAxis, 2)

    v.axes[1] = VegaAxis(_type = "x", scale = "x", title = "x",
                            properties = Dict{Any, Any}("title" => Dict{Any, Any}("fontSize" => Dict{Any, Any}("value" => 14))))

    v.axes[2] = VegaAxis(_type = "y", scale = "y", title = "y", titleOffset = 40,
                            properties = Dict{Any, Any}("title" => Dict{Any, Any}("fontSize" => Dict{Any, Any}("value" => 14))))


    return v
end