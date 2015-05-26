---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Scatter Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Scatterplot By Group

{% highlight julia %}
using Vega, Distributions

d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [4.0 0.5; 0.5 4.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')

x = points[:, 1]
y = points[:, 2]
group = vcat(ones(Int, 500), ones(Int, 500) + 1)

scatterplot(x = x, y = y, group = group)
{% endhighlight %}
![scatter](https://github.com/johnmyleswhite/Vega.jl/blob/gh-pages/images/scatterplot.png)