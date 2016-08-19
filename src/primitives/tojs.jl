tojs(s::Symbol) = string(s)
tojs(v::Vector) = [tojs(v_i) for v_i in v]

function tojs(v::Dict)
    res = Dict()
    for (k, v) in v
        res[k] = tojs(v)
    end
    return res
end
tojs(x::Any) = x

function tojs(x::VegaStream)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.expr != nothing
        res["expr"] = tojs(x.expr)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    return res
end

function tojs(x::VegaDataRef)
    res = Dict()
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    if x.field != nothing
        res["field"] = tojs(x.field)
    end
    if x.fields != nothing
        res["fields"] = tojs(x.fields)
    end
    if x.sort != nothing
        res["sort"] = tojs(x.sort)
    end
    return res
end

function tojs(x::VegaValueRef)
    res = Dict()
    if x.value != nothing
        res["value"] = tojs(x.value)
    end
    if x.field != nothing
        res["field"] = tojs(x.field)
    end
    if x.group != nothing
        res["group"] = tojs(x.group)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.mult != nothing
        res["mult"] = tojs(x.mult)
    end
    if x.offset != nothing
        res["offset"] = tojs(x.offset)
    end
    if x.band != nothing
        res["band"] = tojs(x.band)
    end
    if x.signal != nothing
        res["signal"] = tojs(x.signal)
    end
    return res
end

function tojs(x::VegaPadding)
    res = Dict()
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    return res
end

function tojs(x::VegaMarkPropertySet)
    res = Dict()
    if x.x != nothing
        res["x"] = tojs(x.x)
    end
    if x.x2 != nothing
        res["x2"] = tojs(x.x2)
    end
    if x.xc != nothing
        res["xc"] = tojs(x.xc)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.y != nothing
        res["y"] = tojs(x.y)
    end
    if x.y2 != nothing
        res["y2"] = tojs(x.y2)
    end
    if x.yc != nothing
        res["yc"] = tojs(x.yc)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    if x.fill != nothing
        res["fill"] = tojs(x.fill)
    end
    if x.fillOpacity != nothing
        res["fillOpacity"] = tojs(x.fillOpacity)
    end
    if x.stroke != nothing
        res["stroke"] = tojs(x.stroke)
    end
    if x.strokeWidth != nothing
        res["strokeWidth"] = tojs(x.strokeWidth)
    end
    if x.strokeOpacity != nothing
        res["strokeOpacity"] = tojs(x.strokeOpacity)
    end
    if x.strokeDash != nothing
        res["strokeDash"] = tojs(x.strokeDash)
    end
    if x.strokeDashOffset != nothing
        res["strokeDashOffset"] = tojs(x.strokeDashOffset)
    end
    if x.cursor != nothing
        res["cursor"] = tojs(x.cursor)
    end
    if x.clip != nothing
        res["clip"] = tojs(x.clip)
    end
    if x.size != nothing
        res["size"] = tojs(x.size)
    end
    if x.shape != nothing
        res["shape"] = tojs(x.shape)
    end
    if x.path != nothing
        res["path"] = tojs(x.path)
    end
    if x.innerRadius != nothing
        res["innerRadius"] = tojs(x.innerRadius)
    end
    if x.outerRadius != nothing
        res["outerRadius"] = tojs(x.outerRadius)
    end
    if x.startAngle != nothing
        res["startAngle"] = tojs(x.startAngle)
    end
    if x.endAngle != nothing
        res["endAngle"] = tojs(x.endAngle)
    end
    if x.interpolate != nothing
        res["interpolate"] = tojs(x.interpolate)
    end
    if x.tension != nothing
        res["tension"] = tojs(x.tension)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.url != nothing
        res["url"] = tojs(x.url)
    end
    if x.align != nothing
        res["align"] = tojs(x.align)
    end
    if x.baseline != nothing
        res["baseline"] = tojs(x.baseline)
    end
    if x.text != nothing
        res["text"] = tojs(x.text)
    end
    if x.dx != nothing
        res["dx"] = tojs(x.dx)
    end
    if x.dy != nothing
        res["dy"] = tojs(x.dy)
    end
    if x.radius != nothing
        res["radius"] = tojs(x.radius)
    end
    if x.theta != nothing
        res["theta"] = tojs(x.theta)
    end
    if x.angle != nothing
        res["angle"] = tojs(x.angle)
    end
    if x.font != nothing
        res["font"] = tojs(x.font)
    end
    if x.fontSize != nothing
        res["fontSize"] = tojs(x.fontSize)
    end
    if x.fontWeight != nothing
        res["fontWeight"] = tojs(x.fontWeight)
    end
    if x.fontStyle != nothing
        res["fontStyle"] = tojs(x.fontStyle)
    end
    return res
