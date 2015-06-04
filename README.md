Vega.jl
=======
[![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl)[![Vega](http://pkg.julialang.org/badges/Vega_release.svg)](http://pkg.julialang.org/?pkg=Vega&ver=release)

# Introduction

A Julia package for creating Vega visualizations. We currently support barebones versions of the following:

* Area plots
* Bar plots/Histograms
* Line plots
* Scatter plots
* Pie/Donut charts
* Waterfall
* Wordclouds

In addition, this package wraps Vega's pseudo-type system inside of Julia types. This will eventually provide tools for manipulating graphics with a higher level of control over layout.

# Installation

This package depends upon [Vega.js](https://github.com/trifacta/vega) from Trifacta and is provided automatically within Vega.jl. If you want to upgrade the library yourself, be sure that the file structure remains the same.

	Pkg.add("Vega")
	using Vega

# Documentation

For documentation of the current functionality of this package, please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/)