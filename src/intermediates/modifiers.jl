@compat function xlab!(v::VegaVisualization; title::AbstractString = "", grid::Bool = false, ticks::Number = 0,
                       format::AbstractString = "", layer::AbstractString = "front")
	a = v.axes[findfirst([z.name == "x" for z in v.scales])]
	a.title = title
    a.grid = grid
    a.ticks = ticks
    a.format = format
    a.layer = layer
	return v
end

@compat function ylab!(v::VegaVisualization; title::AbstractString = "", grid::Bool = false, ticks::Number = 0,
                       format::AbstractString = "", layer::AbstractString = "front")
	a = v.axes[findfirst([z.name == "y" for z in v.scales])]
	a.title = title
    a.grid = grid
    a.ticks = ticks
    a.format = format
    a.layer = layer
	return v
end

@compat function xlim!(v::VegaVisualization; min::Real = 0, max::Real = 1000, reverse::Bool = false, round::Bool = false)

    if min > max
        error("Min must be less than Max")
    end

    s = v.scales[findfirst([z.name == "x" for z in v.scales])]
	s.domainMin = min == 0? s.domainMin : min
	s.domainMax = max == 0? s.domainMax : max
    s.reverse = reverse
    s.round = round
    min != 0? s.zero = false : s.zero = true
	return v
end

@compat function ylim!(v::VegaVisualization; min::Real = 0, max::Real = 1000, reverse::Bool = false, round::Bool = false)

    if min > max
        error("Min must be less than Max")
    end

    s = v.scales[findfirst([z.name == "y" for z in v.scales])]
	s.domainMin = min == 0? s.domainMin : min
	s.domainMax = max == 1000? s.domainMax : max
    s.reverse = reverse
    s.round = round
    min != 0? s.zero = false : s.zero = true
	return v
end

@compat function title!(v::VegaVisualization;
                        title::AbstractString = "", y::Int = -40, fill::AbstractString = "black", fontSize::Int = 16,
                        align::AbstractString = "center", baseline::AbstractString = "top", fontWeight::AbstractString = "bold",
                        font::AbstractString = "")
	titlemark = VegaMark(_type = "text", from = VegaMarkFrom(value = title))
    enterprops = VegaMarkPropertySet(x = VegaValueRef(value = v.width / 2),
                                     y = VegaValueRef(value = y),
                                     text = VegaValueRef(value = title),
                                     fill = VegaValueRef(value = fill),
                                     fontSize = VegaValueRef(value = fontSize),
                                     align = VegaValueRef(value = align),
                                     baseline = VegaValueRef(value = baseline),
                                     fontWeight = VegaValueRef(value = fontWeight),
                                     font = VegaValueRef(value = font)
                                     )
	titlemark.properties = VegaMarkProperties(enter = enterprops)
	push!(v.marks, titlemark)
	return v
end

#Works for bar and grouped bar charts, add more cases if it makes sense
@compat function coord_flip!(v::VegaVisualization)

    #Switch scales
    v.scales[findfirst([z.name == "x" for z in v.scales])].range = "height"
    v.scales[findfirst([z.name == "y" for z in v.scales])].range = "width"

    #Switch axes and title names
    v.axes[findfirst([z._type == "x" for z in v.axes])].scale = "y"
    v.axes[findfirst([z._type == "x" for z in v.axes])].title = "y"
    v.axes[findfirst([z._type == "y" for z in v.axes])].scale = "x"
    v.axes[findfirst([z._type == "y" for z in v.axes])].title = "x"

    #Change mark properties

    v.marks[1].properties.enter.y = VegaValueRef(scale = "x", field = "x")

    _offset = v.marks[1].properties.enter.width.offset
    v.marks[1].properties.enter.height = VegaValueRef(scale = "x", band = true, offset = _offset)
    v.marks[1].properties.enter.y2 = nothing

    if isempty(filter(x-> x.name == "stats", v.data))
        v.marks[1].properties.enter.x = VegaValueRef(scale = "y", field = "y")
        v.marks[1].properties.enter.x2 = VegaValueRef(scale = "y", value = 0)
    else  # stacked
        v.marks[1].properties.enter.x = VegaValueRef(scale = "y", field = "layout_start")
        v.marks[1].properties.enter.x2 = VegaValueRef(scale = "y", field = "layout_end")
    end

    #Grouped bar hack
    if v.name == "groupedbar"
        v.marks[1].marks[1].properties.enter.height = v.marks[1].marks[1].properties.enter.width
        v.marks[1].marks[1].properties.enter.width = nothing

        v.marks[1].marks[1].properties.enter.x2 = v.marks[1].marks[1].properties.enter.y2
        v.marks[1].marks[1].properties.enter.y2 = nothing

        v.marks[1].marks[1].properties.enter.y, v.marks[1].marks[1].properties.enter.x = v.marks[1].marks[1].properties.enter.x, v.marks[1].marks[1].properties.enter.y

        v.marks[1].properties.enter.width = nothing
        v.marks[1].properties.enter.x = nothing
        v.marks[1].properties.enter.x2 = nothing
        v.marks[1].properties.enter.y = VegaValueRef(scale = "x", field = "key")
        v.marks[1].scales[1].range = "height"
    end

    return v
