legend_spec =
[
	(:size, AbstractString, nothing),
	(:shape, AbstractString, nothing),
	(:fill, AbstractString, nothing),
	(:stroke, AbstractString, nothing),
	(:orient, AbstractString, nothing),
	(:title, AbstractString, nothing),
	(:format, AbstractString, nothing),
	(:values, Vector, nothing),
	(:properties, VegaMarkProperties, nothing)
]

primitivefactory(:VegaLegend, legend_spec)
