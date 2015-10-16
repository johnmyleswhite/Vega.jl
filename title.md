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

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/poptitle.png" alt = "poptile">

### Add subtitle
In Vega, there are only concepts of "marks". What this implies is, you can continually add additional marks as desired, such as for a subtitle.

In Vega.jl, to add a subtitle (or multiple!), just change the y offset value. The larger the value (i.e. less negative until you cross over 0), the further DOWN the chart the title will be located. Note that there is nothing that keeps the titles from overlapping the chart; if you find the text to be in a sub-optimal location, just keep modifying the y parameter until you get the desired outcome.

{% highlight julia %}
x = [95, 86.5, 80.8, 80.4, 80.3, 78.4, 74.2, 73.5, 71, 69.2, 68.6, 65.5, 65.4, 63.4, 64]
y = [95, 102.9, 91.5, 102.5, 86.1, 70.1, 68.5, 83.1, 93.2, 57.6, 20, 126.4, 50.8, 51.8, 82.9]
cont = ["EU", "EU", "EU", "EU", "EU", "EU", "EU", "NO", "EU", "EU", "RU", "US", "EU", "EU", "NZ"]
z = [13.8, 14.7, 15.8, 12, 11.8, 16.6, 14.5, 10, 24.7, 10.4, 16, 35.3, 28.5, 15.4, 31.3]


v = bubblechart(x = x, y = y, group = cont, pointSize = z)

#Chart mods
v.width = 600
v.height = 300
xlim!(v, min = 60, max = 100)
ylim!(v, min = 10, max = 160)
#Main title
title!(v, title = "Sugar and Fat Intake Per Country")
#Subtitle - just change y offset, and fontSize/Weight if desired
title!(v, title = "Source: Euromonitor and OECD", y = -20, fontSize = 12, fontWeight = "")
ylab!(v, title = "Daily Sugar Intake", grid = true)
xlab!(v, title = "Daily Fat Intake", grid = true)
hline!(v, value = 50, strokeDash = 5, stroke = "gray")
vline!(v, value = 65, strokeDash = 5, stroke = "gray")
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/subtitle.png" alt = "subtitle">

