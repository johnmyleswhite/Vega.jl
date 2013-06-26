type VegaAxis
    # The type of axis. Can be :x or :y
    # NB: Called "type" by Vega
    axistype::Symbol

    # The name of the scale backing the axis component
    scale::Symbol

    # The orientation of the axis
    # One of :top, :bottom, :left or :right
    # The orientation can be used to further specialize the axis type
    # (e.g., a y axis oriented for the right edge of the chart)
    orient::Symbol

    # The formatting pattern for axis labels
    # Vega uses D3's format pattern
    format::String

    # A desired number of ticks
    #  The resulting number may be different so that values are "nice"
    #  (multiples of 2, 5, 10) and lie within the underlying scale's range
    ticks::Int

    # Explicitly set the visible axis tick values
    values::Vector

    # If provided, sets the number of minor ticks between major ticks
    #  (the value 9 results in decimal subdivision)
    subdivide::Int

    # The padding, in pixels, between ticks and text labels
    tickPadding::Int

    # The size, in pixels, of major, minor and end ticks
    tickSize::Int

    # The size, in pixels, of major ticks
    tickSizeMajor::Int

    # The size, in pixels, of minor ticks
    tickSizeMinor::Int

    # The size, in pixels, of end ticks
    tickSizeEnd::Int

    # The offset, in pixels, by which to displace the axis from the
    #  edge of the enclosing group or data rectangle
    offset::Int

    # Optional mark property definitions for custom axis styling
    # The input object can include sub-objects for ticks (both major and minor),
    #  majorTicks, minorTicks, labels and axis (for the axis line)
    properties::Dict{Any, Any}

    function VegaAxis(axistype::Symbol,
                      scale::Symbol,
                      orient::Symbol,
                      format::String,
                      ticks::Int,
                      values::Vector,
                      subdivide::Int,
                      tickPadding::Int,
                      tickSize::Int,
                      tickSizeMajor::Int,
                      tickSizeMinor::Int,
                      tickSizeEnd::Int,
                      offset::Int,
                      properties::Dict{Any, Any})
        if !contains([:x, :y], axistype)
            error("axistype must be :x or :y")
        end
        if !contains([:top, :bottom, :left, :right, :null], orient)
            error("orient must be one of :top, :bottom, :left, :right or :null")
        end
        new(axistype, scale, orient, format,
            ticks, values, subdivide,
            tickPadding, tickSize, tickSizeMajor, tickSizeMinor,
            tickSizeEnd, offset, properties)
    end
end

function VegaAxis(;axistype::Symbol = :x,
                   scale::Symbol = :null,
                   orient::Symbol = :null,
                   format::String = "null",
                   ticks::Int = -1,
                   values::Vector = UTF8String[],
                   subdivide::Int = -1,
                   tickPadding::Int = -1,
                   tickSize::Int = -1,
                   tickSizeMajor::Int = -1,
                   tickSizeMinor::Int = -1,
                   tickSizeEnd::Int = -1,
                   offset::Int = -1,
                   properties::Dict = Dict())
    VegaAxis(axistype,
             scale,
             orient,
             format,
             ticks,
             values,
             subdivide,
             tickPadding,
             tickSize,
             tickSizeMajor,
             tickSizeMinor,
             tickSizeEnd,
             offset,
             properties)
end

function tojs(x::VegaAxis)
    res = Dict()
    res["type"] = string(x.axistype)
    res["scale"] = string(x.scale)
    if x.orient != :null
        res["orient"] = string(x.orient)
    end
    if x.format != "null"
        res["format"] = x.format
    end
    if x.ticks != -1
        res["ticks"] = x.ticks
    end
    if !isempty(x.values)
        res["values"] = x.values
    end
    if x.subdivide != -1
        res["subdivide"] = x.subdivide
    end
    if x.tickPadding != -1
        res["tickPadding"] = x.tickPadding
    end
    if x.tickSize != -1
        res["tickSize"] = x.tickSize
    end
    if x.tickSizeMajor != -1
        res["tickSizeMajor"] = x.tickSizeMajor
    end
    if x.tickSizeMinor != -1
        res["tickSizeMinor"] = x.tickSizeMinor
    end
    if x.tickSizeEnd != -1
        res["tickSizeEnd"] = x.tickSizeEnd
    end
    if x.offset != -1
        res["offset"] = x.offset
    end
    if !isempty(x.properties)
        res["properties"] = x.properties
    end
    return res
end
