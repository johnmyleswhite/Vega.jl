---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Stream Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Stream Plot

{% highlight julia %}
df = readtable(Pkg.dir("Vega", "vega-datasets/streamdata.csv"))
a = streamplot(x = df[:date], y = df[:value], group = df[:key])
colorscheme!(a, palette = ["#B30000", "#E34A33", "#FC8D59", "#FDBB84", "#FDD49E", "#FEF0D9"])
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/streamplot.png" alt="streamplot">