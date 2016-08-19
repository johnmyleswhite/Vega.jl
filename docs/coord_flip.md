---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# coord_flip!

Function Keywords:

{% highlight julia %}
v::VegaVisualization
{% endhighlight %}

The purpose of this function is effectively to rotate a bar chart 90 degrees to the right, creating a horizontal bar chart from a vertical bar chart. This function is exported for completeness, but for clarity, it's probably easier to just use the `horizontal` keyword argument for [`barchart`](http://johnmyleswhite.github.io/Vega.jl/barplot.html) or [`histogram`](http://johnmyleswhite.github.io/Vega.jl/histogram.html).

### Histogram

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 1_000_000)

v = histogram(x = x)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/histogram.png" alt = "histogram" >

### Histogram - Rotated

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 1_000_000)

v = histogram(x = x)
coord_flip!(v)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/histh.png" alt = "histh">