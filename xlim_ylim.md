---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# xlim! / ylim!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
min::Real
max::Real
{% endhighlight %}

This function mutates `:VegaVisualization`, modifying the min/max of the axes.

### Default Axis limits
{% highlight julia %}
using Vega

x = [1:100; 1:100]
y = [[1:100] + randn(100); 3.0 + 1.5 * [1:100] + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

v = lineplot(x = x, y = y, group = group)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplot.png" alt = "lineplot">

### Modified Axis limits

{% highlight julia %}
xlim!(v, 0, 200)
ylim!(v, 0, 200)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplotlimits.png" alt = "lineplot">