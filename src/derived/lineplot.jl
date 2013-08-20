# Groups are broken?
function lineplot(;x::Vector = Float64[],
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
    scales[1] = VegaScale(name = "x",
                          _type = "linear",
                          range = "width",
                          nice = true,
                          domain = VegaDataRef("table", "data.x"))
    scales[2] = VegaScale(name = "y",
                          _type = "linear",
                          range = "height",
                          nice = true,
                          domain = VegaDataRef("table", "data.y"))
    scales[3] = VegaScale(name = "group",
                          _type = "ordinal",
                          range = "category10",
                          domain = VegaDataRef("table", "data.group"))

    enterprops = VegaMarkPropertySet(x = VegaValueRef(scale = "x",
                                                      field = "data.x"),
                                     y = VegaValueRef(scale = "y",
                                                      field = "data.y"),
                                     stroke = VegaValueRef(scale = "group",
                                                           field = "data.group"))
    innermarks = Array(VegaMark, 1)
    innermarks[1] = VegaMark(_type = "line",
                             properties = VegaMarkProperties(enter = enterprops))
    marks = Array(VegaMark, 1)
    marks[1] = VegaMark(_type = "group",
                        from = {
                                "data" => "table",
                                "transform" =>
                                  [{"type" => "facet", "keys" => ["data.group"]}]
                               },
                        marks = innermarks)

    VegaVisualization(width = width,
                      height = height,
                      padding = padding,
                      data = data,
                      scales = scales,
                      marks = marks)
end
