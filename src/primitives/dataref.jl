dataref_spec =
[
	(:data, AbstractString, nothing),
	(:field, Union{AbstractString, Vector, Dict{Any,Any}}, nothing),
	(:fields, Union{AbstractString, Vector, Dict{Any,Any}}, nothing),
	(:sort, Union{Bool, Dict{Any,Any}}, nothing)
]

primitivefactory(:VegaDataRef, dataref_spec)