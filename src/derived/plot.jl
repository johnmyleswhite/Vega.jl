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
        scatterplot(x = x, y = y, group = group) # etc...
    elseif kind == :bar
        barplot(x = x, y = y, group = group) # etc...
    elseif kind == :area
        areaplot(x = x, y = y, group = group) # etc...
    elseif kind == :line
        lineplot(x = x, y = y, group = group) # etc...
    elseif kind == :hist
        a, b = hist(x)
        plot(x = [a][2:end], y = b, kind = :bar)
    else
        error("Unknown kind of plot")
    end
end
