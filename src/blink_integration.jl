using Blink

function blink_show(v::VegaVisualization)
    w = Window()
    path(url...) = joinpath(dirname(@__FILE__), "..", "assets", "bower_components", url...)
    d3 = path("d3","d3.min.js")
    topojson = path("topojson","topojson.js")
    cloudlayout = path("d3-cloud", "build", "d3.layout.cloud.js")
    vega = path("vega", "vega.js")
    for file in (d3, topojson, cloudlayout, vega)
        load!(w, file)
    end
    body!(w, body(v))
end
