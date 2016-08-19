#Axes
#xlab!/ylab!
for fun in [:x, :y]

    fname = Symbol("$(fun)lab!")

        @eval begin function ($fname)(v::VegaVisualization; title::AbstractString = "", grid::Bool = false, ticks::Number = 0,
                               format::AbstractString = "", formatType::AbstractString="", layer::AbstractString = "front",
                               properties::Dict = Dict{Any, Any}(), tickSize::Number = 0, tickSizeMajor::Number = 0,
                               tickSizeMinor::Number = 0, tickSizeEnd::Number = 0)

            #Find where axis is in array
            a = v.axes[findfirst([z.name == $"$fun" for z in v.scales])]

            #Assign properties, checking for values already set
            title == "" && a.title != "" ? a.title = a.title: a.title = title
            a.grid = grid
            ticks == 0 && a.ticks != nothing? a.ticks = a.ticks: a.ticks = ticks
            tickSize == 0 && a.tickSize != nothing? a.tickSize = a.tickSize: a.tickSize = tickSize
            tickSizeMajor == 0 && a.tickSizeMajor != nothing? a.tickSizeMajor = a.tickSizeMajor: a.tickSizeMajor = tickSizeMajor
            tickSizeMinor == 0 && a.tickSizeMinor != nothing? a.tickSizeMinor = a.tickSizeMinor: a.tickSizeMinor = tickSizeMinor
            tickSizeEnd == 0 && a.tickSizeEnd != nothing? a.tickSizeEnd = a.tickSizeEnd: a.tickSizeEnd = tickSizeEnd
            a.format = format
            a.formatType = formatType
            a.layer = layer

            #See if properties are already defined, and if so merge. If not, define it from function argument
            a.properties == nothing ? properties : merge!(a.properties, properties)

            return v
        end
    end
end
