scale_spec =
[
	(:name, String, "x", false),
	(:_type, String, nothing, true),
	(:domain, Union(Vector, VegaDataRef), nothing, true),
	(:domainMin, Union(Number, VegaDataRef), nothing, true),
	(:domainMax, Union(Number, VegaDataRef), nothing, true),
	(:range, Union(Vector, String), nothing, true),
	(:rangeMin, Any, nothing, true),
	(:rangeMax, Any, nothing, true),
	(:reverse, Union(Bool, VegaDataRef), nothing, true),
	(:round, Bool, nothing, true),
	(:points, Bool, nothing, true),
	(:padding, Number, nothing, true),
	(:sort, Bool, nothing, true),
	(:clamp, Bool, nothing, true),
	(:nice, Bool, nothing, true),
	(:exponent, Number, nothing, true),
	(:zero, Bool, nothing, true)
]

primitivefactory(:VegaScale, scale_spec)

isordinal(x::VegaScale) = x._type == :ordinal
