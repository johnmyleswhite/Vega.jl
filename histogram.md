---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Histogram

Function Keywords:

{% highlight julia %}
x::AbstractVector
relativefreq::Bool
{% endhighlight %}

### Histogram

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 1_000_000)

v = histogram(x = x)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/histogram.png" alt = "histogram" >

### Histogram - Relative Frequency

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 1_000_000)

v = histogram(x = x, relativefreq = true)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/histogram_rel.png" alt = "histrel">