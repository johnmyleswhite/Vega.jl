---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Line Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
points::Bool = false
pointShape::AbstractString = "circle"
pointSize::Real = 10
{% endhighlight %}

### Multiple Lines In Single Plot
{% highlight julia %}
using Vega

x = [1,2,3,4,5,1,2,3,4,5]
y = [5,2,3,6,8,10,12,15,18,30]
group = [1,1,1,1,1,2,2,2,2,2]

l = lineplot(x = x, y = y, group = group)

lineplot(x = x, y = y, group = group)
{% endhighlight %}

<div id="lineplot"></div>
<script type="text/javascript">
parse("lineplot",
{"name":"lineplot","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"stroke":{"field":"group","scale":"group"},"x":{"field":"x","scale":"x"},"strokeWidth":{"value":2},"y":{"field":"y","scale":"y"}}},"type":"line"}],"from":{"data":"table_piezj","transform":[{"groupby":["group"],"type":"facet"}]},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table_piezj","values":[{"x2":0,"x":1,"y2":0,"group":1,"y":5},{"x2":0,"x":2,"y2":0,"group":1,"y":2},{"x2":0,"x":3,"y2":0,"group":1,"y":3},{"x2":0,"x":4,"y2":0,"group":1,"y":6},{"x2":0,"x":5,"y2":0,"group":1,"y":8},{"x2":0,"x":1,"y2":0,"group":2,"y":10},{"x2":0,"x":2,"y2":0,"group":2,"y":12},{"x2":0,"x":3,"y2":0,"group":2,"y":15},{"x2":0,"x":4,"y2":0,"group":2,"y":18},{"x2":0,"x":5,"y2":0,"group":2,"y":30}]}],"scales":[{"name":"x","range":"width","domain":{"sort":true,"data":"table_piezj","field":"x"},"type":"linear"},{"name":"y","range":"height","domain":{"data":"table_piezj","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table_piezj","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}

	);
</script>

### Adding Points
{% highlight julia %}
lineplot(x = x, y = y, group = group, points = true)
{% endhighlight %}

<div id="lineplot2"></div>
<script type="text/javascript">
parse("lineplot2",
{"name":"lineplot","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"stroke":{"field":"group","scale":"group"},"x":{"field":"x","scale":"x"},"strokeWidth":{"value":2},"y":{"field":"y","scale":"y"}}},"type":"line"},{"properties":{"enter":{"shape":{"value":"circle"},"stroke":{"field":"group","scale":"group"},"x":{"field":"x","scale":"x"},"strokeWidth":{"value":2},"size":{"value":10},"y":{"field":"y","scale":"y"}}},"type":"symbol"}],"from":{"data":"table_veyfx","transform":[{"groupby":["group"],"type":"facet"}]},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table_veyfx","values":[{"x2":0,"x":1,"y2":0,"group":1,"y":5},{"x2":0,"x":2,"y2":0,"group":1,"y":2},{"x2":0,"x":3,"y2":0,"group":1,"y":3},{"x2":0,"x":4,"y2":0,"group":1,"y":6},{"x2":0,"x":5,"y2":0,"group":1,"y":8},{"x2":0,"x":1,"y2":0,"group":2,"y":10},{"x2":0,"x":2,"y2":0,"group":2,"y":12},{"x2":0,"x":3,"y2":0,"group":2,"y":15},{"x2":0,"x":4,"y2":0,"group":2,"y":18},{"x2":0,"x":5,"y2":0,"group":2,"y":30}]}],"scales":[{"name":"x","range":"width","domain":{"sort":true,"data":"table_veyfx","field":"x"},"type":"linear"},{"name":"y","range":"height","domain":{"data":"table_veyfx","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table_veyfx","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}

	);
</script>

### Making Points Larger
{% highlight julia %}
lineplot(x = x, y = y, group = group, points = true, pointSize = 20)
{% endhighlight %}

<div id="lineplot3"></div>
<script type="text/javascript">
parse("lineplot3",
{"name":"lineplot","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"stroke":{"field":"group","scale":"group"},"x":{"field":"x","scale":"x"},"strokeWidth":{"value":2},"y":{"field":"y","scale":"y"}}},"type":"line"},{"properties":{"enter":{"shape":{"value":"circle"},"stroke":{"field":"group","scale":"group"},"x":{"field":"x","scale":"x"},"strokeWidth":{"value":2},"size":{"value":20},"y":{"field":"y","scale":"y"}}},"type":"symbol"}],"from":{"data":"table_jbe6l","transform":[{"groupby":["group"],"type":"facet"}]},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table_jbe6l","values":[{"x2":0,"x":1,"y2":0,"group":1,"y":5},{"x2":0,"x":2,"y2":0,"group":1,"y":2},{"x2":0,"x":3,"y2":0,"group":1,"y":3},{"x2":0,"x":4,"y2":0,"group":1,"y":6},{"x2":0,"x":5,"y2":0,"group":1,"y":8},{"x2":0,"x":1,"y2":0,"group":2,"y":10},{"x2":0,"x":2,"y2":0,"group":2,"y":12},{"x2":0,"x":3,"y2":0,"group":2,"y":15},{"x2":0,"x":4,"y2":0,"group":2,"y":18},{"x2":0,"x":5,"y2":0,"group":2,"y":30}]}],"scales":[{"name":"x","range":"width","domain":{"sort":true,"data":"table_jbe6l","field":"x"},"type":"linear"},{"name":"y","range":"height","domain":{"data":"table_jbe6l","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table_jbe6l","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}
	);
</script>
