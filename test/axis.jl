axes = [VegaAxis(_type = "x", scale = "x"),
        VegaAxis(_type = "y", scale = "y")]
[Vega.tojs(z) for z in axes]
copy(VegaAxis())
