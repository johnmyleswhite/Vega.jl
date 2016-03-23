Vega.jl
=======
OSX/Linux: [![Build Status](https://travis-ci.org/johnmyleswhite/Vega.jl.svg?branch=master)](https://travis-ci.org/johnmyleswhite/Vega.jl) </br>
pkg.julialang.org: [![Vega](http://pkg.julialang.org/badges/Vega_0.4.svg)](http://pkg.julialang.org/?pkg=Vega&ver=0.4) </br>
Windows 64-bit: [![Build status](https://ci.appveyor.com/api/projects/status/5rdwxsajxo5ybbfn?svg=true)](https://ci.appveyor.com/project/randyzwitch/vega-jl)


# Introduction

A Julia package for creating Vega visualizations. Convenience functions for common visualizations are provided, while also allowing for unlimited customization through modification of the main `VegaVisualization` composite type.

At a high-level, Vega.jl is designed to provide an easy-to-use library to quickly make common visualizations, while also including some of the interactivity provided as part of the Vega 2.x JavaScript library. This package also provides a declarative syntax that deviates from [Grammar-of-Graphics](https://www.cs.uic.edu/~wilkinson/TheGrammarOfGraphics/GOG.html) style packages.

This package is unrelated to [VegaLite.jl](https://github.com/fredo-dedup/VegaLite.jl), other than to have the same underlying vega JavaScript engine. Perhaps that will change in the future as cross-package efficiencies become more obvious!

# Installation

	Pkg.add("Vega")
	using Vega

Using Vega from the REPL/Atom will work with or without an Internet connection, as the required JavaScript libraries are injected into the HTML before the browser is opened (automatically).

In order to use Jupyter Notebook offline, you will need to set up a shortcut/softlink to the Julia libraries named `vegajl`; for example, to serve notebooks from the folder `ijulia_notebooks` on OSX, run the following at the OSX Terminal (substituting the proper directory links of course):

	ln -s /Users/randyzwitch/.julia/v0.4/Vega /Users/randyzwitch/ijulia_notebooks/vegajl

# Documentation

Please see the [documentation](http://johnmyleswhite.github.io/Vega.jl/), which is rendered on-the-fly using Vega code generated from Vega.jl

# TODO/Contributing

[GitHub issues](https://github.com/johnmyleswhite/Vega.jl/issues) has a To-Do list of visualizations and open bugs/feature requests; of course, any contribution is welcomed!
