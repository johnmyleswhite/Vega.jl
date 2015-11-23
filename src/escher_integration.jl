import Escher: Elem, Tile, render
import Base: convert

type VegaPlot <: Tile
    json::AbstractString
end

convert(::Type{Tile}, v::VegaVisualization) = VegaPlot(JSON.json(tojs(v)))

render(plot::VegaPlot, state) =
    Elem(:"vega-plot", attributes = Dict(:json=>plot.json))
