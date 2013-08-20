function plot(;x::Vector = Float64[],
               y::Vector = Float64[],
               group::Vector = Int[],
               kind::Symbol = :scatter,
               width::Int = 450,
               height::Int = 450,
               top::Int = 80,
               left::Int = 80,
               bottom::Int = 80,
               right::Int = 80)
    if isempty(group)
        group = ones(Int, length(x))
    end
    if kind == :scatter
        v = scatterplot(x = x, y = y, group = group) # etc...
    elseif kind == :bar
        v = barplot(x = x, y = y, group = group) # etc...
    elseif kind == :area
        v = areaplot(x = x, y = y, group = group) # etc...
    elseif kind == :line
        v = lineplot(x = x, y = y, group = group) # etc...
    elseif kind == :hist
        a, b = hist(x)
        v = plot(x = [a][2:end], y = b, kind = :bar)
    else
        error("Unknown kind of plot")
    end

    axis1 = VegaAxis(_type = "x", scale = "x", title = "x")
    axis2 = VegaAxis(_type = "y", scale = "y", title = "y")
    v.axes = [axis1, axis2]

    v.legends = [VegaLegend(fill = "group", title = "Group")]

    return v
end
