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
stacked::Bool = false
pct100::Bool = false
{% endhighlight %}

### Area Plot

{% highlight julia %}
using Vega, KernelDensity, Distributions

x = rand(Beta(3.0, 2.0), 1_000_000)
k = kde(x)

areaplot(x = k.x, y = k.density)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/areaplot.png" alt="areaplot">

### Stacked Area (with additional `colorscheme!` change)

{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = areaplot(x = x, y = y, group = g, stacked = true)
colorscheme!(a, ("Reds", 3))
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/stackedarea.png" alt="stackedarea">

### 100% Stacked Area

{% highlight julia %}
a = areaplot(x = x, y = y, group = g, stacked = true, pct100 = true)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/100pctstackedarea.png" alt="100pctstackedarea">