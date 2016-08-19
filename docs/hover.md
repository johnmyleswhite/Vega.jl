---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# hover!

Arguments:

{% highlight julia %}
v::VegaVisualization
opacity::Number = 1
color::AbstractString
{% endhighlight %}

This function mutates `:VegaVisualization`, changing the opacity of a mark when the mouse cursor moves over it. Note that if you use both opacity and color at the same time, the opacity will apply to the color value you specify.

### Opacity

{% highlight julia %}
score = [59, 24, 98, 60 ,74,70,42,77,88,60,65,71,88,83]
id = ["FIS", "MAR","AO","NP","CS","CP","TR","LIV","ECO","ICO","LSP","CW","HAB","SPP"]
weight = [0.5, 0.5, 1,1,1,1,1,0.5,0.5,0.5,0.5,1,0.5,0.5]

v = asterplot(x = id, y = score, weight = weight, holesize = 75)
colorscheme!(v, palette = ["#9E0041", "#C32F4B", "#E1514B", "#F47245", "#FB9F59", "#FEC574", "#FAE38C", "#EAF195",
                            "#C7E89E", "#9CD6A4", "#6CC4A4", "#4D9DB4", "#4776B4", "#5E4EA1"])
hover!(v, opacity = 0.5)
{% endhighlight %}

<div id="aster"></div>
<script type="text/javascript">
parse("aster",
	{"name":"Vega Visualization","height":250,"padding":"auto","marks":[{"properties":{"update":{"fillOpacity":{"value":1}},"hover":{"fillOpacity":{"value":0.5}},"enter":{"innerRadius":{"value":75},"stroke":{"value":"white"},"startAngle":{"field":"layout_start"},"x":{"mult":0.5,"group":"width"},"outerRadius":{"field":"calcOuterRadius"},"endAngle":{"field":"layout_end"},"fill":{"field":"x","scale":"color"},"y":{"mult":0.5,"group":"height"}}},"from":{"data":"table","transform":[{"field":"y2","type":"pie"},{"field":"calcOuterRadius","expr":"(250 - 75) * (datum.y/100.0) + 75","type":"formula"}]},"type":"arc"},{"properties":{"enter":{"innerRadius":{"value":75},"stroke":{"value":"gray"},"startAngle":{"field":"layout_start"},"x":{"mult":0.5,"group":"width"},"outerRadius":{"value":250},"endAngle":{"field":"layout_end"},"y":{"mult":0.5,"group":"height"}}},"from":{"data":"table","transform":[{"field":"y2","type":"pie"},{"field":"calcOuterRadius","expr":"(250 - 75) * (datum.y/100.0) + 75","type":"formula"}]},"type":"arc"}],"data":[{"name":"table","values":[{"x":"FIS","y2":0.5,"group":1,"y":59},{"x":"MAR","y2":0.5,"group":1,"y":24},{"x":"AO","y2":1.0,"group":1,"y":98},{"x":"NP","y2":1.0,"group":1,"y":60},{"x":"CS","y2":1.0,"group":1,"y":74},{"x":"CP","y2":1.0,"group":1,"y":70},{"x":"TR","y2":1.0,"group":1,"y":42},{"x":"LIV","y2":0.5,"group":1,"y":77},{"x":"ECO","y2":0.5,"group":1,"y":88},{"x":"ICO","y2":0.5,"group":1,"y":60},{"x":"LSP","y2":0.5,"group":1,"y":65},{"x":"CW","y2":1.0,"group":1,"y":71},{"x":"HAB","y2":0.5,"group":1,"y":88},{"x":"SPP","y2":0.5,"group":1,"y":83}]}],"scales":[{"name":"color","range":["#9E0041","#C32F4B","#E1514B","#F47245","#FB9F59","#FEC574","#FAE38C","#EAF195","#C7E89E","#9CD6A4","#6CC4A4","#4D9DB4","#4776B4","#5E4EA1"],"domain":{"data":"table","field":"x"},"type":"ordinal"}],"width":250,"legends":[{"title":"group","fill":"color"}]}

    );
</script>

### Color

{% highlight julia %}
category = ['A', 'A', 'A', 'A', 'B', 'B', 'B', 'B', 'C', 'C', 'C', 'C']
position = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]
a = groupedbar(x = category, y = value, position = position)

hover!(a, color = "red")
{% endhighlight %}

<div id="gbar"></div>
<script type="text/javascript">
parse("gbar",
	{"name":"groupedbar","height":300,"padding":"auto","marks":[{"marks":[{"properties":{"update":{"fillOpacity":{"value":1},"fill":{"field":"group","scale":"group"},"strokeOpacity":{"value":1}},"hover":{"fillOpacity":{"value":1},"fill":{"value":"red"},"strokeOpacity":{"value":1}},"enter":{"x":{"field":"group","scale":"pos"},"y2":{"value":0,"scale":"y"},"width":{"offset":-1,"scale":"pos","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"enter":{"x":{"field":"key","scale":"x"},"width":{"scale":"x","band":true}}},"scales":[{"name":"pos","range":"width","domain":{"data":"","field":"group"},"type":"ordinal"}],"from":{"data":"table","transform":[{"groupby":["x"],"type":"facet"}]},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":"A","y2":0,"group":0,"y":0.1},{"x":"A","y2":0,"group":1,"y":0.6},{"x":"A","y2":0,"group":2,"y":0.9},{"x":"A","y2":0,"group":3,"y":0.4},{"x":"B","y2":0,"group":0,"y":0.7},{"x":"B","y2":0,"group":1,"y":0.2},{"x":"B","y2":0,"group":2,"y":1.1},{"x":"B","y2":0,"group":3,"y":0.8},{"x":"C","y2":0,"group":0,"y":0.6},{"x":"C","y2":0,"group":1,"y":0.2},{"x":"C","y2":0,"group":2,"y":0.1},{"x":"C","y2":0,"group":3,"y":0.7}]}],"scales":[{"name":"x","padding":0.2,"range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","nice":true,"range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":500,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>
