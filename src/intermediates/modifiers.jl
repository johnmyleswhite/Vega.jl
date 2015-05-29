function xlab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "x" for z in v.scales])]
	a.title = title
	return v
end

function ylab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "y" for z in v.scales])]
	a.title = title
	return v
end

function xlim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "x" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return v
end

function ylim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "y" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return v
end

function title!(v::VegaVisualization, title::String)
	titlemark = VegaMark()
	titlemark.type = "text"
	titlemark.from = Dict{Any, Any}("value" => title)
    enterprops = VegaMarkPropertySet(x = VegaValueRef(value = v.width / 2),
                                     y = VegaValueRef(value = 0),
                                     text = VegaValueRef(value = title))
	titlemark.properties = VegaMarkProperties(enter = enterprops)
	push!(v.marks, titlemark)
	return v
end

function title!(v::VegaVisualization, title::String)
	titlemark = VegaMark(_type = "text", from = Dict{Any, Any}("value" => title))
    enterprops = VegaMarkPropertySet(x = VegaValueRef(value = v.width / 2),
                                     y = VegaValueRef(value = -50),
                                     text = VegaValueRef(value = title),
                                     fill = VegaValueRef(value = "black"),
                                     fontSize = VegaValueRef(value = 12))
	titlemark.properties = VegaMarkProperties(enter = enterprops)
	push!(v.marks, titlemark)
	return v
end

# # TODO: Make this work
# function coord_flip!(v::VegaVisualization)
# 	v.axes[1]._type = "y"
# 	v.axes[1].orient = "left"
# 	v.axes[2]._type = "x"
# 	v.axes[2].orient = "bottom"
# 	return v
# end

function legend!(v::VegaVisualization, title::String = "")
	v.legends[1].title = title
	return v
end

function showlegend!(v::VegaVisualization)
	default_legend!(v)
	return v
end

function hidelegend!(v)
	empty!(v.legends)
	return v
end

#Use ColorBrewer.jl scales
function colorscheme!(v::VegaVisualization, palette::Union(Tuple{AbstractString,Int64}, AbstractString, Array))

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