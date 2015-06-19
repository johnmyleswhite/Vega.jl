# TODO: Move this elsewhere
# function makevalues(x::Vector, y::Vector, group::Vector)
#     n = length(x)
#     res = Array(Dict{Any, Any}, n)
#     if isempty(group)
#         group = ones(Int, n)
#     end
#     for i in 1:n
#         res[i] = Dict{Any, Any}()
#         res[i]["x"] = x[i]
#         res[i]["y"] = y[i]
#         res[i]["group"] = group[i]
#     end
#     return res
# end

# TODO: Convert from z to group
#       Find and use heat colors
@compat function heatmap(;
                 x::Vector = Float64[],
                 y::Vector = Float64[],
                 group::Vector = Int[],
                 color::Vector = Int[])

    v = VegaVisualization()

    add_data!(v, x = x, y = y, group = group)

    v.scales = Array(VegaScale, 3)
    v.scales[1] = VegaScale(name = "x",
                          _type = "linear",
                          range = "width",
                          nice = true,
                          zero = false,
                          domain = VegaDataRef("table", "data.x"))

    v.scales[2] = VegaScale(name = "y",
                          _type = "linear",
                          range = "height",
                          nice = true,
                          zero = false,
                          domain = VegaDataRef("table", "data.y"))

    v.scales[3] = VegaScale(name = "group",
                          _type = "ordinal",
                          range = "category20",
                          domain = VegaDataRef("table", "data.group"))

    v.marks = Array(VegaMark, 1)
    enterprops =
      VegaMarkPropertySet(shape = VegaValueRef(value = "square"), # May need to be "string"
                          x = VegaValueRef(scale = "x",
                                           field = "data.x"),
                          y = VegaValueRef(scale = "y",
                                           field = "data.y"),
                          fill = VegaValueRef(scale = "group",
                                              field = "data.group"))
    v.marks[1] = VegaMark(_type = "symbol",
                        from = Dict{Any, Any}("data" => "table"),
                        properties = VegaMarkProperties(enter = enterprops))

    return v
end
