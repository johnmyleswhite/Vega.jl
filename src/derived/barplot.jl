function barplot(;x::Vector = Float64[],
                 y::Vector = Float64[],
                 group::Vector = Int[],
                 color::Vector = Int[],
                 width::Int = 450,
                 height::Int = 450,
                 top::Int = 80,
                 left::Int = 80,
                 bottom::Int = 80,
                 right::Int = 80)
    padding = VegaPadding(top, left, bottom, right)

    data = Array(VegaData, 1)
    data[1] = VegaData(values = makevalues(x, y, group))

    scales = Array(VegaScale, 3)
    scales[1] = VegaScale(name = :x,
                          scaletype = :ordinal,
                          range = :width,
                          domain = VegaDataRef("table", "data.x"))
    scales[2] = VegaScale(name = :y,
                          scaletype = :linear,
                          range = :height,
                          nice = true,
                          domain = VegaDataRef("table", "data.y"))
    scales[3] = VegaScale(name = :group,
                          scaletype = :ordinal,
                          range = :category10,
                          domain = VegaDataRef("table", "data.group"))

    marks = Array(VegaMark, 1)
    enterprops =
      VegaMarkPropertySet(x = VegaValueRef(scale = "x",
                                           field = "data.x"),
                          width = VegaValueRef(scale = "x", band = true, offset = -1),
                          y = VegaValueRef(scale = "y",
                                           field = "data.y"),
                          y2 = VegaValueRef(scale = "y",
                                            value = 0),
                          stroke = VegaValueRef(scale = "group",
                                                field = "data.group"),
                          fill = VegaValueRef(scale = "group",
                                              field = "data.group"))
    marks[1] = VegaMark(marktype = :rect,
                        from = {"data" => "table"},
                        properties = VegaMarkProperties(enter = enterprops))
    VegaVisualization(width = width,
                      height = height,
                      padding = padding,
                      data = data,
                      scales = scales,
                      marks = marks)
end
