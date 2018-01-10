__precompile__()

module Vega

    using JSON, ColorBrewer, KernelDensity, NoveltyColors, StatsBase, Parameters, Missings
    import Base: print, show

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, VegaScene,
           VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties, VegaLegend, VegaStream, VegaMarkFrom, VegaPredicate

    export tojs, print

    export barplot, choropleth, lineplot, scatterplot, areaplot, heatmap, piechart,
           histogram, popchart, waterfall, wordcloud, groupedbar, rugplot, boxplot,
           bubblechart, streamplot, stemleaf, asterplot, jointplot, dotplot, ribbonplot,
           horizon, punchcard

    export xlab!, ylab!, xlim!, ylim!, title!, legend!, text!

    export default_scales!, default_axes!, add_data!
    export colorscheme!, coord_flip!, stroke!, hline!, vline!, hover!, jitter!, layer

    #Create base color library
    colorpalettes = merge(ColorBrewer.colorSchemes, NoveltyColors.ColorDict)

    #Import helper code
    include("primitives/definetypes.jl")
    include("primitives/tojs.jl")
    include("render.jl")

    # Intermediates
    include("intermediates/modifiers.jl")
    include("intermediates/defaults.jl")
    include("intermediates/add_data.jl")
    include("intermediates/xlab_ylab.jl")
    include("intermediates/xlim_ylim.jl")
    include("intermediates/title_text.jl")
    include("intermediates/hline_vline.jl")
    include("intermediates/layer.jl")

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
    include("derived/ribbonplot.jl")
    include("derived/rugplot.jl")
    include("derived/stemleaf.jl")
    include("derived/streamplot.jl")
    include("derived/waterfall.jl")
    include("derived/wordcloud.jl")
    include("derived/asterplot.jl")
    include("derived/jointplot.jl")
    include("derived/dotplot.jl")
    include("derived/horizon.jl")
    include("derived/punchcard.jl")

end
