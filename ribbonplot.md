---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Ribbon Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
ylow::AbstractVector
ylow::AbstractVector
group::AbstractVector
{% endhighlight %}

### Ribbon Plot

{% highlight julia %}
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = ribbonplot(x = x, ylow = 0.9y, yhigh=1.1y, group = g)
{% endhighlight %}

<div id="ribbon"></div>
<script type="text/javascript">
parse("ribbon",
   {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"marks":[{"properties":{"enter":{"interpolate":{"value":"monotone"},"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"type":"area"}],"from":{"data":"table_nfyiq","transform":[{"groupby":["group"],"type":"facet"}]},"type":"group"}],"axes":[{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"x","grid":false,"type":"x","scale":"x"},{"layer":"front","properties":{"title":{"fontSize":{"value":14}}},"title":"y","grid":false,"type":"y","scale":"y"}],"data":[{"name":"table_nfyiq","values":[{"x":0,"y2":25.2,"group":0,"y":30.800000000000004},{"x":1,"y2":38.7,"group":0,"y":47.300000000000004},{"x":2,"y2":72.9,"group":0,"y":89.10000000000001},{"x":3,"y2":17.1,"group":0,"y":20.900000000000002},{"x":4,"y2":46.800000000000004,"group":0,"y":57.2},{"x":5,"y2":21.6,"group":0,"y":26.400000000000002},{"x":6,"y2":78.3,"group":0,"y":95.7},{"x":7,"y2":15.3,"group":0,"y":18.700000000000003},{"x":8,"y2":61.2,"group":0,"y":74.80000000000001},{"x":9,"y2":44.1,"group":0,"y":53.900000000000006},{"x":0,"y2":49.5,"group":1,"y":60.50000000000001},{"x":1,"y2":81.9,"group":1,"y":100.10000000000001},{"x":2,"y2":47.7,"group":1,"y":58.300000000000004},{"x":3,"y2":78.3,"group":1,"y":95.7},{"x":4,"y2":43.2,"group":1,"y":52.800000000000004},{"x":5,"y2":44.1,"group":1,"y":53.900000000000006},{"x":6,"y2":59.4,"group":1,"y":72.60000000000001},{"x":7,"y2":24.3,"group":1,"y":29.700000000000003},{"x":8,"y2":14.4,"group":1,"y":17.6},{"x":9,"y2":13.5,"group":1,"y":16.5}]}],"scales":[{"name":"x","zero":false,"range":"width","domain":{"sort":true,"data":"table_nfyiq","field":"x"},"type":"linear"},{"name":"y","range":"height","domain":{"data":"table_nfyiq","field":["y","y2"]},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table_nfyiq","field":"group"},"type":"ordinal"}],"width":450,"legends":[{"title":"Group","fill":"group"}]}

	);
</script>
