---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Pie/Donut Chart

Function Keywords:

{% highlight julia %}
x::AbstractArray
y::AbstractArray
holesize::Int = 175
{% endhighlight %}

### Pie Chart

{% highlight julia %}
using Vega

fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]

piechart(x = fruit, y = bushels)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/piechart.png" alt = "piechart">

### Donut Chart

{% highlight julia %}
using Vega

fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]

piechart(x = fruit, y = bushels, holesize = 175)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/donutchart.png" alt = "donut">