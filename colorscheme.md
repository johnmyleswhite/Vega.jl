---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# colorscheme!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
palette::Union(Tuple{AbstractString,Int64}, AbstractString, Array)
{% endhighlight %}

This function mutates `:VegaVisualization`, modifying the colors for the `group` or `fill` properties of the visualization. The `palette` argument supports:

	* Tuple{AbstractString,Int64}: A ColorBrewer theme and number of color levels desired
	* AbstractString: A string representing a color the browser understands (i.e. "Pink", "#FFF")
	* Array: An array of colors (i.e. ["Red", "Green"])

### ColorBrewer scale
{% highlight julia %}
using Vega

ab = barplot(x = [1:20], y = rand(20), group = vcat([1 for i in 1:10], [2 for i in 1:10]))
colorscheme!(ab, palette = ("Purples", 3))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barcolorbrewerpurple.png" alt = "barcolorbrewerpurple">

### Single Color

{% highlight julia %}
using Vega

srand(1)
a = barplot(x = [1:20], y = rand(20))
colorscheme!(a, palette = "Violet")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barviolet.png" alt = "barviolet">

### Array of Colors

{% highlight julia %}
using DataFrames, JSON, Vega

df = DataFrame()
for p in JSON.parse(readall(Pkg.dir("Vega", "deps/vega2/test/data/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

pc1 = popchart(x = x, y = y, group = group)
colorscheme!(pc1, palette = ["Green", "Red"])
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/bararray.png" alt = "bararray">
