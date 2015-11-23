signal_spec =
[
    (:name, AbstractString, nothing),
    (:init, Any, nothing),
    (:verbose, Bool, false),
    (:expr, AbstractString, nothing),
    (:scale, Any, nothing),
    (:streams, Any, nothing),

]

primitivefactory(:VegaSignal, signal_spec)

