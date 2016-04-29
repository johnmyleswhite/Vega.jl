function punchcard(; x::AbstractVector = [], y::AbstractVector = [], pointSize::AbstractVector = [])

    v = bubblechart(x = x, y = y, pointSize = pointSize)
    v.height = 300
    v.width = 700
    v.scales[1]._type = v.scales[2]._type = "ordinal"
    v.scales[1].points = v.scales[2].points = true
    v.axes[1].offset = v.axes[2].offset = 20
    v.axes[1].title = v.axes[2].title = ""
    v.axes[1].tickSize = v.axes[2].tickSize = 0
    v.axes[1].properties["axis"] = v.axes[2].properties["axis"] = Dict{Any, Any}("strokeWidth" => Dict{Any, Any}("value" => 0))

    return v
end
