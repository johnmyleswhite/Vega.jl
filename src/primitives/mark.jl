mark_type = :VegaMark

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
	# (:marks, Vector{VegaMark}, nothing, true)
	(:marks, Vector, nothing, true)
]

eval(maketype(mark_type, mark_spec))
eval(makekwfunc(mark_type, mark_spec))
eval(maketojs(mark_type, mark_spec))
eval(makecopy(mark_type, mark_spec))
