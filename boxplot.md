---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Box Plot

Function Keywords:

{% highlight julia %}
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Single Box Plot
{% highlight julia %}
using RDatasets, Vega
df = dataset("datasets", "mtcars")

boxplot(y = df[:MPG])
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/boxplot.png" alt = "boxplot" >

### Grouped Box Plot
{% highlight julia %}
using RDatasets, Vega
df = dataset("datasets", "mtcars")

boxplot(y = df[:MPG], group = df[:Cyl])
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/groupedbox.png" alt = "groupedbox" >