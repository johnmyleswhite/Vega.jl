dataref_spec =
[
	(:data, String, ""),
	(:field, Union(String, Vector{Any}, Dict{Any,Any}), "") #TODO: Figure this out
]

primitivefactory(:VegaDataRef, dataref_spec)