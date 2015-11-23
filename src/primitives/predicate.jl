predicate_spec =
[
    (:name, AbstractString, nothing),
    (:_type, AbstractString, nothing),
    (:operands, Vector, nothing),
    (:range, Vector, nothing),
    (:scale, Vector, nothing),
    (:item, Any, nothing),
]

primitivefactory(:VegaPredicate, predicate_spec)