---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Pie/Donut Chart

Function Keywords:

{% highlight julia %}
x::AbstractArray
y::AbstractArray
holesize::Int
{% endhighlight %}

### Pie Chart

{% highlight julia %}
using Vega

fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]

piechart(x = fruit, y = bushels)
{% endhighlight %}

![pie](https://github.com/johnmyleswhite/Vega.jl/blob/gh-pages/images/piechart.png)

### Donut Chart

{% highlight julia %}
using Vega

fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]

piechart(x = fruit, y = bushels, holesize = 175)
{% endhighlight %}

![donut](https://github.com/johnmyleswhite/Vega.jl/blob/gh-pages/images/donutchart.png)