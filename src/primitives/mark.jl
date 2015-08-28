mark_spec =
[
	(:_type, String, "symbol"),
	(:name, String, nothing),
	(:description, String, nothing),
	(:from, VegaMarkFrom, nothing),
	(:properties, VegaMarkProperties, nothing),
	(:key, String, nothing),
	(:delay, VegaValueRef, nothing),
	(:ease, String, nothing),
	(:marks, Vector, nothing),
	(:scales, Vector{VegaScale}, nothing),
	(:axes, Vector{VegaAxis}, nothing)

]

primitivefactory(:VegaMark, mark_spec)