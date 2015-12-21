function choropleth(; x::AbstractVector = Int[], y::AbstractVector = Int[], entity::Symbol = :uscounties)
    v = VegaVisualization(name = "choropleth", width = 960, height = 500)

    #Add numeric data
    add_data!(v, x = x, y = y)

    #Get unique table name
    table = v.data[1].name

    #Add geodata

    #US County level map
    if entity == :uscounties
      push!(v.data, VegaData(name = "geodata",
                             url = "http://trifacta.github.io/vega/data/us-10m.json",
                             format = VegaFormat(_type = "topojson", feature = "counties"),
                             transform = [VegaTransform(Dict{Any, Any}("type" => "geopath", "projection" => "albersUsa")),
                                          VegaTransform(Dict{Any, Any}("type" => "lookup", "on" => table, "onKey" => "x", "keys" => ["id"], "as" => ["table2"])),
                                          VegaTransform(Dict{Any, Any}("type" => "filter", "test" => "datum.layout_path!=null && datum.table2!=null"))]
                            )
           )

    #United States map
    elseif entity == :usstates

            push!(v.data, VegaData(name = "geodata",
                             url = "http://trifacta.github.io/vega/data/us-10m.json",
                             format = VegaFormat(_type = "topojson", feature = "states"),
                             transform = [VegaTransform(Dict{Any, Any}("type" => "geopath", "projection" => "albersUsa")),
                                          VegaTransform(Dict{Any, Any}("type" => "lookup", "on" => table, "onKey" => "x", "keys" => ["id"], "as" => ["table2"])),
                                          VegaTransform(Dict{Any, Any}("type" => "filter", "test" => "datum.layout_path!=null && datum.table2!=null"))]
                            )
           )

    end

    #Generically applicable to all data
    v.scales = [VegaScale(name = "group",
                         _type = "quantize",
                          domain = [minimum(y), maximum(y)],
                          range = ["#f7fbff", "#deebf7", "#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#08519c", "#08306b"]
                        )]

    v.marks = [VegaMark(_type = "path",
                        from = VegaMarkFrom(data="geodata"),
                        properties = VegaMarkProperties(enter = VegaMarkPropertySet(path = VegaValueRef(field = "layout_path"), fill = VegaValueRef(scale = "group", field = "table2.y"))

                                                        )
            )]

    return v

end