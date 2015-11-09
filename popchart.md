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
for p in JSON.parse(readall(Pkg.dir("Vega", "vega-datasets/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

popchart(x = x, y = y, group = group)
{% endhighlight %}

<div id="pop"></div>
<script type="text/javascript">
parse("pop",
    {"name":"Vega Visualization","height":400,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"height":{"offset":-1,"scale":"y","band":true},"x2":{"value":0,"scale":"x"},"x":{"field":"x","scale":"x"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"update":{"height":{"field":{"group":"height"}},"x":{"field":"key","scale":"g"},"width":{"offset":-30,"scale":"g","band":true},"y":{"value":0}}},"axes":[{"format":"s","type":"x","scale":"x"}],"scales":[{"reverse":{"data":"","field":"reverse"},"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"x"},"type":"linear"}],"from":{"data":"table","transform":[{"groupby":["group"],"type":"facet"},{"field":"reverse","expr":"datum.key==2","type":"formula"}]},"type":"group"},{"properties":{"enter":{"align":{"value":"center"},"x":{"offset":-15,"mult":0.5,"field":{"group":"width"}},"fill":{"value":"#000"},"baseline":{"value":"middle"},"text":{"field":"y"},"y":{"offset":11,"field":"y","scale":"y"}}},"from":{"data":"table","transform":[{"groupby":["y"],"type":"aggregate"}]},"type":"text"}],"data":[{"name":"table","values":[{"x":4619544,"y2":0,"group":1,"y":0},{"x":4589196,"y2":0,"group":2,"y":0},{"x":4465783,"y2":0,"group":1,"y":5},{"x":4390483,"y2":0,"group":2,"y":5},{"x":4057669,"y2":0,"group":1,"y":10},{"x":4001749,"y2":0,"group":2,"y":10},{"x":3774846,"y2":0,"group":1,"y":15},{"x":3801743,"y2":0,"group":2,"y":15},{"x":3694038,"y2":0,"group":1,"y":20},{"x":3751061,"y2":0,"group":2,"y":20},{"x":3389280,"y2":0,"group":1,"y":25},{"x":3236056,"y2":0,"group":2,"y":25},{"x":2918964,"y2":0,"group":1,"y":30},{"x":2665174,"y2":0,"group":2,"y":30},{"x":2633883,"y2":0,"group":1,"y":35},{"x":2347737,"y2":0,"group":2,"y":35},{"x":2261070,"y2":0,"group":1,"y":40},{"x":2004987,"y2":0,"group":2,"y":40},{"x":1868413,"y2":0,"group":1,"y":45},{"x":1648025,"y2":0,"group":2,"y":45},{"x":1571038,"y2":0,"group":1,"y":50},{"x":1411981,"y2":0,"group":2,"y":50},{"x":1161908,"y2":0,"group":1,"y":55},{"x":1064632,"y2":0,"group":2,"y":55},{"x":916571,"y2":0,"group":1,"y":60},{"x":887508,"y2":0,"group":2,"y":60},{"x":672663,"y2":0,"group":1,"y":65},{"x":640212,"y2":0,"group":2,"y":65},{"x":454747,"y2":0,"group":1,"y":70},{"x":440007,"y2":0,"group":2,"y":70},{"x":268211,"y2":0,"group":1,"y":75},{"x":265879,"y2":0,"group":2,"y":75},{"x":127435,"y2":0,"group":1,"y":80},{"x":132449,"y2":0,"group":2,"y":80},{"x":44008,"y2":0,"group":1,"y":85},{"x":48614,"y2":0,"group":2,"y":85},{"x":15164,"y2":0,"group":1,"y":90},{"x":20093,"y2":0,"group":2,"y":90}]}],"scales":[{"name":"g","range":"width","domain":[2,1],"type":"ordinal"},{"reverse":true,"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"ordinal"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":[1,2],"type":"ordinal"}],"width":640,"legends":[{"title":"Group","fill":"group"}]}
    );
</script>