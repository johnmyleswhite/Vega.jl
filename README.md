Vega.jl
=======
[![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl)[![Vega](http://pkg.julialang.org/badges/Vega_0.4.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.4)

# Introduction

A Julia package for creating Vega visualizations. Convenience functions for common visualizations are provided, while also allowing for unlimited customization through modification of the main `VegaVisualization` composite type.

At a high-level, Vega.jl is designed to provide an easy-to-use library to quickly make common visualizations, while also including some of the interactivity provided as part of the Vega 2.x JavaScript library. This package also provides a declarative syntax that deviates from [Grammar-of-Graphics](https://www.cs.uic.edu/~wilkinson/TheGrammarOfGraphics/GOG.html) style packages.

# Installation

	Pkg.add("Vega")
	using Vega

Currently, an Internet connection is required to use Vega.jl through Jupyter Notebook, as the required JavaScript libraries are delivered from a CDN. Using Vega from the REPL will work without an Internet connection.

# Documentation

For examples of the current functionality of Vega.jl, please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/)

# TODO/Contributing

Here's the current TODO list (along with the [GitHub issues](https://github.com/johnmyleswhite/Vega.jl/issues)); of course, any contribution, on this list or not, is greatly appreciated!

To Do:

Functions/Types:

- area, (vertical) boxplot in `coord_flip!`, public-facing as `horizontal` keyword
- Fill in `::VegaTransform` type with actual fields
- How to layer plots?
- error bars/shading around lines, regression line [#53](https://github.com/johnmyleswhite/Vega.jl/issues/53)
- How to incorporate interactive features of Vega? `tooltip` function seems useful
- Create a "cheater" d3 type to use charts from [http://bl.ocks.org/mbostock](http://bl.ocks.org/mbostock) and [https://github.com/mbostock/d3/wiki/Gallery](https://github.com/mbostock/d3/wiki/Gallery) as templates?

Vega Visualizations:
- Bullet Chart [#47](https://github.com/johnmyleswhite/Vega.jl/issues/47)
- Dotplot/Error [#49](https://github.com/johnmyleswhite/Vega.jl/issues/49)
- Horizon [#69](https://github.com/johnmyleswhite/Vega.jl/issues/69)
- Contour
- Weather
- parallel coordinates
- Treemap
- Force
- Jobs
- Scatterplot matrix (faceting)
- Barley (Faceting)
- Lifelines
- Aster plot
- Diverging Stacked Bar Chart
- polar coordinate graph
- spiderweb graph / radial
- annotate heatmap
- joint density plot / hexbin
- correlation plot
- violin plot
- cluster map

d3 Visualizations (?):

- Add chord chart from d3.js (requested at vega/vega project)
- Hexbinning (requested at vega/vega project)
- Sankey from d3.js
- Calendar View Chart from d3.js

Maps:

- State-level
- Country-level (by pull request from someone else!)

Value unclear (but still possible):

- Switch to Nullable Types
- Sanitize inputs to be correct for visualization
- change add_data! to not add zeroes everywhere there are blanks
- overload Base.+ with pipe operator to mimic ggplot syntax
- Have global settings similar to Seaborn/Gadfly themes
- Integrate with DataFrames more in-depth
- control charts ~~[#41](https://github.com/johnmyleswhite/Vega.jl/issues/41)~~
- `yticks!`, `xticks!` function (covered by keyword arguments on `xlab!` and `ylab!` I think)
