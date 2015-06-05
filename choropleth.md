---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Choropleth

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
{% endhighlight %}

{% highlight julia %}
using Vega, DataFrames
df = readtable(Pkg.dir("Vega", "deps/vega/examples/data/unemployment.tsv"))

v = choropleth(x = df[:id], y = df[:rate])
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/choropleth.png" alt = "choropleth">