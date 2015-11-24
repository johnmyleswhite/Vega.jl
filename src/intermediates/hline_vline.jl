#hline!/vline!
for (fname, axis, axis2, axis3, range) in [(:vline!, :y, :y2, :x, :height), (:hline!, :x, :x2, :y, :width)]

        @eval begin function ($fname)(v::VegaVisualization; value::Real = 0, strokeWidth::Real = 1.5, stroke::AbstractString = "#000", strokeDash::Real = 0)
            line = VegaMark(_type = "rule",
                            properties = VegaMarkProperties(enter = VegaMarkPropertySet($axis = VegaValueRef(field = Dict{Any, Any}("group" => $"$axis")),
                                                                                        $axis2 = VegaValueRef(field = Dict{Any, Any}("group" => $"$range")),
                                                                                        $axis3 = VegaValueRef(scale = $"$axis3", value = value),
                                                                                        strokeWidth = VegaValueRef(value = strokeWidth),
                                                                                        stroke = VegaValueRef(value = stroke),
                                                                                        strokeDash = VegaValueRef(value = strokeDash != 0? [strokeDash] : [])
                                                                                        )
                                        )
                            )

            push!(v.marks, line)

            return v
        end
    end
end