---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# legend!

Function Keywords:

{% highlight julia %}
v::VegaVisualization
title::String
show::Bool
{% endhighlight %}

This function mutates `:VegaVisualization`, modifying the legend attributes.

### Default legend title
{% highlight julia %}
using Vega

fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]

v = piechart(x = fruit, y = bushels)
{% endhighlight %}

<div id="defaultlegend"></div>
<script type="text/javascript">
parse("defaultlegend",
          {"name":"Vega Visualization","height":250,"padding":"auto","marks":[{"properties":{"enter":{"innerRadius":{"value":0},"stroke":{"value":"white"},"startAngle":{"field":"layout_start"},"x":{"mult":0.5,"group":"width"},"outerRadius":{"value":250},"endAngle":{"field":"layout_end"},"fill":{"field":"x","scale":"group"},"y":{"mult":0.5,"group":"height"}}},"from":{"data":"table","transform":[{"field":"y","type":"pie"}]},"type":"arc"}],"data":[{"name":"table","values":[{"x":"peaches","y2":0,"group":1,"y":100},{"x":"plums","y2":0,"group":1,"y":32},{"x":"blueberries","y2":0,"group":1,"y":180},{"x":"strawberries","y2":0,"group":1,"y":46},{"x":"bananas","y2":0,"group":1,"y":21}]}],"scales":[{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"x"},"type":"ordinal"}],"width":250,"legends":[{"title":"group","fill":"group"}]}

    );
</script>

### Modified legend title

{% highlight julia %}
legend!(v, title = "Fruit")
{% endhighlight %}

<div id="legendchange"></div>
<script type="text/javascript">
parse("legendchange",
          {"name":"Vega Visualization","height":250,"padding":"auto","marks":[{"properties":{"enter":{"innerRadius":{"value":0},"stroke":{"value":"white"},"startAngle":{"field":"layout_start"},"x":{"mult":0.5,"group":"width"},"outerRadius":{"value":250},"endAngle":{"field":"layout_end"},"fill":{"field":"x","scale":"group"},"y":{"mult":0.5,"group":"height"}}},"from":{"data":"table","transform":[{"field":"y","type":"pie"}]},"type":"arc"}],"data":[{"name":"table","values":[{"x":"peaches","y2":0,"group":1,"y":100},{"x":"plums","y2":0,"group":1,"y":32},{"x":"blueberries","y2":0,"group":1,"y":180},{"x":"strawberries","y2":0,"group":1,"y":46},{"x":"bananas","y2":0,"group":1,"y":21}]}],"scales":[{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"x"},"type":"ordinal"}],"width":250,"legends":[{"title":"Fruit","fill":"group"}]}

    );
</script>