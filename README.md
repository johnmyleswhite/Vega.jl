Vega.jl
=======
[![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl)[![Vega](http://pkg.julialang.org/badges/Vega_0.4.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.4)

# Introduction

A Julia package for creating Vega visualizations. Convenience functions for common visualizations are provided, while also allowing for unlimited customization through modification of the main `VegaVisualization` composite type.

At a high-level, my hope with this package is to provide an easy-to-use library to quickly make common visualizations, while also including some of the interactivity provided as part of the Vega 2 project. This package also provides a declarative syntax that deviates from Grammar-of-Graphics style packages.

# Installation

	Pkg.add("Vega")
	using Vega

Currently, an Internet connection is required to use Vega.jl, as the required JavaScript libraries are delivered from a CDN.

# Documentation

For examples of the current functionality of Vega.jl, please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/)

# TODO/Contributing

I would love to collaborate with anyone interested in interactive graphics and simplistic APIs.

Here's the current TODO list (along with the [GitHub issues](https://github.com/johnmyleswhite/Vega.jl/issues)); of course, any contribution, on this list or not, is greatly appreciated!

To Do:

Functions/Types:

- Add keyword arguments to visualizations for commonly used features [#53](https://github.com/johnmyleswhite/Vega.jl/issues/53)
- area, (vertical) boxplot in `coord_flip!`
- colorscheme! for `boxplot`
- Fill in Vega `transform` type with actual fields
- error bars/shading around lines
- change icon type (circles, triangles, etc.)
- How to layer plots?
- How to incorporate interactive features of Vega? `tooltip` function seems useful
- Create a "cheater" d3 type to use charts from [http://bl.ocks.org/mbostock](http://bl.ocks.org/mbostock) and [https://github.com/mbostock/d3/wiki/Gallery](https://github.com/mbostock/d3/wiki/Gallery) as templates?

Vega Visualizations:

- Bubble Chart
- Bullet Chart [#47](https://github.com/johnmyleswhite/Vega.jl/issues/47)
- Dotplot/Error [#49](https://github.com/johnmyleswhite/Vega.jl/issues/49)
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

d3 Visualizations:

- Add chord chart from d3.js
- Sankey from d3.js
- Calendar View Chart from d3.js

Maps:

- US State
- State-level
- Country-level (by pull request from someone else!)

Value unclear:

- Switch to Nullable Types
- Sanitize inputs to be correct for visualization
- change add_data! to not add zeroes everywhere there are blanks
- Arc visualization
- overload Base.+ with pipe operator to mimic ggplot syntax
- Have global settings similar to Seaborn/Gadfly themes
- Integrate with DataFrames more in-depth
- control charts ~~[#41](https://github.com/johnmyleswhite/Vega.jl/issues/41)~~
- `yticks!`, `xticks!` function (covered by keyword arguments on `xlab!` and `ylab!` I think)
