function plot(;x::AbstractVector = Int[],
               y::AbstractVector = Int[],
               group::AbstractVector = Int[],
               kind::Symbol = :scatter)
    if kind == :scatter
        v = scatterplot(x = x, y = y, group = group)
    elseif kind == :bar
        v = barplot(x = x, y = y, group = group)
    elseif kind == :area
        v = areaplot(x = x, y = y, group = group)
    elseif kind == :line
        v = lineplot(x = x, y = y, group = group)
    elseif kind == :hist
        v = histogram(x)
    elseif kind == :pie
        v = piechart(x = x, y = y)
    elseif kind == :donut
        v = donutchart(x = x, y = y)
    else
        error("Unknown kind of plot")
    end

    return v
end
