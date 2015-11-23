---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# General Visualization Properties

There are several commonly-used visualization properties in top-level [`::VegaVisualization` type](http://johnmyleswhite.github.io/Vega.jl/primitives.html) such as `width` and `height`. Given that these are accessible from the high-level Julia composite type (i.e. the return type of every Vega plot), it doesn't make sense to replicate these features as separate mutating functions.

For the most part, these properties have sensible defaults for working from Jupyter Notebook or from the REPL (which opens a new browser/tab); changing them is as simple as accessing the fields directly in the `::VegaVisualization` composite type.

### Height

Keyword:
{% highlight julia %}
height::Int
{% endhighlight %}

{% highlight julia %}
v = barplot(x = x, y = y)
v.height = 700
{% endhighlight %}

### Width

Keyword:
{% highlight julia %}
width::Int
{% endhighlight %}

{% highlight julia %}
v2 = barplot(x = x, y = y)
v2.width = 1000
{% endhighlight %}

### Background

The default for background is `transparent`, which can become an issue when you download PNG files. Set background to white or the desired color of your background is this is an issue.

Keyword:
{% highlight julia %}
background::AbstractString
{% endhighlight %}

{% highlight julia %}
v2 = barplot(x = x, y = y)
v2.background = "green"
{% endhighlight %}

### Padding

Padding is an awkward union of CSS padding through the `::VegaPadding` type, a single number for even padding all around the plot. The default is "auto", which should be sufficient for most cases.

Keyword:
{% highlight julia %}
padding::Union(VegaPadding, Number, String)
{% endhighlight %}

{% highlight julia %}
v3 = barplot(x = x, y = y)
v3.padding = 10
{% endhighlight %}

### Viewport

It is possible to change the portion of the graph shown, without changing the actual graph size. This is useful if you want to highlight a specific portion of the graph, but in practice it's rarely used.

Keyword:
{% highlight julia %}
viewport::Vector{Int}
{% endhighlight %}


