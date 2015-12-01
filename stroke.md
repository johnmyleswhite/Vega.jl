---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# stroke!

Required Arguments:

{% highlight julia %}
v::VegaVisualization
{% endhighlight %}

Function Keywords:

{% highlight julia %}
color::String = "Black"
width::Real = 0.75
opacity::Real = 1
visible::Bool = true
{% endhighlight %}

This function mutates `:VegaVisualization`, adding borders around `:VegaMarks`.

### No stroke
{% highlight julia %}
using Vega, DataFrames
category = ['A', 'A', 'A', 'A', 'B', 'B', 'B', 'B', 'C', 'C', 'C', 'C']
position = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]

a = groupedbar(x = category, y = value, position = position)
{% endhighlight %}

<div id="nostroke"></div>
<script type="text/javascript">
parse("nostroke",
	    {"name":"groupedbar","height":300,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"x":{"field":"group","scale":"pos"},"y2":{"value":0,"scale":"y"},"width":{"offset":-1,"scale":"pos","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"enter":{"x":{"field":"key","scale":"x"},"width":{"scale":"x","band":true}}},"scales":[{"name":"pos","range":"width","domain":{"data":"","field":"group"},"type":"ordinal"}],"from":{"data":"table","transform":[{"groupby":["x"],"type":"facet"}]},"type":"group"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":"A","y2":0,"group":0,"y":0.1},{"x":"A","y2":0,"group":1,"y":0.6},{"x":"A","y2":0,"group":2,"y":0.9},{"x":"A","y2":0,"group":3,"y":0.4},{"x":"B","y2":0,"group":0,"y":0.7},{"x":"B","y2":0,"group":1,"y":0.2},{"x":"B","y2":0,"group":2,"y":1.1},{"x":"B","y2":0,"group":3,"y":0.8},{"x":"C","y2":0,"group":0,"y":0.6},{"x":"C","y2":0,"group":1,"y":0.2},{"x":"C","y2":0,"group":2,"y":0.1},{"x":"C","y2":0,"group":3,"y":0.7}]}],"scales":[{"name":"x","padding":0.2,"range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","nice":true,"range":"height","domain":{"data":"table","field":"y"}},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":500,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>



### Stroke

{% highlight julia %}
stroke!(v, width = 1.5)
{% endhighlight %}

<div id="strokedark"></div>
<script type="text/javascript">
parse("strokedark",
	    {"name":"groupedbar","height":300,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"stroke":{"value":"Black"},"x":{"field":"group","scale":"pos"},"y2":{"value":0,"scale":"y"},"strokeWidth":{"value":1.5},"width":{"offset":-1,"scale":"pos","band":true},"fill":{"field":"group","scale":"group"},"strokeOpacity":{"value":1},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"enter":{"x":{"field":"key","scale":"x"},"width":{"scale":"x","band":true}}},"scales":[{"name":"pos","range":"width","domain":{"data":"","field":"group"},"type":"ordinal"}],"from":{"data":"table","transform":[{"groupby":["x"],"type":"facet"}]},"type":"group"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":"A","y2":0,"group":0,"y":0.1},{"x":"A","y2":0,"group":1,"y":0.6},{"x":"A","y2":0,"group":2,"y":0.9},{"x":"A","y2":0,"group":3,"y":0.4},{"x":"B","y2":0,"group":0,"y":0.7},{"x":"B","y2":0,"group":1,"y":0.2},{"x":"B","y2":0,"group":2,"y":1.1},{"x":"B","y2":0,"group":3,"y":0.8},{"x":"C","y2":0,"group":0,"y":0.6},{"x":"C","y2":0,"group":1,"y":0.2},{"x":"C","y2":0,"group":2,"y":0.1},{"x":"C","y2":0,"group":3,"y":0.7}]}],"scales":[{"name":"x","padding":0.2,"range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","nice":true,"range":"height","domain":{"data":"table","field":"y"}},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":500,"legends":[{"title":"Group","fill":"group"}]}

    );
</script>