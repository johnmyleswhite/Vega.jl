module Vega
    using JSON

    export plot
    export barplot, lineplot, scatterplot, areaplot, heatmap
    export printjson

	const VEGADIR = tempdir()
	const JSONPATH = joinpath(VEGADIR, "vega.jl.json")
	const HTMLPATH = joinpath(VEGADIR, "vega.jl.html")

	function install()
		initial = pwd()
		cd(Pkg.dir("Vega"))
		run(`git submodule init`)
		run(`git submodule update`)
		cd(initial)
		return
	end

    include("plot.jl")
    include("barplot.jl")
    include("lineplot.jl")
    include("scatterplot.jl")
    include("areaplot.jl")
    include("heatmap.jl")
end
