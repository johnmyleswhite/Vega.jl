# TODO: Convert from z to group
#       Find and use heat colors
function heatmap(;x::Vector = Float64[],
                 y::Vector = Float64[],
                 z::Vector = Int[],
                 color::Vector = Int[],
                 width::Int = 450,
                 height::Int = 450,
                 top::Int = 80,
                 left::Int = 80,
                 bottom::Int = 80,
                 right::Int = 80)
    padding = VegaPadding(top, left, bottom, right)

    data = Array(VegaData, 1)
    data[1] = VegaData(values = makevalues(x, y, z))

    scales = Array(VegaScale, 3)
    scales[1] = VegaScale(name = "x",
                          _type = "linear",
                          range = "width",
                          nice = true,
                          zero = false,
                          domain = VegaDataRef("table", "data.x"))
    scales[2] = VegaScale(name = "y",
                          _type = "linear",
                          range = "height",
                          nice = true,
                          zero = false,
                          domain = VegaDataRef("table", "data.y"))
    scales[3] = VegaScale(name = "group",
                          _type = "ordinal",
                          range = "category20",
                          domain = VegaDataRef("table", "data.group"))

    marks = Array(VegaMark, 1)
    enterprops =
      VegaMarkPropertySet(shape = VegaValueRef(value = "square"), # May need to be "string"
                          x = VegaValueRef(scale = "x",
                                           field = "data.x"),
                          y = VegaValueRef(scale = "y",
                                           field = "data.y"),
                          fill = VegaValueRef(scale = "group",
                                              field = "data.group"))
    marks[1] = VegaMark(_type = "symbol",
                        from = {"data" => "table"},
                        properties = VegaMarkProperties(enter = enterprops))
    VegaVisualization(width = width,
                      height = height,
                      padding = padding,
                      data = data,
                      scales = scales,
                      marks = marks)
end
