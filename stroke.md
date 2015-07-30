---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# stroke!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
{% endhighlight %}

Function Keywords:

{% highlight julia %}
color::String = "Black"
width::Real = 0.75
opacity::Real = 1
visible::Bool = true
{% endhighlight %}

This function mutates `:VegaVisualization`, adding borders around `:VegaMarks`.

### No stroke
{% highlight julia %}
using Vega, DataFrames
df = readtable(Pkg.dir("Vega", "deps/vega/examples/data/unemployment.tsv"))

v = choropleth(x = df[:id], y = df[:rate])
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/choropleth.png" alt = "choropleth">

### Stroke

{% highlight julia %}
using Vega, DataFrames
df = readtable(Pkg.dir("Vega", "deps/vega2/test/data/unemployment.tsv"))

v = choropleth(x = df[:id], y = df[:rate])
stroke!(v)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/choroplethstroke.png" alt = "choroplethstroke">