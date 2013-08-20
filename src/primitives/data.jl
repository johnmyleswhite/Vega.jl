data_type = :VegaData

data_spec =
[
	(:name, String, "table", false),
	(:format, VegaFormat, nothing, true),
	(:values, Vector, nothing, true), # Vector{Dict}
	(:source, String, nothing, true),
	(:url, String, nothing, true),
	(:transform, Vector{VegaTransform}, nothing, true)
]

eval(maketype(data_type, data_spec))
eval(makekwfunc(data_type, data_spec))
eval(maketojs(data_type, data_spec))
eval(makecopy(data_type, data_spec))
