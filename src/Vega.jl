module Vega

    using JSON

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, VegaJSON,
           VegaCSV, VegaTSV, VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties, VegaLegend

    export tojson, tojs #, tohtml,

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap

    export xlab!, ylab!, xlim!, ylim!, title!, legend!

    export default_scales!, default_axes!, default_legend!
    export add_data!, add_points!, add_area!, add_rects!, add_lines!
    export showlegend!, hidelegend!


    #Run to get up-to-date vega library from github
    function install()
        initial = pwd()
        cd(Pkg.dir("Vega"))
        run(`git submodule init`)
        run(`git submodule update`)
        cd(initial)
        return
    end

    #Only inject javascript if html can be displayed (i.e. Jupyter Notebook)
    if displayable("text/html")
        const d3 = Pkg.dir("Vega", "deps/vega/examples/lib/d3.v3.min.js")
        const geo = Pkg.dir("Vega", "deps/vega/examples/lib/d3.geo.projection.min.js")
        const topo = Pkg.dir("Vega", "deps/vega/examples/lib/topojson.js")
        const vega = Pkg.dir("Vega", "deps/vega/vega.js")

        display("text/html", "<script>$(readall(topo))</script>")
        display("text/html", "<script>$(readall(d3))</script>")
        display("text/html", "<script>$(readall(geo))</script>")
        display("text/html", "<script>$(readall(vega))</script>")
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

    #Create primitives from one function instead of repeating
    function primitivefactory(create::Symbol, spec::AbstractArray)
        eval(maketype(create, spec))
        eval(makekwfunc(create, spec))
        eval(maketojs(create, spec))
        eval(makecopy(create, spec))
    end

    #Import helper code
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

    include("render.jl")

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


end
