---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Heatmap

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
color::AbstractVector
{% endhighlight %}

### Heatmap

{% highlight julia %}
x = Array(Int, 900)
y = Array(Int, 900)
color = Array(Float64, 900)

t = 0
for i in 1:30
    for j in 1:30
        t += 1
        x[t] = i
        y[t] = j
        color[t] = rand()
    end
end

hm = heatmap(x = x, y = y, color = color)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/heatmap.png" alt = "heatmap">