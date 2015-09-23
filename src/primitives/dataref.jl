dataref_spec =
[
	(:data, AbstractString, ""),
	(:field, Union{AbstractString, Vector{Any}, Dict{Any,Any}}, "") #TODO: Figure this out
]

primitivefactory(:VegaDataRef, dataref_spec)