function barplot(;x::AbstractVector = Int[],
                  y::AbstractVector = Int[],
                  y2::AbstractVector = Int[],
                  group::AbstractVector = Int[],
                  stacked::Bool = false)

    v = VegaVisualization()

    default_scales!(v)
    v.scales[1]._type = "ordinal"
    default_axes!(v)
    default_legend!(v)

    add_data!(v, x = x, y = y, group = group, y2 = y2)
    add_rects!(v)

    v.marks[1].properties.enter.width = VegaValueRef(scale = "x", band = true, offset = -1)
    v.marks[1].properties.enter.y2 = VegaValueRef(scale = "y", field = "data.y2")
    v.marks[1].properties.enter.fill = VegaValueRef(scale = "group", field = "data.group")

    if stacked
      push!(v.data, VegaData(name = "stats", source = "table",
                             transform = [VegaTransform(Dict{Any, Any}("type" => "facet", "keys" => ["data.x"])), VegaTransform(Dict{Any, Any}("type" => "stats", "value" => "data.y"))]))

      v.scales[2].domain = VegaDataRef("stats", "sum")
      v.scales[3].domain = nothing

      v.marks[1].properties = nothing
      v.marks[1]._type = "group"

      v.marks[1].from = Dict{Any, Any}("data" => "table",
                                       "transform" => [VegaTransform(Dict{Any, Any}("type" => "facet", "keys" => ["data.group"])), VegaTransform(Dict{Any, Any}("type" => "stack", "point" => "data.x", "height" => "data.y"))])

      v.marks[1].marks = [
                          VegaMark(_type = "rect",
                          properties = VegaMarkProperties(
                                                      enter = VegaMarkPropertySet(x = VegaValueRef(scale = "x", field = "data.x"),
                                                                                  width = VegaValueRef(scale = "x", band = true, offset = -1),
                                                                                  y = VegaValueRef(scale = "y", field = "y"),
                                                                                  y2 = VegaValueRef(scale = "y", field = "y2"),
                                                                                  fill = VegaValueRef(scale = "group", field = "data.group")
                                                                                  )
                                                          )
                                  )
                          ]
    end

    return v
end
