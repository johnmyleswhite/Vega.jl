# NB: This fails if "Vega Visualization" is set to `nothing`
vis_spec =
[
    (:name, String, "Vega Visualization", true),
    (:width, Int, 450, false),
    (:height, Int, 450, false),
    (:padding, Union(VegaPadding, Number, String), "auto", false),
    (:viewport, Vector{Int}, nothing, true),
    (:data, Vector{VegaData}, nothing, true),
    (:scales, Vector{VegaScale}, nothing, true),
    (:axes, Vector{VegaAxis}, nothing, true),
    (:marks, Vector{VegaMark}, nothing, true),
    (:legends, Vector{VegaLegend}, nothing, true)
]

primitivefactory(:VegaVisualization, vis_spec)