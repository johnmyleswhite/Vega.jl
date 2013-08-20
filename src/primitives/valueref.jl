valueref_type = :VegaValueRef

valueref_spec =
[
	(:value, Any, nothing, true),
	(:field, String, nothing, true),
	(:group, Union(String, Bool), nothing, true),
	(:scale, String, nothing, true),
	(:mult, Number, nothing, true),
	(:offset, Number, nothing, true),
	(:band, Bool, nothing, true)
]

eval(maketype(valueref_type, valueref_spec))
eval(makekwfunc(valueref_type, valueref_spec))
eval(maketojs(valueref_type, valueref_spec))
eval(makecopy(valueref_type, valueref_spec))
