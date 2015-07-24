valueref_spec =
[
    # TODO: field can also be an `Object` (`Dict{Any,Any}`)
    # TODO: scale can also be an `Object` (`Dict{Any,Any}`)
	(:value, Any, nothing),
	(:field, Union(String, Dict{Any,Any}), nothing),
	(:group, Union(String, Bool), nothing),
	(:scale, String, nothing),
	(:mult, Number, nothing),
	(:offset, Number, nothing),
	(:band, Bool, nothing)
]

primitivefactory(:VegaValueRef, valueref_spec)
