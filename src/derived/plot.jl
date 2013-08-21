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
        a, b = hist(x)
        v = plot(x = [a][2:end], y = b, kind = :bar)
    else
        error("Unknown kind of plot")
    end

    return v
end