end

function tojs(x::VegaAxis)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.title != nothing
        res["title"] = tojs(x.title)
    end
    if x.titleOffset != nothing
        res["titleOffset"] = tojs(x.titleOffset)
    end
    if x.format != nothing
        res["format"] = tojs(x.format)
    end
    if x.formatType != nothing
        res["formatType"] = tojs(x.formatType)
    end
    if x.ticks != nothing
        res["ticks"] = tojs(x.ticks)
    end
    if x.values != nothing
        res["values"] = tojs(x.values)
    end
    if x.subdivide != nothing
        res["subdivide"] = tojs(x.subdivide)
    end
    if x.tickPadding != nothing
        res["tickPadding"] = tojs(x.tickPadding)
    end
    if x.tickSize != nothing
        res["tickSize"] = tojs(x.tickSize)
    end
    if x.tickSizeMajor != nothing
        res["tickSizeMajor"] = tojs(x.tickSizeMajor)
    end
    if x.tickSizeMinor != nothing
        res["tickSizeMinor"] = tojs(x.tickSizeMinor)
    end
    if x.tickSizeEnd != nothing
        res["tickSizeEnd"] = tojs(x.tickSizeEnd)
    end
    if x.offset != nothing
        res["offset"] = tojs(x.offset)
    end
    if x.layer != nothing
        res["layer"] = tojs(x.layer)
    end
    if x.grid != nothing
        res["grid"] = tojs(x.grid)
    end
    if x.properties != nothing
        res["properties"] = tojs(x.properties)
    end
    return res
end

function tojs(x::VegaFormat)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.parse != nothing
        res["parse"] = tojs(x.parse)
    end
    if x.property != nothing
        res["property"] = tojs(x.property)
    end
    if x.feature != nothing
        res["feature"] = tojs(x.feature)
    end
    if x.mesh != nothing
        res["mesh"] = tojs(x.mesh)
    end
    if x.children != nothing
        res["children"] = tojs(x.children)
    end
    return res
end

function tojs(x::VegaData)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.format != nothing
        res["format"] = tojs(x.format)
    end
    if x.values != nothing
        res["values"] = tojs(x.values)
    end
    if x.source != nothing
        res["source"] = tojs(x.source)
    end
    if x.url != nothing
        res["url"] = tojs(x.url)
    end
    if x.transform != nothing
        res["transform"] = tojs(x.transform)
    end
    if x.modify != nothing
        res["modify"] = tojs(x.modify)
    end
    return res
end

function tojs(x::VegaMarkProperties)
    res = Dict()
    if x.enter != nothing
        res["enter"] = tojs(x.enter)
    end
    if x.exit != nothing
        res["exit"] = tojs(x.exit)
    end
    if x.update != nothing
        res["update"] = tojs(x.update)
    end
    if x.hover != nothing
        res["hover"] = tojs(x.hover)
    end
    return res
end

function tojs(x::VegaMarkFrom)
    res = Dict()
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    if x.mark != nothing
        res["mark"] = tojs(x.mark)
    end
    if x.transform != nothing
        res["transform"] = tojs(x.transform)
    end
    if x.value != nothing
        res["value"] = tojs(x.value)
    end
    return res
end

function tojs(x::VegaSignal)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.init != nothing
        res["init"] = tojs(x.init)
    end
    if x.verbose != nothing
        res["verbose"] = tojs(x.verbose)
    end
    if x.expr != nothing
        res["expr"] = tojs(x.expr)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.streams != nothing
        res["streams"] = tojs(x.streams)
    end
    return res
end

function tojs(x::VegaScale)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.domain != nothing
        res["domain"] = tojs(x.domain)
    end
    if x.domainMin != nothing
        res["domainMin"] = tojs(x.domainMin)
    end
    if x.domainMax != nothing
        res["domainMax"] = tojs(x.domainMax)
    end
    if x.range != nothing
        res["range"] = tojs(x.range)
    end
    if x.rangeMin != nothing
        res["rangeMin"] = tojs(x.rangeMin)
    end
    if x.rangeMax != nothing
        res["rangeMax"] = tojs(x.rangeMax)
    end
    if x.reverse != nothing
        res["reverse"] = tojs(x.reverse)
    end
    if x.round != nothing
        res["round"] = tojs(x.round)
    end
    if x.points != nothing
        res["points"] = tojs(x.points)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.outerPadding != nothing
        res["outerPadding"] = tojs(x.outerPadding)
    end
    if x.bandWidth != nothing
        res["bandWidth"] = tojs(x.bandWidth)
    end
    if x.sort != nothing
        res["sort"] = tojs(x.sort)
    end
    if x.clamp != nothing
        res["clamp"] = tojs(x.clamp)
    end
    if x.nice != nothing
        res["nice"] = tojs(x.nice)
    end
    if x.exponent != nothing
        res["exponent"] = tojs(x.exponent)
    end
    if x.zero != nothing
        res["zero"] = tojs(x.zero)
    end
    return res
