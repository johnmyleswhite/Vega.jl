axis_spec =
[
    (:_type, AbstractString, "x"),
    (:scale, AbstractString, "x"),
    (:orient, AbstractString, nothing),
    (:title, AbstractString, nothing),
    (:titleOffset, Number, nothing),
    (:format, AbstractString, nothing),
    (:formatType, AbstractString, nothing),
    (:ticks, Number, nothing),
    (:values, Vector, nothing),
    (:subdivide, Number, nothing),
    (:tickPadding, Number, nothing),
    (:tickSize, Number, nothing),
    (:tickSizeMajor, Number, nothing),
    (:tickSizeMinor, Number, nothing),
    (:tickSizeEnd, Number, nothing),
    (:offset, Union{Number, Dict{Any, Any}}, nothing),
    (:layer, AbstractString, "front"),
    (:grid, Bool, false),
    (:properties, Union{Dict{Any,Any}, VegaMarkPropertySet}, nothing)
]

primitivefactory(:VegaAxis, axis_spec)