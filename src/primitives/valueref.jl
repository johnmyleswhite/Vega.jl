type VegaValueRef
	# A constant value. If field is specified, this value is ignored.
	value::Any

	# A field (property) from which to pull a data value. The corresponding data set is determined by the mark's from property. Dot notation ("data.price") is used to access nested properties; if a dot character is actually part of the property name, you must escape the dot with a backslash: "some\.field".
	field::String

	# The name of a scale transform to apply.
	scale::String

	# A multiplier for the value, equivalent to (mult * value). Multipliers are applied after any scale transformation.
	mult::Real

	# A simple additive offset to bias the final value, equivalent to (value + offset). Offsets are added after any scale transformation and multipliers.
	offset::Real

	# If true, and scale is specified, uses the range band of the scale as the retrieved value. This option is useful for determining widths with an ordinal scale.
	band::Bool
end

function VegaValueRef(;value::Any = nothing,
	                   field::String = "",
	                   scale::String = "",
	                   mult::Real = -1,
	                   offset::Real = -1,
	                   band::Bool = false)
	VegaValueRef(value, field, scale, mult, offset, band)
end

function Base.copy(x::VegaValueRef)
	VegaValueRef(copy(x.value),
		         x.field,
		         x.scale,
		         x.mult,
		         x.offset,
		         x.band)
end

function tojs(x::VegaValueRef)
	res = Dict()
	if x.value != nothing
		res["value"] = tojs(x.value)
	end
	if !isempty(x.field)
		res["field"] = x.field
	end
	if !isempty(x.scale)
		res["scale"] = x.scale
	end
	if x.mult != -1
		res["mult"] = x.mult
	end
	if x.offset != -1
		res["offset"] = x.offset
	end
	if x.band
		res["band"] = true
	end
	return res
end
