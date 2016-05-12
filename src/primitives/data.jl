data_spec =
[
	(:name, AbstractString, "table"),
	(:format, VegaFormat, nothing),
	(:values, Union{Vector{Dict{Any, Any}}, Vector}, nothing),
	(:source, AbstractString, nothing),
	(:url, AbstractString, nothing),
	(:transform, Vector{VegaTransform}, nothing),
  (:modify, Vector{VegaStream}, nothing)
]

primitivefactory(:VegaData, data_spec)
