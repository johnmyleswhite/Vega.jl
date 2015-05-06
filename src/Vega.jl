module Vega
    using JSON

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, VegaJSON,
           VegaCSV, VegaTSV, VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties, VegaLegend

    export vg

    export tojson, tohtml

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap

    export xlab!, ylab!, xlim!, ylim!, title!, legend!, showlegend!

    export default_scales!, default_axes!, default_legend!
    export add_data!, add_points!, add_area!, add_rects!, add_lines!
    export showlegend!, hidelegend!


    function install()
        initial = pwd()
        cd(Pkg.dir("Vega"))
        run(`git submodule init`)
        run(`git submodule update`)
        cd(initial)
        return
    end

    # tojson(x::Any) = JSON.json(Vega.tojs(x))

    Base.copy(x::Nothing) = nothing

    # TODO: Move this elsewhere
    function makevalues(x::Vector, y::Vector, group::Vector)
        n = length(x)
        res = Array(Dict{Any, Any}, n)
        if isempty(group)
            group = ones(Int, n)
        end
        for i in 1:n
            res[i] = Dict{Any, Any}()
            res[i]["x"] = x[i]
            res[i]["y"] = y[i]
            res[i]["group"] = group[i]
        end
        return res
    end

    # Open a URL in a browser
    function openurl(url::String)
        @osx_only     run(`open $url`)
        @windows_only run(`start $url`)
        @linux_only   run(`xdg-open $url`)
    end

    tojson(x::Any) = JSON.json(tojs(x))

    #Import JSTypes code
    include("jstypes.jl")

    # Lower-level API
    include("primitives/dataref.jl")
    include("primitives/valueref.jl")
    include("primitives/padding.jl")
    include("primitives/axis.jl")
    include("primitives/format.jl")
    include("primitives/transform.jl")
    include("primitives/data.jl")
    include("primitives/markpropertyset.jl")
    include("primitives/markproperties.jl")
    include("primitives/mark.jl")
    include("primitives/scale.jl")
    include("primitives/legend.jl")
    include("primitives/visualization.jl")

    # Intermediates
    include("intermediates/modifiers.jl")
    include("intermediates/defaults.jl")
    include("intermediates/data.jl")
    include("intermediates/points.jl")
    include("intermediates/props.jl")
    include("intermediates/area.jl")
    include("intermediates/lines.jl")
    include("intermediates/rects.jl")

    # Higher-level API
    include("derived/plot.jl")
    include("derived/barplot.jl")
    include("derived/lineplot.jl")
    include("derived/scatterplot.jl")
    include("derived/areaplot.jl")
    include("derived/heatmap.jl")

    # Output formats -- require Node.js
    # function tosvg(v::VegaVisualization)
    #   jsonpath = tempname()
    #   io = open(jsonpath, "w")
    #   print(io, tojson(v))
    #   close(io)
    #   exe = Pkg.dir("Vega", "deps/vega/bin/vg2svg")
    #   run(`$exe $jsonpath output.svg`)
    #   return
    # end
    # function topng(v::VegaVisualization)
    #   jsonpath = tempname()
    #   io = open(jsonpath, "w")
    #   print(io, tojson(v))
    #   close(io)
    #   exe = Pkg.dir("Vega", "deps/vega/bin/vg2png")
    #   run(`$exe $jsonpath output.svg`)
    #   return
    # end
end
