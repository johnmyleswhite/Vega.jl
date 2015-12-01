---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# title!

Arguments:

{% highlight julia %}
v::VegaVisualization
title::AbstractString = ""
x::Int = 0
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
for p in JSON.parse(readall(Pkg.dir("Vega", "vega-datasets/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

a = popchart(x = x, y = y, group = group)
{% endhighlight %}

<div id="pop"></div>
<script type="text/javascript">
parse("pop",
	    {"name":"Vega Visualization","height":400,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"height":{"offset":-1,"scale":"y","band":true},"x2":{"value":0,"scale":"x"},"x":{"field":"x","scale":"x"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"update":{"height":{"field":{"group":"height"}},"x":{"field":"key","scale":"g"},"width":{"offset":-30,"scale":"g","band":true},"y":{"value":0}}},"axes":[{"format":"s","type":"x","scale":"x"}],"scales":[{"reverse":{"data":"","field":"reverse"},"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"x"},"type":"linear"}],"from":{"data":"table","transform":[{"groupby":["group"],"type":"facet"},{"field":"reverse","expr":"datum.key==2","type":"formula"}]},"type":"group"},{"properties":{"enter":{"align":{"value":"center"},"x":{"offset":-15,"mult":0.5,"field":{"group":"width"}},"fill":{"value":"#000"},"baseline":{"value":"middle"},"text":{"field":"y"},"y":{"offset":11,"field":"y","scale":"y"}}},"from":{"data":"table","transform":[{"groupby":["y"],"type":"aggregate"}]},"type":"text"}],"data":[{"name":"table","values":[{"x":4619544,"y2":0,"group":1,"y":0},{"x":4589196,"y2":0,"group":2,"y":0},{"x":4465783,"y2":0,"group":1,"y":5},{"x":4390483,"y2":0,"group":2,"y":5},{"x":4057669,"y2":0,"group":1,"y":10},{"x":4001749,"y2":0,"group":2,"y":10},{"x":3774846,"y2":0,"group":1,"y":15},{"x":3801743,"y2":0,"group":2,"y":15},{"x":3694038,"y2":0,"group":1,"y":20},{"x":3751061,"y2":0,"group":2,"y":20},{"x":3389280,"y2":0,"group":1,"y":25},{"x":3236056,"y2":0,"group":2,"y":25},{"x":2918964,"y2":0,"group":1,"y":30},{"x":2665174,"y2":0,"group":2,"y":30},{"x":2633883,"y2":0,"group":1,"y":35},{"x":2347737,"y2":0,"group":2,"y":35},{"x":2261070,"y2":0,"group":1,"y":40},{"x":2004987,"y2":0,"group":2,"y":40},{"x":1868413,"y2":0,"group":1,"y":45},{"x":1648025,"y2":0,"group":2,"y":45},{"x":1571038,"y2":0,"group":1,"y":50},{"x":1411981,"y2":0,"group":2,"y":50},{"x":1161908,"y2":0,"group":1,"y":55},{"x":1064632,"y2":0,"group":2,"y":55},{"x":916571,"y2":0,"group":1,"y":60},{"x":887508,"y2":0,"group":2,"y":60},{"x":672663,"y2":0,"group":1,"y":65},{"x":640212,"y2":0,"group":2,"y":65},{"x":454747,"y2":0,"group":1,"y":70},{"x":440007,"y2":0,"group":2,"y":70},{"x":268211,"y2":0,"group":1,"y":75},{"x":265879,"y2":0,"group":2,"y":75},{"x":127435,"y2":0,"group":1,"y":80},{"x":132449,"y2":0,"group":2,"y":80},{"x":44008,"y2":0,"group":1,"y":85},{"x":48614,"y2":0,"group":2,"y":85},{"x":15164,"y2":0,"group":1,"y":90},{"x":20093,"y2":0,"group":2,"y":90}]}],"scales":[{"name":"g","range":"width","domain":[2,1],"type":"ordinal"},{"reverse":true,"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"ordinal"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":[1,2],"type":"ordinal"}],"width":640,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>

### With title

{% highlight julia %}
title!(a, title = "Gender & Age Comparison - 1900")
{% endhighlight %}

<div id="poptitle"></div>
<script type="text/javascript">
parse("poptitle",
    {"name":"Vega Visualization","height":400,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"height":{"offset":-1,"scale":"y","band":true},"x2":{"value":0,"scale":"x"},"x":{"field":"x","scale":"x"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"update":{"height":{"field":{"group":"height"}},"x":{"field":"key","scale":"g"},"width":{"offset":-30,"scale":"g","band":true},"y":{"value":0}}},"axes":[{"format":"s","type":"x","scale":"x"}],"scales":[{"reverse":{"data":"","field":"reverse"},"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"x"},"type":"linear"}],"from":{"data":"table","transform":[{"groupby":["group"],"type":"facet"},{"field":"reverse","expr":"datum.key==2","type":"formula"}]},"type":"group"},{"properties":{"enter":{"align":{"value":"center"},"x":{"offset":-15,"mult":0.5,"field":{"group":"width"}},"fill":{"value":"#000"},"baseline":{"value":"middle"},"text":{"field":"y"},"y":{"offset":11,"field":"y","scale":"y"}}},"from":{"data":"table","transform":[{"groupby":["y"],"type":"aggregate"}]},"type":"text"},{"properties":{"enter":{"align":{"value":"center"},"fontWeight":{"value":"bold"},"x":{"value":320.0},"font":{"value":""},"fontSize":{"value":16},"fill":{"value":"black"},"baseline":{"value":"top"},"text":{"value":"Gender & Age Comparison - 1900"},"y":{"value":-40}}},"from":{"value":"Gender & Age Comparison - 1900"},"type":"text"}],"data":[{"name":"table","values":[{"x":4619544,"y2":0,"group":1,"y":0},{"x":4589196,"y2":0,"group":2,"y":0},{"x":4465783,"y2":0,"group":1,"y":5},{"x":4390483,"y2":0,"group":2,"y":5},{"x":4057669,"y2":0,"group":1,"y":10},{"x":4001749,"y2":0,"group":2,"y":10},{"x":3774846,"y2":0,"group":1,"y":15},{"x":3801743,"y2":0,"group":2,"y":15},{"x":3694038,"y2":0,"group":1,"y":20},{"x":3751061,"y2":0,"group":2,"y":20},{"x":3389280,"y2":0,"group":1,"y":25},{"x":3236056,"y2":0,"group":2,"y":25},{"x":2918964,"y2":0,"group":1,"y":30},{"x":2665174,"y2":0,"group":2,"y":30},{"x":2633883,"y2":0,"group":1,"y":35},{"x":2347737,"y2":0,"group":2,"y":35},{"x":2261070,"y2":0,"group":1,"y":40},{"x":2004987,"y2":0,"group":2,"y":40},{"x":1868413,"y2":0,"group":1,"y":45},{"x":1648025,"y2":0,"group":2,"y":45},{"x":1571038,"y2":0,"group":1,"y":50},{"x":1411981,"y2":0,"group":2,"y":50},{"x":1161908,"y2":0,"group":1,"y":55},{"x":1064632,"y2":0,"group":2,"y":55},{"x":916571,"y2":0,"group":1,"y":60},{"x":887508,"y2":0,"group":2,"y":60},{"x":672663,"y2":0,"group":1,"y":65},{"x":640212,"y2":0,"group":2,"y":65},{"x":454747,"y2":0,"group":1,"y":70},{"x":440007,"y2":0,"group":2,"y":70},{"x":268211,"y2":0,"group":1,"y":75},{"x":265879,"y2":0,"group":2,"y":75},{"x":127435,"y2":0,"group":1,"y":80},{"x":132449,"y2":0,"group":2,"y":80},{"x":44008,"y2":0,"group":1,"y":85},{"x":48614,"y2":0,"group":2,"y":85},{"x":15164,"y2":0,"group":1,"y":90},{"x":20093,"y2":0,"group":2,"y":90}]}],"scales":[{"name":"g","range":"width","domain":[2,1],"type":"ordinal"},{"reverse":true,"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"ordinal"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":[1,2],"type":"ordinal"}],"width":640,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>

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

<div id="subtitle_"></div>
<script type="text/javascript">
parse("subtitle_",
          {"name":"Vega Visualization","height":300,"padding":"auto","marks":[{"properties":{"enter":{"shape":{"value":"circle"},"x":{"field":"x","scale":"x"},"size":{"mult":30,"field":"y2"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"symbol"},{"properties":{"enter":{"align":{"value":"center"},"fontWeight":{"value":"bold"},"x":{"value":300.0},"font":{"value":""},"fontSize":{"value":16},"fill":{"value":"black"},"baseline":{"value":"top"},"text":{"value":"Sugar and Fat Intake Per Country"},"y":{"value":-40}}},"from":{"value":"Sugar and Fat Intake Per Country"},"type":"text"},{"properties":{"enter":{"align":{"value":"center"},"fontWeight":{"value":""},"x":{"value":300.0},"font":{"value":""},"fontSize":{"value":12},"fill":{"value":"black"},"baseline":{"value":"top"},"text":{"value":"Source: Euromonitor and OECD"},"y":{"value":-20}}},"from":{"value":"Source: Euromonitor and OECD"},"type":"text"},{"properties":{"enter":{"strokeDash":{"value":[5]},"stroke":{"value":"gray"},"x2":{"field":{"group":"width"}},"x":{"field":{"group":"x"}},"strokeWidth":{"value":1.5},"y":{"value":50,"scale":"y"}}},"type":"rule"}],"axes":[{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"x","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":true,"title":"Daily Fat Intake","type":"x","ticks":0},{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"y","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":true,"title":"Daily Sugar Intake","type":"y","ticks":0}],"data":[{"name":"table","values":[{"x":95.0,"y2":13.8,"group":"EU","y":95.0},{"x":86.5,"y2":14.7,"group":"EU","y":102.9},{"x":80.8,"y2":15.8,"group":"EU","y":91.5},{"x":80.4,"y2":12.0,"group":"EU","y":102.5},{"x":80.3,"y2":11.8,"group":"EU","y":86.1},{"x":78.4,"y2":16.6,"group":"EU","y":70.1},{"x":74.2,"y2":14.5,"group":"EU","y":68.5},{"x":73.5,"y2":10.0,"group":"NO","y":83.1},{"x":71.0,"y2":24.7,"group":"EU","y":93.2},{"x":69.2,"y2":10.4,"group":"EU","y":57.6},{"x":68.6,"y2":16.0,"group":"RU","y":20.0},{"x":65.5,"y2":35.3,"group":"US","y":126.4},{"x":65.4,"y2":28.5,"group":"EU","y":50.8},{"x":63.4,"y2":15.4,"group":"EU","y":51.8},{"x":64.0,"y2":31.3,"group":"NZ","y":82.9}]}],"scales":[{"reverse":false,"name":"x","zero":false,"domainMax":100,"domain":{"data":"table","field":"x"},"domainMin":60,"range":"width","type":"linear","round":false},{"reverse":false,"name":"y","zero":false,"domainMax":160,"domain":{"data":"table","field":"y"},"domainMin":10,"range":"height","type":"linear","round":false},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":600,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>