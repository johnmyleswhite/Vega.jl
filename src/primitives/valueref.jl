valueref_spec =
[
	(:value, Any, nothing),
	(:field, String, nothing),
	(:group, Union(String, Bool), nothing),
	(:scale, String, nothing),
	(:mult, Number, nothing),
	(:offset, Number, nothing),
	(:band, Bool, nothing)
]

primitivefactory(:VegaValueRef, valueref_spec)