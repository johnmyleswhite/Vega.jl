mark_spec =
[
	(:name, AbstractString, nothing),
	(:key, AbstractString, nothing),
	(:_type, AbstractString, "symbol"),
	(:from, VegaMarkFrom, nothing),
	(:properties, VegaMarkProperties, nothing),
	(:delay, VegaValueRef, nothing),
	(:ease, AbstractString, nothing),
	(:marks, Vector, nothing),
	(:scales, Vector{VegaScale}, nothing),
	(:axes, Vector{VegaAxis}, nothing),
	(:interactive, Bool, nothing)
]

primitivefactory(:VegaMark, mark_spec)
