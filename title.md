---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# title!

Arguments:

{% highlight julia %}
v::VegaVisualization
title::AbstractString = ""
y::Int = -40
fill::AbstractString = "black"
fontSize::Int = 16
align::AbstractString = "center"
baseline::AbstractString = "top"
fontWeight::AbstractString = "bold"
font::AbstractString = ""
{% endhighlight %}

This function mutates `:VegaVisualization`, adding/modifying a chart title.

### No title
{% highlight julia %}
using Vega, DataFrames, JSON

df = DataFrame()
for p in JSON.parse(readall(Pkg.dir("Vega", "deps/vega2/test/data/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

a = popchart(x = x, y = y, group = group)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/popchart.png" alt = "popchart">

### With title

{% highlight julia %}
title!(a, "Gender & Age Comparison - 1900")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/poptitle.png" alt = "lineplot">