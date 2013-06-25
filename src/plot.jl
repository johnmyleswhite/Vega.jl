type PlotDimensions
    width::Int
    height::Int
end

type PlotPadding
    top::Int
    left::Int
    bottom::Int
    right::Int
end

abstract PlotData
abstract PlotAxes
abstract PlotScales
abstract PlotMarks

type Plot
    dims::PlotDimensions
    padding::PlotPadding
    data::PlotData
    scales::PlotScales
    axes::PlotAxes
    marks::PlotMarks
end

function printjson(p::PlotPadding)
    return {"top" => p.top, "left" => p.left,
            "bottom" => p.bottom, "right" => p.right}
end

function printjson(p::Plot)
    res = Dict()
    res["width"] = p.dims.width
    res["height"] = p.dims.height
    res["padding"] = printjson(p.padding)
    res["data"] = printjson(p.data)
    res["scales"] = printjson(p.scales)
    res["axes"] = printjson(p.axes)
    res["marks"] = printjson(p.marks)
    return JSON.print_to_json(res)
end
