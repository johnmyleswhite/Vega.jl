mark_spec =
[
	(:_type, AbstractString, "symbol"),
	(:name, AbstractString, nothing),
	(:description, AbstractString, nothing),
	(:from, VegaMarkFrom, nothing),
	(:properties, VegaMarkProperties, nothing),
	(:key, AbstractString, nothing),
	(:delay, VegaValueRef, nothing),
	(:ease, AbstractString, nothing),
	(:marks, Vector, nothing),
	(:scales, Vector{VegaScale}, nothing),
	(:axes, Vector{VegaAxis}, nothing)

]

primitivefactory(:VegaMark, mark_spec)