---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# hline! / vline!

Arguments:

{% highlight julia %}
v::VegaVisualization
value::Real = 0
strokeWidth::Real = 1.5
stroke::AbstractString = "#000"
strokeDash::Real = 0
{% endhighlight %}

This function mutates `:VegaVisualization`, adding a horizontal/vertical line at a specified location.

### Default Chart
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = areaplot(x = x, y = y, group = g, stacked = true)
{% endhighlight %}

<div id="defaultc"></div>
<script type="text/javascript">
parse("defaultc",
	   {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"interpolate":{"value":"monotone"},"x":{"field":"x","scale":"x"},"y2":{"field":"layout_end","scale":"y"},"fill":{"field":"group","scale":"group"},"y":{"field":"layout_start","scale":"y"}}},"type":"area"}],"from":{"data":"table","transform":[{"sortby":["group"],"offset":"zero","field":"y","groupby":["x"],"type":"stack"},{"groupby":["group"],"type":"facet"}]},"type":"group"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":0,"y2":0,"group":0,"y":28},{"x":1,"y2":0,"group":0,"y":43},{"x":2,"y2":0,"group":0,"y":81},{"x":3,"y2":0,"group":0,"y":19},{"x":4,"y2":0,"group":0,"y":52},{"x":5,"y2":0,"group":0,"y":24},{"x":6,"y2":0,"group":0,"y":87},{"x":7,"y2":0,"group":0,"y":17},{"x":8,"y2":0,"group":0,"y":68},{"x":9,"y2":0,"group":0,"y":49},{"x":0,"y2":0,"group":1,"y":55},{"x":1,"y2":0,"group":1,"y":91},{"x":2,"y2":0,"group":1,"y":53},{"x":3,"y2":0,"group":1,"y":87},{"x":4,"y2":0,"group":1,"y":48},{"x":5,"y2":0,"group":1,"y":49},{"x":6,"y2":0,"group":1,"y":66},{"x":7,"y2":0,"group":1,"y":27},{"x":8,"y2":0,"group":1,"y":16},{"x":9,"y2":0,"group":1,"y":15}]},{"name":"stats","source":"table","transform":[{"groupby":["x"],"type":"aggregate","summarize":[{"ops":["sum"],"field":"y"}]}]}],"scales":[{"name":"x","points":true,"range":"width","domain":{"data":"table","field":"x"}},{"name":"y","range":"height","domain":{"data":"stats","field":"sum_y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}


    );
</script>

### With horizontal lines

{% highlight julia %}
hline!(a, value = 60.25, strokeDash = 3)
hline!(a, value = 80, strokeDash = 5)
{% endhighlight %}

<div id="hline"></div>
<script type="text/javascript">
parse("hline",
         {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"interpolate":{"value":"monotone"},"x":{"field":"x","scale":"x"},"y2":{"field":"layout_end","scale":"y"},"fill":{"field":"group","scale":"group"},"y":{"field":"layout_start","scale":"y"}}},"type":"area"}],"from":{"data":"table","transform":[{"sortby":["group"],"offset":"zero","field":"y","groupby":["x"],"type":"stack"},{"groupby":["group"],"type":"facet"}]},"type":"group"},{"properties":{"enter":{"strokeDash":{"value":[3]},"stroke":{"value":"#000"},"x2":{"field":{"group":"width"}},"x":{"field":{"group":"x"}},"strokeWidth":{"value":1.5},"y":{"value":60.25,"scale":"y"}}},"type":"rule"},{"properties":{"enter":{"strokeDash":{"value":[5]},"stroke":{"value":"#000"},"x2":{"field":{"group":"width"}},"x":{"field":{"group":"x"}},"strokeWidth":{"value":1.5},"y":{"value":80,"scale":"y"}}},"type":"rule"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":0,"y2":0,"group":0,"y":28},{"x":1,"y2":0,"group":0,"y":43},{"x":2,"y2":0,"group":0,"y":81},{"x":3,"y2":0,"group":0,"y":19},{"x":4,"y2":0,"group":0,"y":52},{"x":5,"y2":0,"group":0,"y":24},{"x":6,"y2":0,"group":0,"y":87},{"x":7,"y2":0,"group":0,"y":17},{"x":8,"y2":0,"group":0,"y":68},{"x":9,"y2":0,"group":0,"y":49},{"x":0,"y2":0,"group":1,"y":55},{"x":1,"y2":0,"group":1,"y":91},{"x":2,"y2":0,"group":1,"y":53},{"x":3,"y2":0,"group":1,"y":87},{"x":4,"y2":0,"group":1,"y":48},{"x":5,"y2":0,"group":1,"y":49},{"x":6,"y2":0,"group":1,"y":66},{"x":7,"y2":0,"group":1,"y":27},{"x":8,"y2":0,"group":1,"y":16},{"x":9,"y2":0,"group":1,"y":15}]},{"name":"stats","source":"table","transform":[{"groupby":["x"],"type":"aggregate","summarize":[{"ops":["sum"],"field":"y"}]}]}],"scales":[{"name":"x","points":true,"range":"width","domain":{"data":"table","field":"x"}},{"name":"y","range":"height","domain":{"data":"stats","field":"sum_y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>