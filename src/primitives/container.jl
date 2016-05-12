container_spec =
[
    (:scene, Vector{VegaScene}, nothing),
    (:scales, Vector{VegaScale}, nothing),
    (:axes, Vector{VegaAxis}, nothing),
    (:legends, Vector{VegaLegend}, nothing),
    (:marks, Vector{VegaMark}, nothing),
]

primitivefactory(:VegaContainer, container_spec)
