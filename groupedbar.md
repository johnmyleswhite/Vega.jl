---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Grouped Bar Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
position::Vector{Int}
{% endhighlight %}

### Grouped Bar Chart

{% highlight julia %}
using Vega

category = ["A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C"]
position = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]

gb = groupedbar(x = category, y = value, position = position)
colorscheme!(gb, ("Spectral", 5))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/groupedbar.png" alt = "groupedbar">