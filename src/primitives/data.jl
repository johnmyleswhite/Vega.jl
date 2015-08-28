data_spec =
[
	(:name, String, "table"),
	(:format, VegaFormat, nothing),
	(:values, Union(Vector{Dict{Any, Any}}, Vector), nothing),
	(:source, String, nothing),
	(:url, String, nothing),
	(:transform, Vector{VegaTransform}, nothing),
    (:modify, Vector{VegaStreamingOps}, nothing)
]

primitivefactory(:VegaData, data_spec)
