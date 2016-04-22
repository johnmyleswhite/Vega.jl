#Works for bar and grouped bar charts, add more cases if it makes sense
function coord_flip!(v::VegaVisualization)

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

function legend!(v::VegaVisualization; title::AbstractString="Group", show::Bool=true)

    show == true? v.legends = [VegaLegend(fill = "group", title = title)] : empty!(v.legends)
    return v

end

#Use ColorBrewer.jl scales
function colorscheme!(v::VegaVisualization; palette::Union{Tuple{AbstractString,Any}, AbstractString, Array} = "ordinal10", reversePalette::Bool = false)

    #See if group or color key exists
    i = findfirst([z.name == "group" for z in v.scales])
    i = i > 0? i: findfirst([z.name == "color" for z in v.scales]) #Was choropleth hack, standardized scale name to group

    #Copy scales property
    s = v.scales[i]

    #colorscheme, single color or array of arbitrary string colors
    if isa(palette, Tuple)
        reversePalette == true? s.range = reverse(colorpalettes[palette[1]]["$(palette[2])"]) : s.range = colorpalettes[palette[1]]["$(palette[2])"]
    elseif isa(palette, AbstractString)
        s.range = [palette]
    elseif isa(palette, Array)
        reversePalette == true? s.range = reverse(collect(palette)) : s.range = collect(palette)
    end

    return v

end

function stroke!(v::VegaVisualization; color::AbstractString = "Black", width::Real = 0.75, opacity::Real = 1, visible::Bool = true)

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

function hover!(v::VegaVisualization; opacity::Number = 1, color::AbstractString = "")

    #Hack due to boxplot having a different color setup than other visualizations
    v.name == "boxplot" ? field = "x" : field = "group"

    #Test if color is set in function, so that we know to reset the color on update
    color == ""? color_ = VegaValueRef(scale = "group", field = field) : color_ = VegaValueRef(value = color)

    #Grouped bar, line chart, popchart
    if v.marks[1].marks != nothing

        v.marks[1].marks[1].properties.hover = VegaMarkPropertySet(fillOpacity = VegaValueRef(value = opacity),
                                                                   strokeOpacity = VegaValueRef(value = opacity),
                                                                   fill = v.name == "lineplot"? nothing: color_,
                                                                   stroke = v.name == "lineplot"? color_ : nothing
                                                                   )
        v.marks[1].marks[1].properties.update = VegaMarkPropertySet(fillOpacity = VegaValueRef(value = 1),
                                                                    strokeOpacity = VegaValueRef(value = 1),
                                                                    fill = v.name == "lineplot"? nothing: VegaValueRef(scale = "group", field = field),
                                                                    stroke = v.name == "lineplot"? VegaValueRef(scale = "group", field = field) : nothing
                                                                    )


    #Area, Bar, Heatmap, Pie Chart, Scatterplot, Waterfall, WordCloud, Bubble Chart, Stemleaf, Choropleth
    else

        v.marks[1].properties.hover = VegaMarkPropertySet(fillOpacity = VegaValueRef(value = opacity),
                                                          strokeOpacity = VegaValueRef(value = opacity),
                                                          fill = color_
                                                        )
        v.marks[1].properties.update = VegaMarkPropertySet(fillOpacity = VegaValueRef(value = 1),
                                                           strokeOpacity = VegaValueRef(value = 1),
                                                           fill = v.name == "choropleth"? VegaValueRef(scale = "group", field = "table2.y"): VegaValueRef(scale = "group", field = field)
                                                        )

    end

    return v
end

function jitter!(v::VegaVisualization; pctXrange::Real = 0.05, pctYrange::Real = 0.05)

    #Calculate range, then use random pct of range
    _y = []
    _x = []

    for datum in v.data[1].values
        push!(_x, datum["x"])
        push!(_y, datum["y"])
    end

    xrange = maximum(_x) - minimum(_x)
    yrange = maximum(_y) - minimum(_y)

    #Iterate over VegaData to jitter dataset
    for datum in v.data[1].values
        if typeof(datum["x"]) <: Number
            datum["x"] = rand(0:0.001:pctXrange) * xrange + datum["x"]
        end
        if typeof(datum["y"]) <: Number
            datum["y"] = rand(0:0.001:pctYrange) * yrange + datum["y"]
        end
    end

    return v
end
