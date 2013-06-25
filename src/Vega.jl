module Vega
    using JSON

    export barplot, lineplot, scatterplot, printjson

    include("plot.jl")
    include("barplot.jl")
    include("lineplot.jl")
    include("scatterplot.jl")
end
