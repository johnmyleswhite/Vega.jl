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
![hist](/images/histogram.png)

### Histogram - Relative Frequency

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 1_000_000)

v = histogram(x = x, relativefreq = true)
{% endhighlight %}
![histrel](https://github.com/johnmyleswhite/Vega.jl/blob/gh-pages/images/histogram_rel.png)