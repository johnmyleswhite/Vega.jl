valueref_spec =
[
	(:value, Any, nothing),
	(:field, Union{AbstractString, Dict{Any,Any}}, nothing),
	(:group, Union{AbstractString, Bool}, nothing),
	(:scale, Union{AbstractString, Dict{Any,Any}}, nothing),
	(:mult, Number, nothing),
	(:offset, Number, nothing),
	(:band, Bool, nothing),
	(:signal, AbstractString, nothing)
]

primitivefactory(:VegaValueRef, valueref_spec)
