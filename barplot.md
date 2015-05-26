---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bar Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### No Group Argument
{% highlight julia %}
using Vega
x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]
barplot(x = x, y = y)
{% endhighlight %}

![barplot](http://johnmyleswhite.github.io/Vega.jl/images/barplot.png)

### Group Argument
{% highlight julia %}
using Vega
x = [1:20]
y = rand(20)
group = [round(val/10) for val in x]
barplot(x = x, y = y, group = group)
{% endhighlight %}

![barplot](http://johnmyleswhite.github.io/Vega.jl/images/groupbar.png)