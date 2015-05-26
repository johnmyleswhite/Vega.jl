---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Heatmap

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Heatmap

{% highlight julia %}
n = 30
x = Array(Int, n^2)
y = Array(Int, n^2)
color = Array(Int, n^2)
t = 0
for i in 1:n
    for j in 1:n
        t += 1
        x[t] = i
        y[t] = j
        color[t] = Int(rand() > 0.5)
    end
end

heatmap(x = x, y = y, group = color)
{% endhighlight %}
![heat](https://github.com/johnmyleswhite/Vega.jl/blob/gh-pages/images/heatmap.png)