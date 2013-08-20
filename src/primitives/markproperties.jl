markproperties_type = :VegaMarkProperties

markproperties_spec =
[
	(:enter, VegaMarkPropertySet, nothing, true),
	(:exit, VegaMarkPropertySet, nothing, true),
	(:update, VegaMarkPropertySet, nothing, true),
	(:hover, VegaMarkPropertySet, nothing, true)
]

eval(maketype(markproperties_type, markproperties_spec))
eval(makekwfunc(markproperties_type, markproperties_spec))
eval(maketojs(markproperties_type, markproperties_spec))
eval(makecopy(markproperties_type, markproperties_spec))
