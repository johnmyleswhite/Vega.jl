---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Line Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
points::Bool = false
pointShape::AbstractString = "circle"
pointSize::Real = 10
{% endhighlight %}

### Multiple Lines In Single Plot
{% highlight julia %}
using Vega

x = [1:100; 1:100]
y = [[1:100] + randn(100); 3.0 + 1.5 * [1:100] + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

lineplot(x = x, y = y, group = group)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/lineplot.png" alt = "lineplot">

### Adding Points
{% highlight julia %}
lineplot(x = x, y = y, group = group, points = true)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/linewithpoints.png" alt = "lineplotwithpoints">

### Making Points Larger
{% highlight julia %}
lineplot(x = x, y = y, group = group, points = true, pointSize = 20)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/linewithbiggerpoints.png" alt = "lineplotbiggerpoints">