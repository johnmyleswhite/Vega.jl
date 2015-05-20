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

primitivefactory(:VegaLegend, legend_spec)
