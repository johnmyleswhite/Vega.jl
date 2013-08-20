function xlab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "x" for z in v.scales])]
	a.title = title
	return
end

function ylab!(v::VegaVisualization, title::String)
	a = v.axes[findfirst([z.name == "y" for z in v.scales])]
	a.title = title
	return
end

function xlim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "x" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return
end

function ylim!(v::VegaVisualization, min::Real, max::Real)
	s = v.scales[findfirst([z.name == "y" for z in v.scales])]
	s.domainMin = min
	s.domainMax = max
	return
end

function title!(v::VegaVisualization, title::String)
	titlemark = VegaMark()
	titlemark.type = "text"
	titlemark.from = {"value" => title}
    enterprops = VegaMarkPropertySet(x = VegaValueRef(value = v.width / 2),
                                     y = VegaValueRef(value = 0),
                                     text = VegaValueRef(value = title))
	titlemark.properties = VegaMarkProperties(enter = enterprops)
	push!(v.marks, titlemark)
end
