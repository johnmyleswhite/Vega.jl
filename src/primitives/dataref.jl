type VegaDataRef
	# The name of the data set containing domain values
	data::String

	# A reference to the desired data field(s) (e.g., "data.price")
	# An array of fields will include values for all referenced fields
	# TODO: Support Vector{String} variant
	field::String
end

Base.copy(x::VegaDataRef) = VegaDataRef(x.data, x.field)
