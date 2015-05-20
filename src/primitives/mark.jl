mark_spec =
[
	(:_type, String, "symbol", false),
	(:name, String, nothing, true),
	(:description, String, nothing, true),
	(:from, Dict{Any, Any}, nothing, true),
	(:properties, VegaMarkProperties, nothing, true),
	(:key, String, nothing, true),
	(:delay, VegaValueRef, nothing, true),
	(:ease, String, nothing, true),
	(:marks, Vector, nothing, true)
]

primitivefactory(:VegaMark, mark_spec)