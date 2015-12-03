dataref_spec =
[
	(:data, AbstractString, ""),
	(:field, Union{AbstractString, Vector, Dict{Any,Any}}, ""),
	(:sort, Union{Bool, Dict{Any,Any}}, nothing)
]

primitivefactory(:VegaDataRef, dataref_spec)