---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Aster Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
weight::AbstractVector
holesize::Int
{% endhighlight %}

This plot is a replication of the [Aster Plot d3.js](http://bl.ocks.org/bbest/2de0e25d4840c68f2db1) example on [bl.ocks.org](http://bl.ocks.org/). From their description:

"This aster plot displays pie slices as lengths extending outward to the edge (0 at inner to 100 at outer). Widths of the pie slices represent the weight of each pie..."


### Aster Plot With Interactivity
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
