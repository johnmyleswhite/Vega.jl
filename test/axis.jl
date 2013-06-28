axes = [VegaAxis(axistype = :x, scale = :x), VegaAxis(axistype = :y, scale = :y)]
[Vega.tojs(z) for z in axes]
copy(VegaAxis())
