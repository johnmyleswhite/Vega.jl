---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Grouped Bar Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
horizontal::Bool = false
{% endhighlight %}

### Grouped Bar Chart

{% highlight julia %}
using Vega

category = ["A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C"]
group = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]

gb = groupedbar(x = category, y = value, group = group)
colorscheme!(gb, palette = ("Spectral", 5))
{% endhighlight %}

<div id="gb"></div>
<script type="text/javascript">
parse("gb",
	{"name":"groupedbar","height":300,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"x":{"field":"group","scale":"pos"},"y2":{"value":0,"scale":"y"},"width":{"offset":-1,"scale":"pos","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"rect"}],"properties":{"enter":{"x":{"field":"key","scale":"x"},"width":{"scale":"x","band":true}}},"scales":[{"name":"pos","range":"width","domain":{"data":"","field":"group"},"type":"ordinal"}],"from":{"data":"table","transform":[{"groupby":["x"],"type":"facet"}]},"type":"group"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":"A","y2":0,"group":0,"y":0.1},{"x":"A","y2":0,"group":1,"y":0.6},{"x":"A","y2":0,"group":2,"y":0.9},{"x":"A","y2":0,"group":3,"y":0.4},{"x":"B","y2":0,"group":0,"y":0.7},{"x":"B","y2":0,"group":1,"y":0.2},{"x":"B","y2":0,"group":2,"y":1.1},{"x":"B","y2":0,"group":3,"y":0.8},{"x":"C","y2":0,"group":0,"y":0.6},{"x":"C","y2":0,"group":1,"y":0.2},{"x":"C","y2":0,"group":2,"y":0.1},{"x":"C","y2":0,"group":3,"y":0.7}]}],"scales":[{"name":"x","padding":0.2,"range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","nice":true,"range":"height","domain":{"data":"table","field":"y"}},{"name":"group","range":["rgb(215, 25, 28)","rgb(253,174, 97)","rgb(255,255,191)","rgb(171,221,164)","rgb( 43,131,186)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":500,"legends":[{"title":"Group","fill":"group"}]}

	);
</script>
