---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bar Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
y2::AbstractVector
group::AbstractVector
stacked::Bool = false
{% endhighlight %}

### No Group Argument
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

barplot(x = x, y = y)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barplot.png" alt = "barplot" >

### Group Argument
{% highlight julia %}
using Vega

x = [1:20]
y = rand(20)
group = [round(val/10) for val in x]

barplot(x = x, y = y, group = group)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/groupbar.png" alt = "groupedbar">

### Stacked Bar (with additional `colorscheme!` change)
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

barplot(x = x, y = y, group = g, stacked = true)
colorscheme!(b, ("Greens", 3))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/stackedbar.png" alt = "stackedbar">
