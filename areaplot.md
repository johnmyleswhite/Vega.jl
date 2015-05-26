---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Area Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Area Plot

{% highlight julia %}
using Vega, KernelDensity, Distributions

x = rand(Beta(3.0, 2.0), 1_000_000)
k = kde(x)

areaplot(x = k.x, y = k.density)
{% endhighlight %}
![area](/images/areaplot.png)
