---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Rugplot

Function Keywords:

{% highlight julia %}
x::AbstractVector
{% endhighlight %}

### Rugplot

{% highlight julia %}
using Vega, RDatasets

mtcars = dataset("datasets", "mtcars")
x = mtcars[:Disp]

v = rugplot(x = x)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/rugplot.png" alt = "rugplot">