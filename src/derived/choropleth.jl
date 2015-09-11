@compat function choropleth(; x::AbstractArray = Int[], y::AbstractArray = Int[])
    v = VegaVisualization(width = 960, height = 500)

    #Add numeric data
    add_data!(v, x = x, y = y)
    #Add container for
    push!(v.data, VegaData(name = "counties",
                            url = "http://trifacta.github.io/vega/data/us-10m.json",
                           format = VegaFormat(_type = "topojson", feature = "counties"),
                           transform = [VegaTransform(Dict{Any, Any}("type" => "geopath", "projection" => "albersUsa")),
                                        VegaTransform(Dict{Any, Any}("type" => "lookup", "on" => "table", "onKey" => "x", "keys" => ["id"], "as" => ["id"])),
                                        VegaTransform(Dict{Any, Any}("type" => "filter", "test" => "datum.layout_path!=null && datum.table!=null"))]
                          )
         )

    v.scales = [VegaScale(name = "color",
                         _type = "quantize",
                          domain = [0, .20],
                          range = ["#f7fbff", "#deebf7", "#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#08519c", "#08306b"]
                        )]

    v.marks = [VegaMark(_type = "path",
                        from = VegaMarkFrom(data="counties"),
                        properties = VegaMarkProperties(enter = VegaMarkPropertySet(path = VegaValueRef(field = "layout_path")),
                                                        update = VegaMarkPropertySet(fill = VegaValueRef(scale = "color", field = "table.y")),
                                                        hover = VegaMarkPropertySet(fill = VegaValueRef(value = "red")))
            )]

    v

end
