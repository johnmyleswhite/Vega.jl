scale_spec =
[
	(:name, AbstractString, "x"),
	(:_type, AbstractString, nothing),
	(:domain, Union{Vector, VegaDataRef}, nothing),
	(:domainMin, Union{Number, VegaDataRef}, nothing),
	(:domainMax, Union{Number, VegaDataRef}, nothing),
	(:range, Union{Vector, AbstractString, VegaDataRef}, nothing), #TODO: What are Scale Range Literal docs trying to tell us?
	(:rangeMin, Any, nothing),
	(:rangeMax, Any, nothing),
	(:reverse, Union{Bool, VegaDataRef}, nothing),
	(:round, Bool, nothing),
	(:points, Bool, nothing),
	(:padding, Number, nothing),
	(:sort, Union{Bool, Dict{Any, Any}}, nothing),  # TODO: docs say sort should be object, union with bool until we're sure
	(:clamp, Bool, nothing),
	(:nice, Union{Bool, AbstractString}, nothing), #TODO: Docs say string now, union until we know
	(:exponent, Number, nothing),
	(:zero, Bool, nothing)
]

primitivefactory(:VegaScale, scale_spec)

isordinal(x::VegaScale) = x._type == :ordinal
