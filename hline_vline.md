---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# hline! / vline!

Arguments:

{% highlight julia %}
v::VegaVisualization
value::Real = 0
strokeWidth::Real = 1.5
stroke::AbstractString = "#000"
strokeDash::Real = 0
{% endhighlight %}

This function mutates `:VegaVisualization`, adding a horizontal/vertical line at a specified location.

### Default Chart
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = areaplot(x = x, y = y, group = g, stacked = true)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplot.png" alt = "hline">

### With horizontal lines

{% highlight julia %}
hline!(a, value = 60.25, strokeDash = 3)
hline!(a, value = 80, strokeDash = 5)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/hline.png" alt = "hline">