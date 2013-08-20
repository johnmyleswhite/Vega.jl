padding_type = :VegaPadding

padding_spec =
[
	(:top, Number, 80, false),
	(:left, Number, 80, false),
	(:bottom, Number, 80, false),
	(:right, Number, 80, false)
]

eval(maketype(padding_type, padding_spec))
eval(makekwfunc(padding_type, padding_spec))
eval(maketojs(padding_type, padding_spec))
eval(makecopy(padding_type, padding_spec))
