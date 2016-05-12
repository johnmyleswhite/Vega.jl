streams_spec =
[
	(:_type, AbstractString, nothing),
	(:expr, AbstractString, nothing),
	(:scale, AbstractString, nothing),
	#(:predicate, AbstractString, nothing)
]

primitivefactory(:VegaStream, streams_spec)
