format_spec =
[
    (:_type, AbstractString, nothing),
    (:parse, Dict{Any, Any}, nothing),
    (:property, AbstractString, nothing),
    (:feature, AbstractString, nothing),
    (:mesh, AbstractString, nothing),
    (:children, Dict{Any, Any}, nothing)
]

primitivefactory(:VegaFormat, format_spec)