---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bar Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
y2::AbstractVector
group::AbstractVector
stacked::Bool = false
horizontal::Bool = false
normalize::Bool = false
{% endhighlight %}

### Vertical Bar
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

barplot(x = x, y = y)
{% endhighlight %}

<div id="verticalbar"></div>
<script type="text/javascript">
parse("verticalbar",
	{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":1},{"x":2,"y2":0,"group":1,"y":2},{"x":3,"y2":0,"group":1,"y":3},{"x":4,"y2":0,"group":1,"y":2},{"x":5,"y2":0,"group":1,"y":1}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450}
	);
</script>

### Horizontal Bar
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

barplot(x = x, y = y, horizontal = true)
{% endhighlight %}

<div id="horizontalbar"></div>
<script type="text/javascript">
parse("horizontalbar",
	{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"height":{"offset":-1,"scale":"x","band":true},"x2":{"value":0,"scale":"y"},"x":{"field":"y","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"x","scale":"x"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"x","scale":"y"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"y","scale":"x"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":1},{"x":2,"y2":0,"group":1,"y":2},{"x":3,"y2":0,"group":1,"y":3},{"x":4,"y2":0,"group":1,"y":2},{"x":5,"y2":0,"group":1,"y":1}]}],"scales":[{"name":"x","range":"height","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"width","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450}
	);
</script>

### Group Argument
{% highlight julia %}
using Vega

x = [1:20]
y = rand(20)
group = [round(val/10) for val in x]

barplot(x = x, y = y, group = group)
{% endhighlight %}

<div id="groupbar"></div>
<script type="text/javascript">
parse("groupbar",
	{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":0.0,"y":0.7410184502461228},{"x":2,"y2":0,"group":0.0,"y":0.6380260092604406},{"x":3,"y2":0,"group":0.0,"y":0.3496893538132799},{"x":4,"y2":0,"group":0.0,"y":0.46145201956179727},{"x":5,"y2":0,"group":0.0,"y":0.31548888152566534},{"x":6,"y2":0,"group":1.0,"y":0.44012296055687306},{"x":7,"y2":0,"group":1.0,"y":0.3521419933283525},{"x":8,"y2":0,"group":1.0,"y":0.44166522951021503},{"x":9,"y2":0,"group":1.0,"y":0.6374618249663895},{"x":10,"y2":0,"group":1.0,"y":0.045634914012558925},{"x":11,"y2":0,"group":1.0,"y":0.7412386028436626},{"x":12,"y2":0,"group":1.0,"y":0.6087211365044194},{"x":13,"y2":0,"group":1.0,"y":0.5680089466459857},{"x":14,"y2":0,"group":1.0,"y":0.7919740929540833},{"x":15,"y2":0,"group":2.0,"y":0.19686439272603673},{"x":16,"y2":0,"group":2.0,"y":0.11205444468660697},{"x":17,"y2":0,"group":2.0,"y":0.44870461621058344},{"x":18,"y2":0,"group":2.0,"y":0.5943806383626922},{"x":19,"y2":0,"group":2.0,"y":0.263901299646756},{"x":20,"y2":0,"group":2.0,"y":0.7365808830157612}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
	);
</script>

### Stacked Bar (with additional `colorscheme!` change)
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = barplot(x = x, y = y, group = g, stacked = true)
colorscheme!(a, palette = ("Greens", 3))
{% endhighlight %}

<div id="stacked"></div>
<script type="text/javascript">
parse("stacked",

{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"layout_end","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"layout_start","scale":"y"}}},"from":{"data":"table","transform":[{"sortby":["group"],"offset":"zero","field":"y","groupby":["x"],"type":"stack"}]},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":0,"y2":0,"group":0,"y":28},{"x":1,"y2":0,"group":0,"y":43},{"x":2,"y2":0,"group":0,"y":81},{"x":3,"y2":0,"group":0,"y":19},{"x":4,"y2":0,"group":0,"y":52},{"x":5,"y2":0,"group":0,"y":24},{"x":6,"y2":0,"group":0,"y":87},{"x":7,"y2":0,"group":0,"y":17},{"x":8,"y2":0,"group":0,"y":68},{"x":9,"y2":0,"group":0,"y":49},{"x":0,"y2":0,"group":1,"y":55},{"x":1,"y2":0,"group":1,"y":91},{"x":2,"y2":0,"group":1,"y":53},{"x":3,"y2":0,"group":1,"y":87},{"x":4,"y2":0,"group":1,"y":48},{"x":5,"y2":0,"group":1,"y":49},{"x":6,"y2":0,"group":1,"y":66},{"x":7,"y2":0,"group":1,"y":27},{"x":8,"y2":0,"group":1,"y":16},{"x":9,"y2":0,"group":1,"y":15}]},{"name":"stats","source":"table","transform":[{"groupby":["x"],"type":"aggregate","summarize":[{"ops":["sum"],"field":"y"}]}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"stats","field":"sum_y"},"type":"linear"},{"name":"group","range":["rgb(229,245,224)","rgb(161,217,155)","rgb( 49,163, 84)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
	);
</script>

### Normalized Horizontal Stacked Bar (with additional `hover!` change)
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = barplot(x = x, y = y, group = g, stacked = true, normalize = true, horizontal = true)
hover!(a, opacity = 0.75)
{% endhighlight %}

<div id="horizhover"></div>
<script type="text/javascript">
parse("horizhover",

{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"update":{"fillOpacity":{"value":1}},"hover":{"fillOpacity":{"value":0.75}},"enter":{"height":{"offset":-1,"scale":"x","band":true},"x2":{"field":"layout_end","scale":"y"},"x":{"field":"layout_start","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"x","scale":"x"}}},"from":{"data":"table","transform":[{"sortby":["group"],"offset":"normalize","field":"y","groupby":["x"],"type":"stack"}]},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"x","scale":"y"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"y","scale":"x"}],"data":[{"name":"table","values":[{"x":0,"y2":0,"group":0,"y":28},{"x":1,"y2":0,"group":0,"y":43},{"x":2,"y2":0,"group":0,"y":81},{"x":3,"y2":0,"group":0,"y":19},{"x":4,"y2":0,"group":0,"y":52},{"x":5,"y2":0,"group":0,"y":24},{"x":6,"y2":0,"group":0,"y":87},{"x":7,"y2":0,"group":0,"y":17},{"x":8,"y2":0,"group":0,"y":68},{"x":9,"y2":0,"group":0,"y":49},{"x":0,"y2":0,"group":1,"y":55},{"x":1,"y2":0,"group":1,"y":91},{"x":2,"y2":0,"group":1,"y":53},{"x":3,"y2":0,"group":1,"y":87},{"x":4,"y2":0,"group":1,"y":48},{"x":5,"y2":0,"group":1,"y":49},{"x":6,"y2":0,"group":1,"y":66},{"x":7,"y2":0,"group":1,"y":27},{"x":8,"y2":0,"group":1,"y":16},{"x":9,"y2":0,"group":1,"y":15}]},{"name":"stats","source":"table","transform":[{"groupby":["x"],"type":"aggregate","summarize":[{"ops":["sum"],"field":"y"}]}]}],"scales":[{"name":"x","range":"height","domain":{"data":"table","field":"x"},"type":"ordinal"},{"reverse":false,"name":"y","zero":true,"domainMax":1,"domain":{"data":"stats","field":"sum_y"},"range":"width","type":"linear","round":false},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
	);
</script>