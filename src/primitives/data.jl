# NB: Only one of values, source or url should exist.
type VegaData
	# A unique name for the data set
	name::Symbol

	# An object that specifies the format for the data file,
	# if loaded from a URL. The currently supported formats are
	#  * json (JavaScript Object Notation)
	#  * csv (comma-separated values)
	#  * tsv (tab-separated values)
	# These options are specified by the type property of the format object
	format::VegaFormat

	# The actual data set to use
	# The values property allows data to be inlined directly within
	# the specification itself
	# NB: Must be in tojs() format
	values::Vector{Dict{Any, Any}}

	# The name of another data set to use as the source for this data set
	# The source property is particularly useful in combination with a transform
	# pipeline to derive new data
	source::String

	# A URL from which to load the data set
	# Use the format property to ensure the loaded data is correctly parsed
	# If the format property is not specified, the data is assumed to be
	# in a row-oriented JSON format
	url::String

	# An array of transforms to perform on the data
	# Transform operators will be run on the default data,
	#  as provided by late-binding or as specified by the source,
	#  values, or url properties
	transform::Vector{VegaTransform}
end

function VegaData(;name::Symbol = :table,
	               format::VegaFormat = VegaJSON(),
	               values::Vector{Dict{Any, Any}} = Dict{Any, Any}[],
	               source::String = "",
	               url::String = "",
	               transform::Vector{VegaTransform} = VegaTransform[])
	VegaData(name, format, values, source, url, transform)
end

function tojs(x::VegaData)
	res = Dict()
	res["name"] = string(x.name)
	if !isa(x.format, VegaJSON)
		res["format"] = tojs(x.format)
	end
	if !isempty(x.values)
		res["values"] = x.values
	end
	if !isempty(x.source)
		res["source"] = x.source
	end
	if !isempty(x.url)
		res["url"] = x.url
	end
	if !isempty(x.transform)
		res["transform"] = [tojs(z) for z in x.transform]
	end
	return res
end

function Base.copy(x::VegaData)
	VegaData(x.name,
		     copy(x.format),
		     copy(x.values),
		     x.source,
		     x.url,
		     copy(x.transform))
end
