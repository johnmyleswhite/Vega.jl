---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Population Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
{% endhighlight %}

### Population Chart

{% highlight julia %}
using Vega, DataFrames, JSON

df = DataFrame()
for p in JSON.parse(readall(Pkg.dir("Vega", "deps/vega/examples/data/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

popchart(x = x, y = y, group = group)
{% endhighlight %}

![pop](/images/popchart.png)