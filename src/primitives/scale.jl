scale_spec =
[
	(:name, String, "x"),
	(:_type, String, nothing),
	(:domain, Union(Vector, VegaDataRef), nothing),
	(:domainMin, Union(Number, VegaDataRef), nothing),
	(:domainMax, Union(Number, VegaDataRef), nothing),
	(:range, Union(Vector, String), nothing),
	(:rangeMin, Any, nothing),
	(:rangeMax, Any, nothing),
	(:reverse, Union(Bool, VegaDataRef), nothing),
	(:round, Bool, nothing),
	(:points, Bool, nothing),
	(:padding, Number, nothing),
	(:sort, Bool, nothing),
	(:clamp, Bool, nothing),
	(:nice, Bool, nothing),
	(:exponent, Number, nothing),
	(:zero, Bool, nothing)
]

primitivefactory(:VegaScale, scale_spec)

isordinal(x::VegaScale) = x._type == :ordinal
