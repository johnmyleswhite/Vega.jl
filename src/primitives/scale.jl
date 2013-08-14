type VegaScale
	# A unique name for the scale
	name::Symbol

	# The type of scale
	# If unspecified, the default value is linear
	# For ordinal scales, the value should be ordinal
	# For dates and times the value should be time or utc (for UTC time)
	# The supported quantitative scale types are
	#  * linear
	#  * log
	#  * pow
	#  * sqrt
	#  * quantile
	#  * quantize
	#  * threshold
	scaletype::Symbol

	# The domain of the scale, representing the set of data values
	# For quantitative data, this can take the form of a two-element
	#  array with minimum and maximum values
	# For ordinal/categorical data, this may be an array of valid input values
	# The domain may also be specified by a reference to a data source

	# Scale Domains
	# Scale domains may be defined directly as an array of values, or can be inferred from input data. In the latter case, the scale domain can be defined in Vega as an object we call a "DataRef" (for data reference). A DataRef is simply an object with up to two properties:
	# data - [String] The name of the data set containing domain values.
	# field - [Field | Array<Field>] A reference to the desired data field(s) (e.g., "data.price"). An array of fields will include values for all referenced fields.
	domain::Union(Vector, VegaDataRef, Nothing)

	# For quantitative scales only, sets the minimum value in the scale domain
	# domainMin can be used to override,
	#  or (with domainMax) used in lieu of, the domain property
	domainMin::Union(Number, VegaDataRef, Nothing)

	# For quantitative scales only, sets the maximum value in the scale domain
	# domainMax can be used to override,
	#  or (with domainMin) used in lieu of, the domain property
	domainMax::Union(Number, VegaDataRef, Nothing)

	# The range of the scale, representing the set of visual values
	# For numeric values, the range can take the form of a two-element array
	#  with minimum and maximum values
	# For ordinal data, the range may by an array of desired output values,
	#  which are mapped to elements in the specified domain
	# Scale Range Literals
	#  The following string values can be used to automatically set a scale range.
	#   * width - Set the scale range to [0, width], where the width value is defined by the enclosing group or data rectangle.
	#   * height - Set the scale range to [0, height], where the height value is defined by the enclosing group or data rectangle.
	#   * shapes - Set the scale range to the symbol type names: ["circle", "cross", "diamond", "square", "triangle-down", "triangle-up"]
	#   * category10 - Set the scale range to a 10-color categorical palette: #1f77b4 #ff7f0e #2ca02c #d62728 #9467bd #8c564b #e377c2 #7f7f7f #bcbd22 #17becf
	#   * category20 - Set the scale range to a 20-color categorical palette: #1f77b4 #aec7e8 #ff7f0e #ffbb78 #2ca02c #98df8a #d62728 #ff9896 #9467bd #c5b0d5 #8c564b #c49c94 #e377c2 #f7b6d2 #7f7f7f #c7c7c7 #bcbd22 #dbdb8d #17becf #9edae5
	range::Union(Vector, Symbol)

	# Sets the minimum value in the scale range
	# rangeMin can be used to override,
	#  or (with rangeMax) used in lieu of, the range property
	rangeMin::Any

	# Sets the maximum value in the scale range
	# rangeMax can be used to override
	#  or (with rangeMin) used in lieu of, the range property
	rangeMax::Any

	# If true, flips the scale range
	reverse::Bool

	# If true, rounds numeric output values to integers
	# This can be helpful for snapping to the pixel grid
	round::Bool

	# Humanize numbers
	nice::Bool

	# Force axes to start at zero
	zero::Bool

	# Specialized properties

	# == Ordinal Scale Properties ==
	# If true, distributes the ordinal values over a quantitative range at uniformly spaced points. The spacing of the points can be adjusted using the padding property. If false, the ordinal scale will construct evenly-spaced bands, rather than points.
	points::Bool

	# == Time Scale Properties ==
	# If true, values that exceed the data domain are clamped to either the minimum or maximum range value.
	clamp::Bool

	# Sets the exponent of the scale transformation. For pow scale types only, otherwise ignored.
	exponent::Real
end

function VegaScale(;name::Symbol = :x,
	                scaletype::Symbol = :linear,
	                domain::Any = nothing,
	                domainMin::Any = nothing,
	                domainMax::Any = nothing,
	                range::Union(Vector, Symbol) = :null,
	                rangeMin::Any = nothing,
	                rangeMax::Any = nothing,
	                reverse::Bool = false,
	                round::Bool = false,
	                nice::Bool = false,
	                zero::Bool = false,
	                points::Bool = false,
	                clamp::Bool = false,
	                exponent::Real = 1.0)
	VegaScale(name, scaletype,
		      domain, domainMin, domainMax,
		      range, rangeMin, rangeMax,
		      reverse, round, nice, zero, points, clamp, exponent)
end

function Base.copy(x::VegaScale)
	VegaScale(x.name,
		      x.scaletype,
	          copy(x.domain),
	          copy(x.domainMin),
	          copy(x.domainMax),
	          copy(x.range),
	          copy(x.rangeMin),
	          copy(x.rangeMax),
	          x.reverse,
	          x.round,
	          x.nice,
	          x.zero,
	          x.points,
	          x.clamp,
	          x.exponent)
end

isordinal(x::VegaScale) = x.scaletype == :ordinal

function tojs(x::VegaScale)
	res = Dict()
	res["name"] = string(x.name)
	res["type"] = string(x.scaletype)
	if x.domain != nothing
		res["domain"] = x.domain
	end
	if x.domainMin != nothing
		res["domainMin"] = x.domainMin
	end
	if x.domainMax != nothing
		res["domainMax"] = x.domainMax
	end
	if x.range != :null
		res["range"] = string(x.range)
	end
	if x.rangeMin != nothing
		res["rangeMin"] = x.rangeMin
	end
	if x.rangeMax != nothing
		res["rangeMax"] = x.rangeMax
	end
	if x.reverse
		res["reverse"] = true
	end
	if x.round
		res["round"] = true
	end
	if x.nice
		res["nice"] = true
	end
	if x.zero
		res["zero"] = true
	end
	if x.points
		res["points"] = true
	end
	if x.clamp
		res["clamp"] = true
	end
	if x.exponent != 1.0
		res["exponent"] = true
	end
	return res
end
