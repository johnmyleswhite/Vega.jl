type VegaVisualization
	# A unique name for the visualization specification
	name::Symbol

	# The total width, in pixels, of the data rectangle
	# Default is 450 if undefined
	width::Int

	# The total height, in pixels, of the data rectangle
	# Default is 450 if undefined
	height::Int

	# The width and height of the on-screen viewport, in pixels
	# If necessary, clipping and scrolling will be applied
	viewport::Vector{Int}

	# The internal padding, in pixels, from the edge of the
	#  visualization canvas to the data rectangle
	padding::VegaPadding

	# Definitions of data to visualize
	data::Vector{VegaData}

	# Scale transform definitions
	scales::Vector{VegaScale}

	# Axis definitions
	axes::Vector{VegaAxis}

	# Graphical mark definitions
	marks::Vector{VegaMark}
end

function VegaVisualization(;name::Symbol = :null,
	                        width::Int = 450,
	                        height::Int = 450,
	                        viewport::Vector{Int} = Int[],
	                        padding::VegaPadding = VegaPadding(),
	                        data::Vector{VegaData} = VegaData[],
	                        scales::Vector{VegaScale} = VegaScale[],
	                        axes::Vector{VegaAxis} =
	                         [VegaAxis(axistype = :x, scale = :x, title = "x"),
	                          VegaAxis(axistype = :y, scale = :y, title = "y")],
	                        marks::Vector{VegaMark} = VegaMark[])
	VegaVisualization(name,
		              width,
		              height,
		              viewport,
		              padding,
		              data,
		              scales,
		              axes,
		              marks)
end

function Base.copy(x::VegaVisualization)
	VegaVisualization(x.name,
		              x.width,
		              x.height,
		              copy(x.viewport),
		              copy(x.padding),
		              copy(x.data),
		              copy(x.scales),
		              copy(x.axes),
		              copy(x.marks))
end

function tojs(x::VegaVisualization)
	res = Dict()
	if x.name != :null
		res["name"] = string(x.name)
	end
	res["width"] = x.width
	res["height"] = x.height
	if !isempty(x.viewport)
		res["viewport"] = [x.viewport[1], x.viewport[2]]
	end
	res["padding"] = tojs(x.padding)
	res["data"] = [tojs(z) for z in x.data]
	res["scales"] = [tojs(z) for z in x.scales]
	for z in x.scales
		if isordinal(z)
			if haskey(res, "legends")
				push!(res["legends"], {"fill" => string(z.name), "title" => "Legend"})
			else
				res["legends"] = [{"fill" => string(z.name), "title" => "Legend"}]
			end
		end
	end
	res["axes"] = [tojs(z) for z in x.axes]
	res["marks"] = [tojs(z) for z in x.marks]
	return res
end

function tojson(v::VegaVisualization)
    JSON.json(Vega.tojs(v))
end

function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")
	js = tojs(v)

	spec = tojson(v)
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
    println(io, "<body>x<div style='text-align: center' id='view' class='view'></div></body>")

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
    # rm(HTMLPATH)

    return
end
