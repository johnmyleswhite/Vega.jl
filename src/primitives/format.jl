abstract VegaFormat

type VegaJSON <: VegaFormat
	# A collection of parsing instructions that can be used to
	#  define the data types of string-valued attributes in the JSON file
	# Each instruction is a name-value pair, where the name is the name
	#  of the attribute, and the value is the desired data type (one of
	#  "number", "boolean" or "date"). For example, "parse":
	#  {"modified_on":"date"} ensures that the modified_on value in each
	#  row of the input data is parsed as a Date value.
	parse::Any

	# The JSON property containing the desired data
	# This parameter can be used when the loaded JSON file may have
	#  surrounding structure or meta-data. For example "property":
	#  "values.features" is equivalent to retrieving json.values.features
	#  from the loaded JSON object.
	property::String
end
VegaJSON() = VegaJSON(nothing, "")

type VegaCSV <: VegaFormat
	# A collection of parsing instructions that can be used to define the data types of attributes in the CSV file. By default, all attributes are treated as string-typed data. Each instruction is a name-value pair, where the name is the name of the attribute, and the value is the desired data type (one of "number", "boolean" or "date"). For example, "parse": {"y":"number"} ensures that the y value in each row of the input data is parsed as a numerical value.
	parse::Any
end
VegaCSV() = VegaCSV(nothing)

type VegaTSV <: VegaFormat
	# A collection of parsing instructions that can be used to define the data types of attributes in the TSV file. By default, all attributes are treated as string-typed data. Each instruction is a name-value pair, where the name is the name of the attribute, and the value is the desired data type (one of "number", "boolean" or "date"). For example, "parse": {"y":"number"} ensures that the y value in each row of the input data is parsed as a numerical value.
	parse::Any
end
VegaTSV() = VegaTSV(nothing)

tojs(x::VegaFormat) = Dict()
