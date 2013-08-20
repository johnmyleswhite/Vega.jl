legend_type = :VegaLegend

legend_spec =
[
	(:size, String, nothing, true),
	(:shape, String, nothing, true),
	(:fill, String, nothing, true),
	(:stroke, String, nothing, true),
	(:orient, String, nothing, true),
	(:title, String, nothing, true),
	(:format, String, nothing, true),
	(:values, Array, nothing, true),
	(:properties, VegaMarkProperties, nothing, true)
]

eval(maketype(legend_type, legend_spec))
eval(makekwfunc(legend_type, legend_spec))
eval(maketojs(legend_type, legend_spec))
eval(makecopy(legend_type, legend_spec))
