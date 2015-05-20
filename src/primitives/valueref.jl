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

primitivefactory(:VegaValueRef, valueref_spec)