type VegaVisualization
	# A unique name for the visualization specification
	name::Symbol

	# The total width, in pixels, of the data rectangle
	# Default is 500 if undefined
	width::Int

	# The total height, in pixels, of the data rectangle
	# Default is 500 if undefined
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
	                        width::Int = 500,
	                        height::Int = 500,
	                        viewport::Vector{Int} = Int[],
	                        padding::VegaPadding = VegaPadding(),
	                        data::Vector{VegaData} = VegaData[],
	                        scales::Vector{VegaScale} = VegaScale[],
	                        axes::Vector{VegaAxis} =
	                         [VegaAxis(axistype = :x, scale = :x),
	                          VegaAxis(axistype = :y, scale = :y)],
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
	res["axes"] = [tojs(z) for z in x.axes]
	res["marks"] = [tojs(z) for z in x.marks]
	return res
end
