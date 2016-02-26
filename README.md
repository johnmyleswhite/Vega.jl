Vega.jl
=======
OSX/Linux: [![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl) </br>
pkg.julialang.org: [![Vega](http://pkg.julialang.org/badges/Vega_0.4.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.4) </br>
Windows 64-bit: [![Build status](https://ci.appveyor.com/api/projects/status/5rdwxsajxo5ybbfn?svg=true)](https://ci.appveyor.com/project/randyzwitch/vega-jl)


# Introduction

A Julia package for creating Vega visualizations. Convenience functions for common visualizations are provided, while also allowing for unlimited customization through modification of the main `VegaVisualization` composite type.

At a high-level, Vega.jl is designed to provide an easy-to-use library to quickly make common visualizations, while also including some of the interactivity provided as part of the Vega 2.x JavaScript library. This package also provides a declarative syntax that deviates from [Grammar-of-Graphics](https://www.cs.uic.edu/~wilkinson/TheGrammarOfGraphics/GOG.html) style packages.

# Installation

	Pkg.add("Vega")
	using Vega

Currently, an Internet connection is required to use Vega.jl through Jupyter Notebook, as the required JavaScript libraries are delivered from a CDN. Using Vega from the REPL will work without an Internet connection.

# Documentation

Please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/), which is rendered on-the-fly using Vega code generated from Vega.jl

# TODO/Contributing

Here's the current TODO list (along with the [GitHub issues](https://github.com/johnmyleswhite/Vega.jl/issues)); of course, any contribution, on this list or not, is greatly appreciated!

To Do:

Functions/Types:

- area, (vertical) boxplot in `coord_flip!`, public-facing as `horizontal` keyword
- annotate heatmap / `marklabels!` /`tooltip` function [#59](https://github.com/johnmyleswhite/Vega.jl/issues/59)
- Check inputs to set scales correctly for visualization [#87](https://github.com/johnmyleswhite/Vega.jl/issues/87)
- Fill in `::VegaTransform` type with actual fields
- How to layer plots? [#73](https://github.com/johnmyleswhite/Vega.jl/issues/73)
- Regression line through points [#53](https://github.com/johnmyleswhite/Vega.jl/issues/53)
- Figure out how vega-lite fits in with this package (if at all)

Vega Visualizations:
- Bullet Chart [#47](https://github.com/johnmyleswhite/Vega.jl/issues/47)
- Horizon [#69](https://github.com/johnmyleswhite/Vega.jl/issues/69)
- Treemap
- Force
- Violin plot
- Contour
- Parallel coordinates
- Scatterplot matrix (faceting)
- Barley (faceting)
- Diverging Stacked Bar Chart
- Polar coordinate graph
- Spiderweb graph / radial
- hexbin
- correlation plot
- cluster map

d3 Visualizations (?):

- Create a "cheater" d3 type to use charts from [http://bl.ocks.org/mbostock](http://bl.ocks.org/mbostock) and [https://github.com/mbostock/d3/wiki/Gallery](https://github.com/mbostock/d3/wiki/Gallery) as templates?
- Add chord chart from d3.js (requested at vega/vega project)
- Hexbinning (requested at vega/vega project)
- Sankey from d3.js
- Calendar View Chart from d3.js

Maps:

- 50 United States maps
- 200 Country-level maps (?)
