legend_spec =
[
	(:size, AbstractString, nothing),
	(:shape, AbstractString, nothing),
	(:fill, AbstractString, nothing),
	(:stroke, AbstractString, nothing),
	(:orient, AbstractString, nothing),
	(:offset, Number, nothing),
	(:title, AbstractString, nothing),
	(:format, AbstractString, nothing),
	(:formatType, AbstractString, nothing),
	(:values, Vector, nothing),
	(:properties, Union{Dict{Any, Any}, VegaMarkPropertySet}, nothing)
]

primitivefactory(:VegaLegend, legend_spec)
