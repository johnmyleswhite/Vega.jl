Vega.jl
=======

# Introduction

A Julia package for creating the simplest kinds of Vega visualizations. We currently support barebones versions of the following:

* Barplots
* Lineplots
* Scatterplots

# Installation

Because this package depends upon Vega, it is provided as a Git submodule. When you first install this repo, you must then install the Vega submodule. This can be done by calling `Vega.install()`.

# Usage Examples

To see the visualizations generated below, input the JSON that is output by `printjson` into the Vega Live Editor at [http://trifacta.github.io/vega/editor/](http://trifacta.github.io/vega/editor/):

	using Vega

	printjson(barplot([1, 2, 3, 4, 5], [1, 2, 3, 2, 1]))

	srand(1)
	printjson(barplot([1:20], rand(20)))

	printjson(lineplot([1:100, 1:100],
		               [randn(100), 5 + randn(100)],
		               [[1 for i in 1:100], [2 for i in 1:100]]))

	using Distributions
	d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
	d2 = MultivariateNormal([10.0, 10.0], [2.0 0.1; 0.1 2.0])
	points = vcat(rand(d1, 250)', rand(d2, 250)')
	x = points[:, 1]
	y = points[:, 2]

	printjson(scatterplot(x, y, width = 500, height = 500))

If you are on OS X, the following simpler code should also work for you directly by opening a browser window:

	using Vega

	barplot([1, 2, 3, 4, 5], [1, 2, 3, 2, 1])

	srand(1)
	barplot([1:20], rand(20))

	lineplot([1:100, 1:100],
		     [randn(100), randn(100)],
		     [[1 for i in 1:100], [2 for i in 1:100]])

	using Distributions
	d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
	d2 = MultivariateNormal([10.0, 10.0], [1.0 0.1; 0.1 1.0])
	points = vcat(rand(d1, 250)', rand(d2, 250)')
	x = points[:, 1]
	y = points[:, 2]

	scatterplot(x, y, width = 500, height = 500)
