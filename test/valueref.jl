# The constant value 5
@assert Vega.tojs(VegaValueRef(value = 5)) == Dict("value" => 5)

# The value of data.price, for the current datum
@assert Vega.tojs(VegaValueRef(field = "data.price")) == Dict("field" => "data.price")

# The value of index for the current datum, multiplied by 20
@assert Vega.tojs(VegaValueRef(field = "index", mult = 20)) == Dict("field" => "index", "mult" => 20)

# The result of running the value 0 through the scale named x
@assert Vega.tojs(VegaValueRef(scale = "x", value = 0)) == Dict("scale" => "x", "value" => 0)

# The result of running data.price for the current datum through the scale named y
@assert Vega.tojs(VegaValueRef(scale = "y", field = "data.price")) == Dict("scale" => "y", "field" => "data.price")

# The range band width of the ordinal scale x. Note that the scale must be ordinal!
@assert Vega.tojs(VegaValueRef(scale = "x", band = true)) == Dict("scale" => "x", "band" => true)

# The range band width of the ordinal scale x, reduced (negative offset) by one pixel
# TODO: Make this work
# @assert Vega.tojs(VegaValueRef(scale = "x", band = true, offset = -1)) == {"scale" => "x", "band" => true, offset => -1}