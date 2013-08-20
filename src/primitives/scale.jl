scale_type = :VegaScale

scale_spec =
[
	(:name, String, "x", false),
	(:_type, String, "linear", false),
	(:domain, Union(Vector, VegaDataRef), nothing, true),
	(:domainMin, Union(Number, VegaDataRef), nothing, true),
	(:domainMax, Union(Number, VegaDataRef), nothing, true),
	(:range, Union(Vector, String), nothing, true),
	(:rangeMin, Any, nothing, true),
	(:rangeMax, Any, nothing, true),
	(:reverse, Bool, nothing, true),
	(:round, Bool, nothing, true),
	(:nice, Bool, nothing, true),
	(:zero, Bool, nothing, true),
	(:points, Bool, nothing, true),
	(:clamp, Bool, nothing, true),
	(:exponent, Number, nothing, true)
]

eval(maketype(scale_type, scale_spec))
eval(makekwfunc(scale_type, scale_spec))
eval(maketojs(scale_type, scale_spec))
eval(makecopy(scale_type, scale_spec))

isordinal(x::VegaScale) = x.scaletype == :ordinal
