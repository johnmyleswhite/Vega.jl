axis_spec =
[
    (:_type, AbstractString, "x"),
    (:scale, AbstractString, "x"),
    (:orient, AbstractString, nothing),
    (:title, AbstractString, nothing),
    (:titleOffset, Number, nothing),
    (:format, AbstractString, nothing),
    (:ticks, Number, nothing),
    (:values, Vector, nothing),
    (:subdivide, Number, nothing),
    (:tickPadding, Number, nothing),
    (:tickSize, Number, nothing),
    (:tickSizeMajor, Number, nothing),
    (:tickSizeMinor, Number, nothing),
    (:tickSizeEnd, Number, nothing),
    (:offset, Union{Number, Dict{Any, Any}}, nothing),
    (:layer, AbstractString, nothing),
    (:grid, Bool, nothing),
    (:properties, Dict{Any,Any}, nothing)
]

primitivefactory(:VegaAxis, axis_spec)