#
# Correctness Tests
#

using Base.Test
using Vega

my_tests = ["test/padding.jl",
            "test/valueref.jl",
            "test/axis.jl",
            "test/format.jl",
            "test/transform.jl",
            "test/data.jl",
            "test/mark.jl",
            "test/scale.jl",
            "test/scale.jl",
            "test/visualization.jl",
            "demo.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
