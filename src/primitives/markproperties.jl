# TODO: Add a isnull field to VegaValueRef
#       Make a NullVegaValueRef constant
type VegaMarkPropertySet
	# The first (typically left-most) x-coordinate
	x::Union(VegaValueRef, Nothing)

	# The second (typically right-most) x-coordinate
	x2::Union(VegaValueRef, Nothing)

	# The width of the mark (if supported)
	width::Union(VegaValueRef, Nothing)

	# The first (typically top-most) y-coordinate
	y::Union(VegaValueRef, Nothing)

	# The second (typically bottom-most) y-coordinate
	y2::Union(VegaValueRef, Nothing)

	# The height of the mark (if supported)
	height::Union(VegaValueRef, Nothing)

	# The overall opacity
	opacity::Union(VegaValueRef, Nothing)

	# The fill color
	fill::Union(VegaValueRef, Nothing)

	# The fill opacity
	fillOpacity::Union(VegaValueRef, Nothing)

	# The stroke color
	stroke::Union(VegaValueRef, Nothing)

	# The stroke width, in pixels
	strokeWidth::Union(VegaValueRef, Nothing)

	# The stroke opacity
	strokeOpacity::Union(VegaValueRef, Nothing)

	# == "symbol" mark specific ==
	# The pixel area of the symbol
	# For example: in the case of circles, the radius is determined in part by the square root of the size value.
	size::Union(VegaValueRef, Nothing)
	# The symbol shape to use
	# One of circle (default), square, cross, diamond, triangle-up, or triangle-down
	shape::Union(VegaValueRef, Nothing)

	# == "path" mark specific ==
	# A path definition in the form of an SVG Path string
	path::Union(VegaValueRef, Nothing)

	# == "arc" mark specific ==
	#The inner radius of the arc, in pixels
	innerRadius::Union(VegaValueRef, Nothing)
	#The outer radius of the arc, in pixels
	outerRadius::Union(VegaValueRef, Nothing)
	#The start angle of the arc, in radians
	startAngle::Union(VegaValueRef, Nothing)
	#The end angle of the arc, in radians
	endAngle::Union(VegaValueRef, Nothing)

	# == "area"/"line" mark specific
	# "area": The line interpolation method to use. One of linear, step-before, step-after, basis, basis-open, cardinal, cardinal-open, monotone.
	# "line": The line interpolation method to use. One of linear, step-before, step-after, basis, basis-open, basis-closed, bundle, cardinal, cardinal-open, cardinal-closed, monotone.
	interpolate::Union(VegaValueRef, Nothing)
	# "area": Depending on the interpolation type, sets the tension parameter.
	# "line": Depending on the interpolation type, sets the tension parameter.
	tension::Union(VegaValueRef, Nothing)

	# == "image"/"text" mark specific ==
	# "image": The horizontal alignment of the image. One of left, right, center.
	# "text": The horizontal alignment of the text. One of left, right, center.
	align::Union(VegaValueRef, Nothing)
	# "image": The vertical alignment of the image. One of top, middle, bottom.
	# "text": The vertical alignment of the text. One of top, middle, bottom.
	baseline::Union(VegaValueRef, Nothing)

	# == "image" mark specific ==
	# The URL from which to retrieve the image
	url::Union(VegaValueRef, Nothing)

	# == "text" mark specific ==
	# The text to display
	text::Union(VegaValueRef, Nothing)
	# The horizontal margin, in pixels, between the text label and its anchor point. The value is ignored if the align property is center.
	dx::Union(VegaValueRef, Nothing)
	# The vertical margin, in pixels, between the text label and its anchor point. The value is ignored if the baseline property is middle.
	dy::Union(VegaValueRef, Nothing)
	# The rotation angle of the text, in degrees
	angle::Union(VegaValueRef, Nothing)
	# The typeface to set the text in (e.g., Helvetica Neue)
	font::Union(VegaValueRef, Nothing)
	# The font size, in pixels
	fontSize::Union(VegaValueRef, Nothing)
	# The font weight (e.g., bold)
	fontWeight::Union(VegaValueRef, Nothing)
	# The font style (e.g., italic)
	fontStyle::Union(VegaValueRef, Nothing)
end