end

@compat function legend!(v::VegaVisualization; title::AbstractString="Group", show::Bool=true)

    if show == true
        default_legend!(v)
        v.legends[1].title = title
    else
        empty!(v.legends)
    end

    return v
end

#Use ColorBrewer.jl scales
@compat function colorscheme!(v::VegaVisualization; palette::Union{Tuple{AbstractString,Int64}, AbstractString, Array} = "ordinal10")

    #See if group or color key exists
    i = findfirst([z.name == "group" for z in v.scales])
    i = i > 0? i: findfirst([z.name == "color" for z in v.scales])

    #Copy scales property
    s = v.scales[i]

    #colorscheme, single color or array of arbitrary string colors
    if isa(palette, Tuple)
        s.range = ColorBrewer.colorSchemes[palette[1]]["$(palette[2])"]
    elseif isa(palette, AbstractString)
        s.range = [palette]
    elseif isa(palette, Array)
        s.range = palette
    end

    return v

end

@compat function stroke!(v::VegaVisualization; color::AbstractString = "Black", width::Real = 0.75, opacity::Real = 1, visible::Bool = true)

    if typeof(v.marks[1].marks) == Void
        if visible
            v.marks[1].properties.enter.stroke = VegaValueRef(value = color)
            v.marks[1].properties.enter.strokeWidth = VegaValueRef(value = width)
            v.marks[1].properties.enter.strokeOpacity = VegaValueRef(value = opacity)
        else
            v.marks[1].properties.enter.stroke = nothing
            v.marks[1].properties.enter.strokeWidth = nothing
            v.marks[1].properties.enter.strokeOpacity = nothing
        end
    #Group Marks
    else
        if visible
            v.marks[1].marks[1].properties.enter.stroke = VegaValueRef(value = color)
            v.marks[1].marks[1].properties.enter.strokeWidth = VegaValueRef(value = width)
            v.marks[1].marks[1].properties.enter.strokeOpacity = VegaValueRef(value = opacity)
        else
            v.marks[1].marks[1].properties.enter.stroke = nothing
            v.marks[1].marks[1].properties.enter.strokeWidth = nothing
            v.marks[1].marks[1].properties.enter.strokeOpacity = nothing
        end
    end

    return v
end


@compat function hline!(v::VegaVisualization; value::Real = 0, strokeWidth::Real = 1.5, stroke::AbstractString = "#000", strokeDash::Real = 0)
    line = VegaMark(_type = "rule",
                    properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(field = Dict{Any, Any}("group" => "x")),
                                                                                x2 = VegaValueRef(field = Dict{Any, Any}("group" => "width")),
                                                                                y = VegaValueRef(scale = "y", value = value),
                                                                                strokeWidth = VegaValueRef(value = strokeWidth),
                                                                                stroke = VegaValueRef(value = stroke),
                                                                                strokeDash = VegaValueRef(value = strokeDash != 0? [strokeDash] : [])
                                                                                )
                                )
                    )

    push!(v.marks, line)

    return v
end

@compat function vline!(v::VegaVisualization; value::Real = 0, strokeWidth::Real = 1.5, stroke::AbstractString = "#000", strokeDash::Real = 0)
    line = VegaMark(_type = "rule",
                    properties = VegaMarkProperties(enter = VegaMarkPropertySet(y = VegaValueRef(field = Dict{Any, Any}("group" => "y")),
                                                                                y2 = VegaValueRef(field = Dict{Any, Any}("group" => "height")),
                                                                                x = VegaValueRef(scale = "x", value = value),
                                                                                strokeWidth = VegaValueRef(value = strokeWidth),
                                                                                stroke = VegaValueRef(value = stroke),
                                                                                strokeDash = VegaValueRef(value = strokeDash != 0? [strokeDash] : [])
                                                                                )
                                )
                    )

    push!(v.marks, line)

    return v
end
