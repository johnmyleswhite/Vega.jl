---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bubble Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Bubble Chart

Example data taken from the <a href="http://www.highcharts.com/demo/bubble">High Charts Bubble Chart</a> example, with some modifications
{% highlight julia %}
x = [95, 86.5, 80.8, 80.4, 80.3, 78.4, 74.2, 73.5, 71, 69.2, 68.6, 65.5, 65.4, 63.4, 64]
y = [95, 102.9, 91.5, 102.5, 86.1, 70.1, 68.5, 83.1, 93.2, 57.6, 20, 126.4, 50.8, 51.8, 82.9]
cont = ["EU", "EU", "EU", "EU", "EU", "EU", "EU", "NO", "EU", "EU", "RU", "US", "EU", "EU", "NZ"]
z = [13.8, 14.7, 15.8, 12, 11.8, 16.6, 14.5, 10, 24.7, 10.4, 16, 35.3, 28.5, 15.4, 31.3]

v = bubblechart(x = x, y = y, group = cont, size = z)

#Chart mods
v.width = 600
v.height = 300
xlim!(v, min = 60, max = 100)
ylim!(v, min = 10, max = 160)
title!(v, title = "Sugar and Fat Intake Per Country")
ylab!(v, title = "Daily Sugar Intake", grid = true)
xlab!(v, title = "Daily Fat Intake", grid = true)
hline!(v, value = 50, strokeDash = 5, stroke = "gray")
vline!(v, value = 65, strokeDash = 5, stroke = "gray")
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/bubblechart.png" alt="bubblechart">