using Vega
using Base.Test
using Compat
using PyCall

@pyimport jsonschema
vegaschema = JSON.parse(readall(Pkg.dir("Vega", "assets/bower_components/vega/vega-schema.json")))

#### Tests ####
#1. Area Plot
using Vega, KernelDensity, Distributions

x = rand(Beta(3.0, 2.0), 10)
k = kde(x)

#Test that Julia returned VegaVisulization (every public function does)
#jsonschema.validate returns nothing if json validates against schema
a = areaplot(x = k.x, y = k.density);
@test typeof(a) == VegaVisualization
@test jsonschema.validate(tojs(a), vegaschema) == nothing

#@compat @assert 1 == 1

# my_tests = ["test/padding.jl",
#             "test/valueref.jl",
#             "test/axis.jl",
#             "test/format.jl",
#             "test/transform.jl",
#             "test/data.jl",
#             "test/mark.jl",
#             "test/scale.jl",
#             "test/visualization.jl"]

# println("Running tests:")

# for my_test in my_tests
#     println(" * $(my_test)")
#     include(Pkg.dir("Vega",my_test))
# end