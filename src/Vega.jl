module Vega
    using JSON

    export barplot, printjson

    include("plot.jl")
    include("barplot.jl")
end
