---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# colorscheme!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
palette::Union(Tuple{AbstractString,Int64}, AbstractString, Array)
reversePalette::Bool = false
{% endhighlight %}

This function mutates `:VegaVisualization`, modifying the colors for the `group` or `fill` properties of the visualization. The `palette` argument supports:

	* Tuple{AbstractString,Int64}: A ColorBrewer theme and number of color levels desired
	* AbstractString: A string representing a color the browser understands (i.e. "Pink", "#FFF")
	* Array: An array of colors (i.e. ["Red", "Green"])

### ColorBrewer scale
{% highlight julia %}
using Vega

ab = barplot(x = collect(1:20), y = rand(20), group = vcat([1 for i in 1:10], [2 for i in 1:10]))
colorscheme!(ab, palette = ("Purples", 3))
{% endhighlight %}

<div id="purple"></div>
<script type="text/javascript">
parse("purple",
    {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":0.8513796776202947},{"x":2,"y2":0,"group":1,"y":0.2625870861178603},{"x":3,"y2":0,"group":1,"y":0.9724565473384092},{"x":4,"y2":0,"group":1,"y":0.015489300595124655},{"x":5,"y2":0,"group":1,"y":0.2322286982937969},{"x":6,"y2":0,"group":1,"y":0.8186993719743252},{"x":7,"y2":0,"group":1,"y":0.8449349512662294},{"x":8,"y2":0,"group":1,"y":0.11070149212729241},{"x":9,"y2":0,"group":1,"y":0.3363164971342141},{"x":10,"y2":0,"group":1,"y":0.11479303595540746},{"x":11,"y2":0,"group":2,"y":0.7336879076495093},{"x":12,"y2":0,"group":2,"y":0.796077249393629},{"x":13,"y2":0,"group":2,"y":0.7599214628249928},{"x":14,"y2":0,"group":2,"y":0.5830675502045222},{"x":15,"y2":0,"group":2,"y":0.07028149908563153},{"x":16,"y2":0,"group":2,"y":0.37499661502958626},{"x":17,"y2":0,"group":2,"y":0.23561976542903285},{"x":18,"y2":0,"group":2,"y":0.15851353408668123},{"x":19,"y2":0,"group":2,"y":0.6284289392867841},{"x":20,"y2":0,"group":2,"y":0.9173802628931469}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(239,237,245)","rgb(188,189,220)","rgb(117,107,177)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
    );
</script>

### ColorBrewer scale, Reversed
{% highlight julia %}
using Vega

ab = barplot(x = collect(1:20), y = rand(20), group = vcat([1 for i in 1:10], [2 for i in 1:10]))
colorscheme!(ab, palette = ("Purples", 3), reversePalette = true)
{% endhighlight %}

<div id="purple2"></div>
<script type="text/javascript">
parse("purple2",
    {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":0.9381179497008088},{"x":2,"y2":0,"group":1,"y":0.4964967441994834},{"x":3,"y2":0,"group":1,"y":0.18448114788656222},{"x":4,"y2":0,"group":1,"y":0.345915403095592},{"x":5,"y2":0,"group":1,"y":0.3295086909789129},{"x":6,"y2":0,"group":1,"y":0.6878649809527333},{"x":7,"y2":0,"group":1,"y":0.8182435494175802},{"x":8,"y2":0,"group":1,"y":0.6776403456457463},{"x":9,"y2":0,"group":1,"y":0.6483467878451943},{"x":10,"y2":0,"group":1,"y":0.6918815761886847},{"x":11,"y2":0,"group":2,"y":0.9075294897982495},{"x":12,"y2":0,"group":2,"y":0.9663468029837556},{"x":13,"y2":0,"group":2,"y":0.5146891806853813},{"x":14,"y2":0,"group":2,"y":0.37983788550900477},{"x":15,"y2":0,"group":2,"y":0.38740217343629735},{"x":16,"y2":0,"group":2,"y":0.5561657007191216},{"x":17,"y2":0,"group":2,"y":0.9495716801415124},{"x":18,"y2":0,"group":2,"y":0.7405958485706121},{"x":19,"y2":0,"group":2,"y":0.17496599266688206},{"x":20,"y2":0,"group":2,"y":0.09041640970752174}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(117,107,177)","rgb(188,189,220)","rgb(239,237,245)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
    );
</script>


### Single Color

{% highlight julia %}
using Vega

srand(1)
a = barplot(x = [1:20], y = rand(20))
colorscheme!(a, palette = "Violet")
{% endhighlight %}

<div id="violet"></div>
<script type="text/javascript">
parse("violet",
        {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":0.23603334566204692},{"x":2,"y2":0,"group":1,"y":0.34651701419196046},{"x":3,"y2":0,"group":1,"y":0.3127069683360675},{"x":4,"y2":0,"group":1,"y":0.00790928339056074},{"x":5,"y2":0,"group":1,"y":0.4886128300795012},{"x":6,"y2":0,"group":1,"y":0.21096820215853596},{"x":7,"y2":0,"group":1,"y":0.951916339835734},{"x":8,"y2":0,"group":1,"y":0.9999046588986136},{"x":9,"y2":0,"group":1,"y":0.25166218303197185},{"x":10,"y2":0,"group":1,"y":0.9866663668987996},{"x":11,"y2":0,"group":1,"y":0.5557510873245723},{"x":12,"y2":0,"group":1,"y":0.43710797460962514},{"x":13,"y2":0,"group":1,"y":0.42471785049513144},{"x":14,"y2":0,"group":1,"y":0.773223048457377},{"x":15,"y2":0,"group":1,"y":0.2811902322857298},{"x":16,"y2":0,"group":1,"y":0.20947237319807077},{"x":17,"y2":0,"group":1,"y":0.25137920979222494},{"x":18,"y2":0,"group":1,"y":0.02037486871266725},{"x":19,"y2":0,"group":1,"y":0.2877015122756894},{"x":20,"y2":0,"group":1,"y":0.859512136087661}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["Violet"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450}

    );
</script>

### Array of Colors

{% highlight julia %}
using DataFrames, JSON, Vega

df = DataFrame()
for p in JSON.parse(readall(Pkg.dir("Vega", "vega-datasets/population.json")))
    df = vcat(df, DataFrame(;[symbol(k)=>v for (k,v) in p]...))
end

pop1900 = df[df[:year] .== 1900, :];

x = pop1900[:people]
y = pop1900[:age]
group = pop1900[:sex]

pc1 = popchart(x = x, y = y, group = group)
colorscheme!(pc1, palette = ["Green", "Red"])
{% endhighlight %}

<div id="array"></div>
<script type="text/javascript">
parse("array",
      {"name":"Vega Visualization","height":400,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"height":{"offset":-1,"scale":"y","band":true},"x2":{"value":0,"scale":"x"},"x":{"field":"x","scale":"x"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"update":{"height":{"field":{"group":"height"}},"x":{"field":"key","scale":"g"},"width":{"offset":-30,"scale":"g","band":true},"y":{"value":0}}},"axes":[{"format":"s","type":"x","scale":"x"}],"scales":[{"reverse":{"data":"","field":"reverse"},"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"x"},"type":"linear"}],"from":{"data":"table","transform":[{"groupby":["group"],"type":"facet"},{"field":"reverse","expr":"datum.key==2","type":"formula"}]},"type":"group"},{"properties":{"enter":{"align":{"value":"center"},"x":{"offset":-15,"mult":0.5,"field":{"group":"width"}},"fill":{"value":"#000"},"baseline":{"value":"middle"},"text":{"field":"y"},"y":{"offset":11,"field":"y","scale":"y"}}},"from":{"data":"table","transform":[{"groupby":["y"],"type":"aggregate"}]},"type":"text"}],"data":[{"name":"table","values":[{"x":4619544,"y2":0,"group":1,"y":0},{"x":4589196,"y2":0,"group":2,"y":0},{"x":4465783,"y2":0,"group":1,"y":5},{"x":4390483,"y2":0,"group":2,"y":5},{"x":4057669,"y2":0,"group":1,"y":10},{"x":4001749,"y2":0,"group":2,"y":10},{"x":3774846,"y2":0,"group":1,"y":15},{"x":3801743,"y2":0,"group":2,"y":15},{"x":3694038,"y2":0,"group":1,"y":20},{"x":3751061,"y2":0,"group":2,"y":20},{"x":3389280,"y2":0,"group":1,"y":25},{"x":3236056,"y2":0,"group":2,"y":25},{"x":2918964,"y2":0,"group":1,"y":30},{"x":2665174,"y2":0,"group":2,"y":30},{"x":2633883,"y2":0,"group":1,"y":35},{"x":2347737,"y2":0,"group":2,"y":35},{"x":2261070,"y2":0,"group":1,"y":40},{"x":2004987,"y2":0,"group":2,"y":40},{"x":1868413,"y2":0,"group":1,"y":45},{"x":1648025,"y2":0,"group":2,"y":45},{"x":1571038,"y2":0,"group":1,"y":50},{"x":1411981,"y2":0,"group":2,"y":50},{"x":1161908,"y2":0,"group":1,"y":55},{"x":1064632,"y2":0,"group":2,"y":55},{"x":916571,"y2":0,"group":1,"y":60},{"x":887508,"y2":0,"group":2,"y":60},{"x":672663,"y2":0,"group":1,"y":65},{"x":640212,"y2":0,"group":2,"y":65},{"x":454747,"y2":0,"group":1,"y":70},{"x":440007,"y2":0,"group":2,"y":70},{"x":268211,"y2":0,"group":1,"y":75},{"x":265879,"y2":0,"group":2,"y":75},{"x":127435,"y2":0,"group":1,"y":80},{"x":132449,"y2":0,"group":2,"y":80},{"x":44008,"y2":0,"group":1,"y":85},{"x":48614,"y2":0,"group":2,"y":85},{"x":15164,"y2":0,"group":1,"y":90},{"x":20093,"y2":0,"group":2,"y":90}]}],"scales":[{"name":"g","range":"width","domain":[2,1],"type":"ordinal"},{"reverse":true,"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"ordinal"},{"name":"group","range":["Green","Red"],"domain":[1,2],"type":"ordinal"}],"width":640,"legends":[{"title":"Group","fill":"group"}]}
    );
</script>
