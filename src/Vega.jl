module Vega
    using JSON

	export VegaAxis, VegaData, VegaMark, VegaPadding, VegaScale,
	       VegaTransform, VegaVisualization, VegaFormat, VegaJSON,
	       VegaCSV, VegaTSV

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap
    export printjson

	const VEGADIR = tempdir()
	const HTMLPATH = joinpath(VEGADIR, "vega.jl.html")

	function install()
		initial = pwd()
		cd(Pkg.dir("Vega"))
		run(`git submodule init`)
		run(`git submodule update`)
		cd(initial)
		return
	end

	# Lower-level API
	include("primitives/padding.jl")
	include("primitives/axis.jl")
	include("primitives/format.jl")
	include("primitives/transform.jl")
	include("primitives/data.jl")
	include("primitives/mark.jl")
	include("primitives/scale.jl")
	include("primitives/visualization.jl")

	# Higher-level API
    include("derived/plot.jl")
    include("derived/barplot.jl")
    include("derived/lineplot.jl")
    include("derived/scatterplot.jl")
    include("derived/areaplot.jl")
    include("derived/heatmap.jl")
end
