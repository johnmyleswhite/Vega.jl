function waterfall(;x::AbstractVector = Int[], y::AbstractVector = Int[])
    if length(x) != length(y)
        error("X and Y need to be the same length")
    end

    #Calculate waterfall
    _start = zeros(Int, length(x))
    _end = cumsum(y) #End values for bar

    #Do lag calculation for bar starting value
    for i in 2:length(_start)
        _start[i] = _end[i-1]
    end

    #Calculate group based on positive or negative
    _group = [Int(val < 0) for val in y]

    #Make a copy so x isn't mutated
    _x = deepcopy(x)

    #Add Summary to Arrays
    push!(_start, 0)
    push!(_end, _end[end])
    push!(_group, _group[end] + 1)
    push!(_x, "Total")

    v = barplot(x = _x, y = _end, y2 = _start, group = _group)

    #Clean-up presentation
    v.width = 110 * length(x) #Make the graph variable width based on number of levels
    v.marks[1].properties.enter.width = VegaValueRef(scale = "x", band = true, mult= 0.5)
    v.marks[1].properties.enter.x  = VegaValueRef(scale = "x", field = "x", offset = 31)
    v.scales[1].domain.sort = false

    #Hide unneeded labels
    xlab!(v)
    ylab!(v)
    legend!(v, show = false)

    colorscheme!(v; palette = ["#4daf4a", "#e41a1c", "#377eb8"])

    return v
end
