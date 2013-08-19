module Vega
    using JSON

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, VegaJSON,
           VegaCSV, VegaTSV, VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties

    export tojson, tohtml

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap

    function install()
        initial = pwd()
        cd(Pkg.dir("Vega"))
        run(`git submodule init`)
        run(`git submodule update`)
        cd(initial)
        return
    end

    tojson(x::Any) = JSON.json(Vega.tojs(x))

    Base.copy(x::Nothing) = nothing

    tojs(s::Symbol) = string(s)
    tojs(d::Dict) = d
    tojs(v::Vector) = v
    tojs(a::Any) = a

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

    # Lower-level API
    include("primitives/dataref.jl")
    include("primitives/valueref.jl")
    include("primitives/padding.jl")
    include("primitives/axis.jl")
    include("primitives/format.jl")
    include("primitives/transform.jl")
    include("primitives/data.jl")
    include("primitives/markproperties.jl")
    include("primitives/mark.jl")
    include("primitives/scale.jl")
    include("primitives/visualization.jl")

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
