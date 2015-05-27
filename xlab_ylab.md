---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# xlab! / ylab!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
title::String
{% endhighlight %}

This function mutates `:VegaVisualization`, adding/modifying a label of the X axis or Y axis.

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
xlab!(v, "Weight (kg)")
ylab!(v, "Height (cm)")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplotaxis.png" alt = "lineplot">