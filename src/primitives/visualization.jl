vis_type = :VegaVisualization

# NB: This fails if "Vega Visualization" is set to `nothing`
vis_spec =
[
    (:name, String, "Vega Visualization", true),
    (:width, Int, 450, false),
    (:height, Int, 450, false),
    (:padding, Union(VegaPadding, Number, String), "auto", false),
    (:viewport, Vector{Int}, nothing, true),
    (:data, Vector{VegaData}, nothing, true),
    (:scales, Vector{VegaScale}, nothing, true),
    (:axes, Vector{VegaAxis}, nothing, true),
    (:marks, Vector{VegaMark}, nothing, true),
    (:legends, Vector{VegaLegend}, nothing, true)
]

eval(maketype(vis_type, vis_spec))
eval(makekwfunc(vis_type, vis_spec))
eval(maketojs(vis_type, vis_spec))
eval(makecopy(vis_type, vis_spec))

function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")
	js = tojs(v)

	# spec = tojson(v)
    d3path = Pkg.dir("Vega", "deps/vega/examples/lib/d3.v3.min.js")
    vegapath = Pkg.dir("Vega", "deps/vega/vega.js")

    println(io, "<html>")

    # print head
    println(io, "<head>")
    println(io, "  <title>$title</title>")
    println(io, "  <script src='$d3path'></script>")
    println(io, "  <script src='$vegapath'></script>")
    println(io, "</head>")

    # print body
    println(io, "<body><div style='text-align: center' id='view' class='view'></div></body>")

    # print script
    println(io, "<script type='text/javascript'>")
    print(io, "spec = ")
    JSON.print(io, js)
    println(io, ";")
    println(io, "vg.parse.spec(spec, function(chart) {
    	self.view = chart({el:'#view'}).update();
  	});")
    println(io, "</script>")
end

function Base.show(io::IO, v::VegaVisualization)
	# create a temporary file 
	tmppath = string(tempname(), ".vega.html")
    io = open(tmppath, "w")
    writehtml(io, v)
    close(io)

    # Open the browser
    openurl(tmppath)

    # Turn off clean up steps for now
    # rm(tmppath)

    return
end

typealias vg VegaVisualization

