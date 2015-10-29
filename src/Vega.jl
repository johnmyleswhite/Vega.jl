VERSION >= v"0.4-" && __precompile__()

module Vega

    using JSON, ColorBrewer, Compat

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, #VegaJSON,
           #VegaCSV, VegaTSV,
           VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties, VegaLegend, VegaTransform, VegaStreamingOps, VegaMarkFrom

    export tojson, tojs

    export barplot, choropleth, lineplot, scatterplot, areaplot, heatmap, piechart,
           histogram, popchart, waterfall, wordcloud, groupedbar, rugplot, boxplot,
           bubblechart, streamplot, stemleaf

    export xlab!, ylab!, xlim!, ylim!, title!, legend!, text!

    export default_scales!, default_axes!, default_legend!
    export add_data!, add_points!, add_area!, add_rects!, add_lines!
    export colorscheme!, coord_flip!, stroke!, hline!, vline!, hover!

    #Import helper code
    include("jstypes.jl")

    # Lower-level API
    include("primitives/streamingops.jl")
    include("primitives/dataref.jl")
    include("primitives/valueref.jl")
    include("primitives/padding.jl")
    include("primitives/axis.jl")
    include("primitives/format.jl")
    include("primitives/transform.jl")
    include("primitives/data.jl")
    include("primitives/markpropertyset.jl")
    include("primitives/markproperties.jl")
    include("primitives/markfrom.jl")
    include("primitives/scale.jl")
    include("primitives/mark.jl")
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
    include("derived/choropleth.jl")
    include("derived/barplot.jl")
    include("derived/bubblechart.jl")
    include("derived/boxplot.jl")
    include("derived/groupedbar.jl")
    include("derived/lineplot.jl")
    include("derived/scatterplot.jl")
    include("derived/areaplot.jl")
    include("derived/heatmap.jl")
    include("derived/piechart.jl")
    include("derived/histogram.jl")
    include("derived/popchart.jl")
    include("derived/rugplot.jl")
    include("derived/stemleaf.jl")
    include("derived/streamplot.jl")
    include("derived/waterfall.jl")
    include("derived/wordcloud.jl")

    if Pkg.installed("Escher") != nothing
        include("escher_integration.jl")
    end



end
