---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Grouped Bar Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Grouped Bar Chart

{% highlight julia %}
using Vega, DataFrames

df = DataFrame()
for p in JSON.parse(readall(Pkg.dir("Vega", "deps/vega2/test/data/groups.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

gb = groupedbar(x = df[:category], y = df[:value], group = df[:position])
colorscheme!(gb, ("Spectral", 5))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/groupedbar.png" alt = "groupedbar">