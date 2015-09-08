---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Visualization Primitives

At the most fundamental level, Vega.jl translates the Vega grammar into a series of Julia composite types as primitives to build upon. This allows for users to build visualizations using familiar Julia syntax, without having to worry about how those types translate into JSON.

For example, here is the highest-level composite type defined, `:VegaVisualization`:

{% highlight julia %}
type VegaVisualization
	name::String
	width::Int
	height::Int
	padding::Union(VegaPadding, Number, String)
	viewport::Vector{Int}
	data::Vector{VegaData}
	scales::Vector{VegaScale}
	axes::Vector{VegaAxis},
	marks::Vector{VegaMark},
	legends::Vector{VegaLegend}
end
{% endhighlight %}

This is a one-to-one mapping of the grammar outlined in the Vega Documentation for [Visualization](https://github.com/vega/vega/wiki).

## Defined Primitives in Julia

The following primitives have been defined in Julia, to correspond to the types outlined in the Vega.js documentation. See link to Vega documentation to understand structure of each type (or view [Vega.jl primitives source code](https://github.com/johnmyleswhite/Vega.jl/tree/master/src/primitives))

* [VegaVisualization](https://github.com/vega/vega/wiki/Visualization)
* [VegaData](https://github.com/vega/vega/wiki/Data)
* [VegaScale](https://github.com/vega/vega/wiki/Scales)
* [VegaAxis](https://github.com/vega/vega/wiki/Axes)
* [VegaLegend](https://github.com/vega/vega/wiki/Legends)
* [VegaMark](https://github.com/vega/vega/wiki/Marks)