function VegaMarkPropertySet(;x::Union(VegaValueRef, Nothing) = nothing,
							  x2::Union(VegaValueRef, Nothing) = nothing,
	width::Union(VegaValueRef, Nothing) = nothing,
	y::Union(VegaValueRef, Nothing) = nothing,
	y2::Union(VegaValueRef, Nothing) = nothing,
	height::Union(VegaValueRef, Nothing) = nothing,
	opacity::Union(VegaValueRef, Nothing) = nothing,
	fill::Union(VegaValueRef, Nothing) = nothing,
	fillOpacity::Union(VegaValueRef, Nothing) = nothing,
	stroke::Union(VegaValueRef, Nothing) = nothing,
	strokeWidth::Union(VegaValueRef, Nothing) = nothing,
	strokeOpacity::Union(VegaValueRef, Nothing) = nothing,
	size::Union(VegaValueRef, Nothing) = nothing,
	shape::Union(VegaValueRef, Nothing) = nothing,
	path::Union(VegaValueRef, Nothing) = nothing,
	innerRadius::Union(VegaValueRef, Nothing) = nothing,
	outerRadius::Union(VegaValueRef, Nothing) = nothing,
	startAngle::Union(VegaValueRef, Nothing) = nothing,
	endAngle::Union(VegaValueRef, Nothing) = nothing,
	interpolate::Union(VegaValueRef, Nothing) = nothing,
	tension::Union(VegaValueRef, Nothing) = nothing,
	align::Union(VegaValueRef, Nothing) = nothing,
	baseline::Union(VegaValueRef, Nothing) = nothing,
	url::Union(VegaValueRef, Nothing) = nothing,
	text::Union(VegaValueRef, Nothing) = nothing,
	dx::Union(VegaValueRef, Nothing) = nothing,
	dy::Union(VegaValueRef, Nothing) = nothing,
	angle::Union(VegaValueRef, Nothing) = nothing,
	font::Union(VegaValueRef, Nothing) = nothing,
	fontSize::Union(VegaValueRef, Nothing) = nothing,
	fontWeight::Union(VegaValueRef, Nothing) = nothing,
	fontStyle::Union(VegaValueRef, Nothing) = nothing)
	VegaMarkPropertySet(x, x2, width,
		                y, y2, height,
		                opacity,
                        fill, fillOpacity,
		                stroke, strokeWidth, strokeOpacity,
		                size,
		                shape,
		                path,
		                innerRadius, outerRadius, startAngle, endAngle,
		                interpolate,
		                tension,
		                align,
		                baseline,
		                url,
		                text,
		                dx, dy,
		                angle,
		                font, fontSize, fontWeight, fontStyle)
end

function Base.copy(x::VegaMarkPropertySet)
	VegaMarkPropertySet(x.x,
		                x.x2,
		                x.width,
		                x.y,
		                x.y2,
		                x.height,
		                x.opacity,
                        x.fill,
                        x.fillOpacity,
		                x.stroke,
		                x.strokeWidth,
		                x.strokeOpacity,
		                x.size,
		                x.shape,
		                x.path,
		                x.innerRadius,
		                x.outerRadius,
		                x.startAngle,
		                x.endAngle,
		                x.interpolate,
		                x.tension,
		                x.align,
		                x.baseline,
		                x.url,
		                x.text,
		                x.dx,
		                x.dy,
		                x.angle,
		                x.font,
		                x.fontSize,
		                x.fontWeight,
		                x.fontStyle)
end

type VegaMarkProperties
	enter::Union(VegaMarkPropertySet, Nothing)
	exit::Union(VegaMarkPropertySet, Nothing)
	update::Union(VegaMarkPropertySet, Nothing)
	hover::Union(VegaMarkPropertySet, Nothing)
end

function VegaMarkProperties(;enter::Union(VegaMarkPropertySet, Nothing) = nothing,
	                         exit::Union(VegaMarkPropertySet, Nothing) = nothing,
	                         update::Union(VegaMarkPropertySet, Nothing) = nothing,
	                         hover::Union(VegaMarkPropertySet, Nothing) = nothing)
	VegaMarkProperties(enter, exit, update, hover)
end

function Base.copy(x::VegaMarkProperties)
	VegaMarkProperties(copy(x.enter),
                       copy(x.exit),
                       copy(x.update),
                       copy(x.hover))
end

function tojs(x::VegaMarkPropertySet)
	res = Dict()
	for field in VegaMarkPropertySet.names
		if !(x.(field) == nothing)
			res[string(field)] = tojs(x.(field))
		end
	end
	return res
end

function tojs(x::VegaMarkProperties)
	res = Dict()
	for field in VegaMarkProperties.names
		if !(x.(field) == nothing)
			res[string(field)] = tojs(x.(field))
		end
	end
	return res
end
