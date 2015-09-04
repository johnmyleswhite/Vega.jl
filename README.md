Vega.jl
=======
[![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl)[![Vega](http://pkg.julialang.org/badges/Vega_0.3.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.3)[![Vega](http://pkg.julialang.org/badges/Vega_0.4.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.4)

# Introduction

A Julia package for creating Vega visualizations. Convenience functions for common visualizations are provided, while also allowing for unlimited customization through modification of the main `VegaVisualization` composite type.

# Installation

This package depends upon [Vega.js](https://github.com/vega/vega) from Trifacta and is provided automatically within Vega.jl.

	Pkg.add("Vega")
	using Vega

# Documentation

For documentation of the current functionality of this package, please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/)

# TODO/Contributing

I would love to collaborate with anyone interested in interactive graphics and simplistic APIs. Here's the current TODO list; of course, any contribution, on this list or not, is greatly appreciated!

High-level Goals:
- Achieve Python Vincent functionality (pretty close, if not already there)
- Achieve Seaborn functionality
- All basic charts from d3 website

To Do:

Functions/Types:
- Move all `legend` attributes into one function
- `yticks!`, `xticks!` function
- Vega `transform` type (correctly)
- Vega `format` type (correctly)
- Keyword options for `title!`, `xlab!/ylab!`, `legend!`
- Add keyword arguments to visualizations for commonly used features
- error bars/shading around lines
- change icon type (circles, triangles, etc.)
- grouped bar horizontal, area in `coord_flip!`
- How to layer plots?
- Make all functions have keyword arguments, with only v::VegaVisualization the required argument

Visualizations:

- Force
- State choropleth
- Bullet Chart
- Boxplot / Horizontal Boxplot / Grouped Boxplot
- Add chord chart from d3.js
- Sankey from d3.js
- Calendar View Chart from d3.js
- Rug plot
- Weather
- parallel coordinates
- Treemap
- Error
- Jobs
- Scatterplot matrix (faceting)
- Barley (Faceting)
- Bubble Chart
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
- control charts

Value unclear:
- Switch to Nullable Types
- Sanitize inputs to be correct for visualization
- change add_data! to not add zeroes everywhere there are blanks
- Arc visualization
- overload Base.+ with pipe operator to mimic ggplot syntax
- Have global settings for size similar to Seaborn/Gadfly themes
- Integrate with DataFrames more in-depth
