module Vega

    using JSON

    export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
           VegaTransform, VegaVisualization, VegaFormat, VegaJSON,
           VegaCSV, VegaTSV, VegaDataRef, VegaValueRef,
           VegaMarkPropertySet, VegaMarkProperties, VegaLegend

    export tojson, tojs

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap

    export xlab!, ylab!, xlim!, ylim!, title!, legend!

    export default_scales!, default_axes!, default_legend!
    export add_data!, add_points!, add_area!, add_rects!, add_lines!
    export showlegend!, hidelegend!

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
