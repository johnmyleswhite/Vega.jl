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

If you are on OS X, the following simpler code should also work for you directly by opening a browser window automatically:

	using Distributions
	using Vega

	plot(x = [1, 2, 3, 4, 5],
		 y = [1, 2, 3, 2, 1],
		 kind = :bar)

	srand(1)
	plot(x = [1:20],
		 y = rand(20),
		 kind = :bar)

	plot(x = [1:100, 1:100],
		 y = [[1:100] + randn(100), 3.0 + 1.5 * [1:100] + randn(100)],
		 group = [[1 for i in 1:100], [2 for i in 1:100]],
		 kind = :line)

	d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
	d2 = MultivariateNormal([10.0, 10.0], [3.0 0.1; 0.1 3.0])
	points = vcat(rand(d1, 500)', rand(d2, 500)')
	x = points[:, 1]
	y = points[:, 2]

	plot(x = x, y = y, kind = :scatter)

	d = rand(Gamma(1.0, 1.0), 1_000_000)
	k = kde(d)
	plot(x = k.x, y = k.density, kind = :area)

	d = rand(Beta(10.0, 8.0), 1_000_000)
	k = kde(d)
	plot(x = k.x, y = k.density, kind = :area)
