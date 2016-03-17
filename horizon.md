---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Horizon Plot

The horizon plot alters the height of the Y-axis for each click, in order to increase information density. See paper ["Sizing the Horizon: The Effects of Chart Size and Layering on the Graphical Perception of Time Series Visualizations" by Jeffrey Heer, Nicholas Kong, Maneesh Agrawala](http://idl.cs.washington.edu/papers/horizon/)

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
{% endhighlight %}

### Horizon Plot with colorscheme!
{% highlight julia %}
using Vega

x = 1:20
y = [28, 55, 43, 91, 81, 53, 19, 87, 52, 48, 24, 49, 87, 66, 17, 27, 68, 16, 49, 15]

h = horizon(x = x, y = y)
colorscheme!(h, palette = "green")
{% endhighlight %}

<div id="horizon"></div>
<script type="text/javascript">
parse("horizon",
    {"name":"horizon","height":100,"padding":"auto","marks":[{"marks":[{"marks":[{"properties":{"update":{"y2":{"value":0,"scale":"y"},"fillOpacity":{"signal":"opacity"},"y":{"field":"y","scale":"y"}},"enter":{"interpolate":{"value":"monotone"},"x":{"field":"x","scale":"x"},"fill":{"field":"group","scale":"group"}}},"from":{"data":"table_tabpa"},"type":"area"}],"properties":{"update":{"y":{"field":"offset"}}},"from":{"data":"layer_indices"},"type":"group"}],"properties":{"update":{"height":{"field":{"group":"height"}},"clip":{"value":true},"width":{"field":{"group":"width"}}}},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"}],"data":[{"name":"table_tabpa","values":[{"x":1,"y2":0,"group":1,"y":28},{"x":2,"y2":0,"group":1,"y":55},{"x":3,"y2":0,"group":1,"y":43},{"x":4,"y2":0,"group":1,"y":91},{"x":5,"y2":0,"group":1,"y":81},{"x":6,"y2":0,"group":1,"y":53},{"x":7,"y2":0,"group":1,"y":19},{"x":8,"y2":0,"group":1,"y":87},{"x":9,"y2":0,"group":1,"y":52},{"x":10,"y2":0,"group":1,"y":48},{"x":11,"y2":0,"group":1,"y":24},{"x":12,"y2":0,"group":1,"y":49},{"x":13,"y2":0,"group":1,"y":87},{"x":14,"y2":0,"group":1,"y":66},{"x":15,"y2":0,"group":1,"y":17},{"x":16,"y2":0,"group":1,"y":27},{"x":17,"y2":0,"group":1,"y":68},{"x":18,"y2":0,"group":1,"y":16},{"x":19,"y2":0,"group":1,"y":49},{"x":20,"y2":0,"group":1,"y":15}]},{"name":"layer_indices","values":[0,1,2,3],"transform":[{"test":"datum.data < layers","type":"filter"},{"field":"offset","expr":"datum.data * -height","type":"formula"}]}],"scales":[{"name":"x","zero":false,"range":"width","domain":{"sort":true,"data":"table_tabpa","field":"x"},"type":"linear"},{"name":"y","range":[{"signal":"vheight"},0],"domain":{"data":"table_tabpa","field":"y"},"type":"linear"},{"name":"group","range":["green"],"domain":{"data":"table_tabpa","field":"group"},"type":"ordinal"}],"width":450,"signals":[{"name":"layers","init":2,"streams":[{"expr":"1 + (layers % 4)","type":"click"}]},{"name":"vheight","init":{"expr":"height * layers"},"streams":[{"expr":"height * layers","type":"layers, height"}]},{"name":"opacity","init":{"expr":"pow(layers, -2/3)"},"streams":[{"expr":"pow(layers, -2/3)","type":"layers"}]}]}

	);
</script>
(Click to change the number of layers)