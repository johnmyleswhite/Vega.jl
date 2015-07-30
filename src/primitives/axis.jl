axis_spec =
[
    (:_type, String, "x"),
    (:scale, String, "x"),
    (:orient, String, nothing),
    (:title, String, nothing),
    (:titleOffset, Number, nothing),
    (:format, String, nothing),
    (:ticks, Number, nothing),
    (:values, Vector, nothing),
    (:subdivide, Number, nothing),
    (:tickPadding, Number, nothing),
    (:tickSize, Number, nothing),
    (:tickSizeMajor, Number, nothing),
    (:tickSizeMinor, Number, nothing),
    (:tickSizeEnd, Number, nothing),
    (:offset, Union(Number, Dict{Any, Any}), nothing),
    (:layer, String, nothing),
    (:grid, Bool, nothing),
    (:properties, Dict{Any,Any}, nothing)
]

primitivefactory(:VegaAxis, axis_spec)