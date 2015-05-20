data_spec =
[
	(:name, String, "table", false),
	(:format, VegaFormat, nothing, true),
	(:values, Vector{Dict{Any, Any}}, nothing, true),
	(:source, String, nothing, true),
	(:url, String, nothing, true),
	(:transform, Vector{VegaTransform}, nothing, true)
]

primitivefactory(:VegaData, data_spec)