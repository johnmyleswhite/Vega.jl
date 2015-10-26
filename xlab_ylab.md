---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# xlab! / ylab!

Arguments:

{% highlight julia %}
v::VegaVisualization
title::AbstractString = ""
grid::Bool = false
ticks::Number = 0
format::AbstractString = ""
layer::AbstractString = "front",
properties::Dict = Dict{Any, Any}
tickSize::Number = 0
tickSizeMajor::Number = 0
tickSizeMinor::Number = 0
tickSizeEnd::Number = 0
{% endhighlight %}

This function mutates `:VegaVisualization`, adding/modifying the X axis or Y axis.

### Default Axis labels
{% highlight julia %}
using Vega

x = [1:100; 1:100]
y = [[1:100] + randn(100); 3.0 + 1.5 * [1:100] + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

v = lineplot(x = x, y = y, group = group)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplot.png" alt = "lineplot">

### Modified Axis labels

{% highlight julia %}
xlab!(v, title = "Weight (kg)")
ylab!(v, title = "Height (cm)")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplotaxis.png" alt = "lineplot">