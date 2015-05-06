abstract VegaFormat

tojs(x::VegaFormat) = Dict{Any, Any}()

type VegaJSON <: VegaFormat
	parse::Any
	property::String
end
VegaJSON() = VegaJSON(nothing, "")
Base.copy(x::VegaJSON) = VegaJSON(x.parse, x.property)

type VegaCSV <: VegaFormat
	parse::Any
end
VegaCSV() = VegaCSV(nothing)
Base.copy(x::VegaCSV) = VegaCSV(x.parse)

type VegaTSV <: VegaFormat
	parse::Any
end
VegaTSV() = VegaTSV(nothing)
Base.copy(x::VegaTSV) = VegaTSV(x.parse)
