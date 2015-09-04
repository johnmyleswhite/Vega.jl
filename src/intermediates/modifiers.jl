@compat function xlab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "x" for z in v.scales])]
	a.title = title
	return v
end

@compat function ylab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "y" for z in v.scales])]
	a.title = title
	return v
end

@compat function xlim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "x" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return v
end

@compat function ylim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "y" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return v
end

@compat function title!(v::VegaVisualization, title::String)
	titlemark = VegaMark(_type = "text", from = VegaMarkFrom(value = title))
    enterprops = VegaMarkPropertySet(x = VegaValueRef(value = v.width / 2),
                                     y = VegaValueRef(value = -50),
                                     text = VegaValueRef(value = title),
                                     fill = VegaValueRef(value = "black"),
                                     fontSize = VegaValueRef(value = 12))
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

    return v
end

@compat function legend!(v::VegaVisualization, title::String = "")
	v.legends[1].title = title
	return v
end

@compat function showlegend!(v::VegaVisualization)
	default_legend!(v)
	return v
end

@compat function hidelegend!(v)
	empty!(v.legends)
	return v
end

#Use ColorBrewer.jl scales
@compat function colorscheme!(v::VegaVisualization, palette::Union(Tuple{AbstractString,Int64}, AbstractString, Array))

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

@compat function stroke!(v::VegaVisualization; color::String = "Black", width::Real = 0.75, opacity::Real = 1, visible::Bool = true)

    if typeof(v.marks[1].marks) in (Nothing, Void)
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
