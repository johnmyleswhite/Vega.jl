legend_spec =
[
	(:size, String, nothing),
	(:shape, String, nothing),
	(:fill, String, nothing),
	(:stroke, String, nothing),
	(:orient, String, nothing),
	(:title, String, nothing),
	(:format, String, nothing),
	(:values, Vector{Any}, nothing),
	(:properties, VegaMarkProperties, nothing)
]

primitivefactory(:VegaLegend, legend_spec)
