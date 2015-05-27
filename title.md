---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# title!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
title::String
{% endhighlight %}

This function mutates `:VegaVisualization`, adding a chart title.

### No title
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

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/popchart.png" alt = "popchart">

### With title

{% highlight julia %}
title!(a, "Gender & Age Comparison - 1900")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/poptitle.png" alt = "lineplot">