end

function tojs(x::VegaMark)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.key != nothing
        res["key"] = tojs(x.key)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.from != nothing
        res["from"] = tojs(x.from)
    end
    if x.properties != nothing
        res["properties"] = tojs(x.properties)
    end
    if x.delay != nothing
        res["delay"] = tojs(x.delay)
    end
    if x.ease != nothing
        res["ease"] = tojs(x.ease)
    end
    if x.marks != nothing
        res["marks"] = tojs(x.marks)
    end
    if x.scales != nothing
        res["scales"] = tojs(x.scales)
    end
    if x.axes != nothing
        res["axes"] = tojs(x.axes)
    end
    if x.interactive != nothing
        res["interactive"] = tojs(x.interactive)
    end
    return res
end

function tojs(x::VegaLegend)
    res = Dict()
    if x.size != nothing
        res["size"] = tojs(x.size)
    end
    if x.shape != nothing
        res["shape"] = tojs(x.shape)
    end
    if x.fill != nothing
        res["fill"] = tojs(x.fill)
    end
    if x.stroke != nothing
        res["stroke"] = tojs(x.stroke)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.offset != nothing
        res["offset"] = tojs(x.offset)
    end
    if x.title != nothing
        res["title"] = tojs(x.title)
    end
    if x.format != nothing
        res["format"] = tojs(x.format)
    end
    if x.formatType != nothing
        res["formatType"] = tojs(x.formatType)
    end
    if x.values != nothing
        res["values"] = tojs(x.values)
    end
    if x.properties != nothing
        res["properties"] = tojs(x.properties)
    end
    return res
end

function tojs(x::VegaScene)
    res = Dict()
    if x.fill != nothing
        res["fill"] = tojs(x.fill)
    end
    if x.fillOpacity != nothing
        res["fillOpacity"] = tojs(x.fillOpacity)
    end
    if x.stroke != nothing
        res["stroke"] = tojs(x.stroke)
    end
    if x.strokeOpacity != nothing
        res["strokeOpacity"] = tojs(x.strokeOpacity)
    end
    if x.strokeWidth != nothing
        res["strokeWidth"] = tojs(x.strokeWidth)
    end
    if x.strokeDash != nothing
        res["strokeDash"] = tojs(x.strokeDash)
    end
    if x.strokeDashOffset != nothing
        res["strokeDashOffset"] = tojs(x.strokeDashOffset)
    end
    return res
end

function tojs(x::VegaContainer)
    res = Dict()
    if x.scene != nothing
        res["scene"] = tojs(x.scene)
    end
    if x.scales != nothing
        res["scales"] = tojs(x.scales)
    end
    if x.axes != nothing
        res["axes"] = tojs(x.axes)
    end
    if x.legends != nothing
        res["legends"] = tojs(x.legends)
    end
    if x.marks != nothing
        res["marks"] = tojs(x.marks)
    end
    return res
end

function tojs(x::VegaPredicate)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.operands != nothing
        res["operands"] = tojs(x.operands)
    end
    if x.range != nothing
        res["range"] = tojs(x.range)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.item != nothing
        res["item"] = tojs(x.item)
    end
    return res
end

function tojs(x::VegaVisualization)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.viewport != nothing
        res["viewport"] = tojs(x.viewport)
    end
    if x.background != nothing
        res["background"] = tojs(x.background)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    if x.scales != nothing
        res["scales"] = tojs(x.scales)
    end
    if x.axes != nothing
        res["axes"] = tojs(x.axes)
    end
    if x.marks != nothing
        res["marks"] = tojs(x.marks)
    end
    if x.legends != nothing
        res["legends"] = tojs(x.legends)
    end
    if x.signals != nothing
        res["signals"] = tojs(x.signals)
    end
    if x.predicates != nothing
        res["predicates"] = tojs(x.predicates)
    end
    if x.modify != nothing
        res["modify"] = tojs(x.modify)
    end
    return res
end
