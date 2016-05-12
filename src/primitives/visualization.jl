# NB: This fails if "Vega Visualization" is set to `nothing`
vis_spec =
[
    (:name, AbstractString, "Vega Visualization"),
    (:width, Int, 450),
    (:height, Int, 450),
    (:padding, Union{VegaPadding, Number, AbstractString}, "auto"),
    (:viewport, Vector{Int}, nothing),
    (:background, AbstractString, nothing),
    (:data, Vector{VegaData}, nothing),
    (:scales, Vector{VegaScale}, nothing),
    (:axes, Vector{VegaAxis}, nothing),
    (:marks, Vector{VegaMark}, nothing),
    (:legends, Vector{VegaLegend}, nothing),
    (:signals, Vector{Dict{Any, Any}}, nothing),
    (:predicates, Vector{Dict{Any, Any}}, nothing),
    (:modify, Vector{Dict{Any, Any}}, nothing)
]

primitivefactory(:VegaVisualization, vis_spec)
