dataref_type = :VegaDataRef

dataref_spec =
[
	(:data, String, "", false),
	(:field, String, "", false)
]

eval(maketype(dataref_type, dataref_spec))
eval(makekwfunc(dataref_type, dataref_spec))
eval(maketojs(dataref_type, dataref_spec))
eval(makecopy(dataref_type, dataref_spec))
