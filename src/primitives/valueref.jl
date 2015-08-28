valueref_spec =
[
	(:value, Any, nothing),
	(:field, Union(String, Dict{Any,Any}), nothing), 
	(:group, Union(String, Bool), nothing),
	(:scale, Union(String, Dict{Any,Any}), nothing),
	(:mult, Number, nothing),
	(:offset, Number, nothing),
	(:band, Bool, nothing)
]

primitivefactory(:VegaValueRef, valueref_spec)
