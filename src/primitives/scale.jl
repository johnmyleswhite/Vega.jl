scale_spec =
[
	(:name, AbstractString, "x"),
	(:_type, AbstractString, "linear"),
	(:domain, Union{Vector, VegaDataRef}, nothing),
	(:domainMin, Union{Number, VegaDataRef, VegaSignal}, nothing),
	(:domainMax, Union{Number, VegaDataRef, VegaSignal}, nothing),
	(:range, Union{Vector, AbstractString, VegaDataRef}, nothing), #TODO: What are Scale Range Literal docs trying to tell us?
	(:rangeMin, Union{Number, VegaDataRef, VegaSignal}, nothing),
	(:rangeMax, Union{Number, VegaDataRef, VegaSignal}, nothing),
	(:reverse, Union{Bool, VegaDataRef}, nothing),
	(:round, Bool, nothing),
	(:points, Bool, nothing),
	(:padding, Number, nothing),
	(:outerPadding, Number, nothing),
	(:bandWidth, Union{Number, VegaSignal}, nothing),
	(:sort, Union{Bool, Dict{Any, Any}}, nothing),  # TODO: docs say sort should be object, union with bool until we're sure
	(:clamp, Bool, nothing),
	(:nice, Union{Bool, AbstractString}, nothing), #TODO: Docs say string now, union until we know
	(:exponent, Number, nothing),
	(:zero, Bool, nothing)
]

primitivefactory(:VegaScale, scale_spec)

#isordinal(x::VegaScale) = x._type == :ordinal
