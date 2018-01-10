function histogram(; x::AbstractVector = Int[],
                    relativefreq::Bool = false,
                    horizontal::Bool = false,
                    nbins::Int = 10,
                    bandwidth::Real=0.0)

    if bandwidth == 0.0
        #a, b = hist(x, nbins)
        bbb = fit(Histogram, x, nbins = nbins, closed=:left)
        a = bbb.edges[1]
        b = bbb.weights
        bandwidth= float(a.step)/(a.len - 1) #RZ: guessing here, incompatbility from hist from base and StatsBase
    elseif bandwidth < 0.0
		error("bandwidth should be a positive number but got $(bandwidth)")
	else
        xmin, xmax = extrema(x)
        #a, b = hist(x, xmin:bandwidth:xmax)
        bbb = fit(Histogram, x, xmin:bandwidth:xmax)
        a = bbb.edges[1]
        b = bbb.weights
    end
    total = relativefreq ? sum(b)*bandwidth : 1

    #v = barplot(x = a[2:end], y = b/total)
    v = VegaVisualization()
    add_data!(v, x = a[1:end-1], x2=a[2:end], y = b/Float64(total), y2=zeros(length(b)))
    default_scales!(v; typeXaxis = "linear")
    default_axes!(v)

    #Get unique table name
    table = v.data[1].name

    #old add_rects code
    res = VegaMark(_type = "rect",
        from = VegaMarkFrom(data=table),
        properties = VegaMarkProperties(enter =
            VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "x"),
                y = VegaValueRef(scale = "y", field = "y"))))

    v.marks == nothing? v.marks = [res] : push!(v.marks, res)
    #end add_rects code

    v.marks[1].properties.enter.x2 = VegaValueRef(scale = "x", field = "x2")
    v.marks[1].properties.enter.y = VegaValueRef(scale = "y", field = "y")
    v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", field = "y2")
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group",
        field = "group")
    v.marks[1].properties.enter.stroke = VegaValueRef(value="black")
    v.marks[1].properties.enter.strokeWidth = VegaValueRef(value=0.25)

    v.axes[findfirst([z._type == "x" for z in v.axes])].title = "x"
    v.axes[findfirst([z._type == "y" for z in v.axes])].title =
        relativefreq ? "density" : "counts"


    #Return horizontal bar chart
    if horizontal
        #Switch scales
        v.scales[findfirst([z.name == "x" for z in v.scales])].range = "height"
        v.scales[findfirst([z.name == "y" for z in v.scales])].range = "width"

        #Switch data
        v.marks[1].properties.enter.x = VegaValueRef(scale = "y", field = "y2")
        v.marks[1].properties.enter.x2 = VegaValueRef(scale = "y", field = "y")
        v.marks[1].properties.enter.y = VegaValueRef(scale = "x", field = "x")
        v.marks[1].properties.enter.y2 = VegaValueRef(scale = "x", field = "x2")

        #Switch axes and title names
        v.axes[findfirst([z._type == "x" for z in v.axes])].scale = "y"
        v.axes[findfirst([z._type == "x" for z in v.axes])].title =
            relativefreq ? "density" : "counts"
        v.axes[findfirst([z._type == "y" for z in v.axes])].scale = "x"
        v.axes[findfirst([z._type == "y" for z in v.axes])].title = "x"

    end

    return v

end
