markfrom_spec =
[
    (:data, AbstractString, nothing),
    (:transform, Vector{VegaTransform}, nothing),
    (:value, AbstractString, nothing)
]

primitivefactory(:VegaMarkFrom, markfrom_spec)
