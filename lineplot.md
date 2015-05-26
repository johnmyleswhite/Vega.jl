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
{% endhighlight %}

### Multiple Lines In Single Plot
{% highlight julia %}
using Vega

x = [1:100; 1:100]
y = [[1:100] + randn(100); 3.0 + 1.5 * [1:100] + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

lineplot(x = x, y = y, group = group)
{% endhighlight %}
![barplot](/images/lineplot.png)