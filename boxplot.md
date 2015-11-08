---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Box Plot

Function Keywords:

{% highlight julia %}
y::AbstractVector
group::AbstractVector
{% endhighlight %}

This function calculates a Tukey boxplot, where the whiskers are the min(max) of 1.5 * IQR or the smallest(largest) datapoint. The circles on the boxplot represent the most extreme values in the data. Currently, printing outliers on the boxplot is not implemented.

### Single Box Plot
{% highlight julia %}
using RDatasets, Vega
df = dataset("datasets", "mtcars")

boxplot(y = df[:MPG])
{% endhighlight %}

<div id="singlebox"></div>
<script type="text/javascript">
parse("singlebox",
	{"name":"boxplot","height":200,"padding":"auto","marks":[{"properties":{"enter":{"height":{"signal":"boxSize"},"stroke":{"value":"#888"},"x2":{"field":"q3_y","scale":"x"},"x":{"field":"q1_y","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"field":"x","scale":"group"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"value":1},"x2":{"field":"q1_y","scale":"x"},"x":{"field":"lower","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"value":"#888"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"signal":"boxSize"},"x":{"field":"median_y","scale":"x"},"width":{"value":2},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"mult":0.5,"signal":"boxSize"},"x":{"field":"lower","scale":"x"},"width":{"value":1},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"mult":0.5,"signal":"boxSize"},"x":{"field":"upper","scale":"x"},"width":{"value":1},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"stroke":{"value":"#000"},"x":{"field":"min_y","scale":"x"},"yc":{"field":"x","scale":"y"},"size":{"value":40}}},"from":{"data":"iqrcalcs"},"type":"symbol"},{"properties":{"enter":{"stroke":{"value":"#000"},"x":{"field":"max_y","scale":"x"},"yc":{"field":"x","scale":"y"},"size":{"value":40}}},"from":{"data":"iqrcalcs"},"type":"symbol"},{"properties":{"enter":{"height":{"value":1},"x2":{"field":"upper","scale":"x"},"x":{"field":"q3_y","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"value":"#888"}}},"from":{"data":"iqrcalcs"},"type":"rect"}],"axes":[{"type":"x","scale":"x"},{"offset":5,"properties":{"axis":{"stroke":{"value":"transparent"}}},"type":"y","scale":"y","tickSize":0}],"data":[{"name":"table","values":[{"x":" ","y2":0,"group":1,"y":21.0},{"x":" ","y2":0,"group":1,"y":21.0},{"x":" ","y2":0,"group":1,"y":22.8},{"x":" ","y2":0,"group":1,"y":21.4},{"x":" ","y2":0,"group":1,"y":18.7},{"x":" ","y2":0,"group":1,"y":18.1},{"x":" ","y2":0,"group":1,"y":14.3},{"x":" ","y2":0,"group":1,"y":24.4},{"x":" ","y2":0,"group":1,"y":22.8},{"x":" ","y2":0,"group":1,"y":19.2},{"x":" ","y2":0,"group":1,"y":17.8},{"x":" ","y2":0,"group":1,"y":16.4},{"x":" ","y2":0,"group":1,"y":17.3},{"x":" ","y2":0,"group":1,"y":15.2},{"x":" ","y2":0,"group":1,"y":10.4},{"x":" ","y2":0,"group":1,"y":10.4},{"x":" ","y2":0,"group":1,"y":14.7},{"x":" ","y2":0,"group":1,"y":32.4},{"x":" ","y2":0,"group":1,"y":30.4},{"x":" ","y2":0,"group":1,"y":33.9},{"x":" ","y2":0,"group":1,"y":21.5},{"x":" ","y2":0,"group":1,"y":15.5},{"x":" ","y2":0,"group":1,"y":15.2},{"x":" ","y2":0,"group":1,"y":13.3},{"x":" ","y2":0,"group":1,"y":19.2},{"x":" ","y2":0,"group":1,"y":27.3},{"x":" ","y2":0,"group":1,"y":26.0},{"x":" ","y2":0,"group":1,"y":30.4},{"x":" ","y2":0,"group":1,"y":15.8},{"x":" ","y2":0,"group":1,"y":19.7},{"x":" ","y2":0,"group":1,"y":15.0},{"x":" ","y2":0,"group":1,"y":21.4}]},{"name":"stats","source":"table","transform":[{"groupby":"x","type":"aggregate","summarize":{"y":["min","max","median","q1","q3","valid"]}}]},{"name":"iqrcalcs","source":"stats","transform":[{"field":"lower","expr":"max(datum.min_y,datum.q1_y-1.5*(datum.q3_y-datum.q1_y))","type":"formula"},{"field":"upper","expr":"min(datum.max_y,datum.q1_y+1.5*(datum.q3_y-datum.q1_y))","type":"formula"}]}],"scales":[{"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"y"},"type":"linear","round":true},{"name":"y","points":true,"padding":1.5,"range":"height","domain":{"data":"table","field":"x"},"type":"ordinal","round":true},{"name":"group","nice":true,"range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"x"},"type":"ordinal","round":true}],"width":600,"signals":[{"name":"boxSize","init":40}]}
	);
</script>

### Grouped Box Plot
{% highlight julia %}
using RDatasets, Vega
df = dataset("datasets", "mtcars")

boxplot(y = df[:MPG], group = df[:Cyl])
{% endhighlight %}

<div id="multibox"></div>
<script type="text/javascript">
parse("multibox",
	{"name":"boxplot","height":200,"padding":"auto","marks":[{"properties":{"enter":{"height":{"signal":"boxSize"},"stroke":{"value":"#888"},"x2":{"field":"q3_y","scale":"x"},"x":{"field":"q1_y","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"field":"x","scale":"group"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"value":1},"x2":{"field":"q1_y","scale":"x"},"x":{"field":"lower","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"value":"#888"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"signal":"boxSize"},"x":{"field":"median_y","scale":"x"},"width":{"value":2},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"mult":0.5,"signal":"boxSize"},"x":{"field":"lower","scale":"x"},"width":{"value":1},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"height":{"mult":0.5,"signal":"boxSize"},"x":{"field":"upper","scale":"x"},"width":{"value":1},"yc":{"field":"x","scale":"y"},"fill":{"value":"#000"}}},"from":{"data":"iqrcalcs"},"type":"rect"},{"properties":{"enter":{"stroke":{"value":"#000"},"x":{"field":"min_y","scale":"x"},"yc":{"field":"x","scale":"y"},"size":{"value":40}}},"from":{"data":"iqrcalcs"},"type":"symbol"},{"properties":{"enter":{"stroke":{"value":"#000"},"x":{"field":"max_y","scale":"x"},"yc":{"field":"x","scale":"y"},"size":{"value":40}}},"from":{"data":"iqrcalcs"},"type":"symbol"},{"properties":{"enter":{"height":{"value":1},"x2":{"field":"upper","scale":"x"},"x":{"field":"q3_y","scale":"x"},"yc":{"field":"x","scale":"y"},"fill":{"value":"#888"}}},"from":{"data":"iqrcalcs"},"type":"rect"}],"axes":[{"type":"x","scale":"x"},{"offset":5,"properties":{"axis":{"stroke":{"value":"transparent"}}},"type":"y","scale":"y","tickSize":0}],"data":[{"name":"table","values":[{"x":6,"y2":0,"group":1,"y":21.0},{"x":6,"y2":0,"group":1,"y":21.0},{"x":4,"y2":0,"group":1,"y":22.8},{"x":6,"y2":0,"group":1,"y":21.4},{"x":8,"y2":0,"group":1,"y":18.7},{"x":6,"y2":0,"group":1,"y":18.1},{"x":8,"y2":0,"group":1,"y":14.3},{"x":4,"y2":0,"group":1,"y":24.4},{"x":4,"y2":0,"group":1,"y":22.8},{"x":6,"y2":0,"group":1,"y":19.2},{"x":6,"y2":0,"group":1,"y":17.8},{"x":8,"y2":0,"group":1,"y":16.4},{"x":8,"y2":0,"group":1,"y":17.3},{"x":8,"y2":0,"group":1,"y":15.2},{"x":8,"y2":0,"group":1,"y":10.4},{"x":8,"y2":0,"group":1,"y":10.4},{"x":8,"y2":0,"group":1,"y":14.7},{"x":4,"y2":0,"group":1,"y":32.4},{"x":4,"y2":0,"group":1,"y":30.4},{"x":4,"y2":0,"group":1,"y":33.9},{"x":4,"y2":0,"group":1,"y":21.5},{"x":8,"y2":0,"group":1,"y":15.5},{"x":8,"y2":0,"group":1,"y":15.2},{"x":8,"y2":0,"group":1,"y":13.3},{"x":8,"y2":0,"group":1,"y":19.2},{"x":4,"y2":0,"group":1,"y":27.3},{"x":4,"y2":0,"group":1,"y":26.0},{"x":4,"y2":0,"group":1,"y":30.4},{"x":8,"y2":0,"group":1,"y":15.8},{"x":6,"y2":0,"group":1,"y":19.7},{"x":8,"y2":0,"group":1,"y":15.0},{"x":4,"y2":0,"group":1,"y":21.4}]},{"name":"stats","source":"table","transform":[{"groupby":"x","type":"aggregate","summarize":{"y":["min","max","median","q1","q3","valid"]}}]},{"name":"iqrcalcs","source":"stats","transform":[{"field":"lower","expr":"max(datum.min_y,datum.q1_y-1.5*(datum.q3_y-datum.q1_y))","type":"formula"},{"field":"upper","expr":"min(datum.max_y,datum.q1_y+1.5*(datum.q3_y-datum.q1_y))","type":"formula"}]}],"scales":[{"name":"x","nice":true,"range":"width","domain":{"data":"table","field":"y"},"type":"linear","round":true},{"name":"y","points":true,"padding":1.5,"range":"height","domain":{"data":"table","field":"x"},"type":"ordinal","round":true},{"name":"group","nice":true,"range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"x"},"type":"ordinal","round":true}],"width":600,"signals":[{"name":"boxSize","init":40}]}
	);
</script>