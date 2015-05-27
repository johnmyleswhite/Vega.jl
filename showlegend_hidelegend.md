---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# showlegend! / hidelegend!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
{% endhighlight %}

### Default to showing legend
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

v = barplot(x = x, y = y)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barplot.png" alt = "barplot" >

### Hide Legend
{% highlight julia %}
hidelegend!(v)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barnolegend.png" alt = "barplot" >

### Show Legend
{% highlight julia %}
showlegend!(v)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barplot.png" alt = "barplot" >