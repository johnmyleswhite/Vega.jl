---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Histogram

Function Keywords:

{% highlight julia %}
x::AbstractVector
relativefreq::Bool = false
horizontal::Bool = false
nbins::Int = 10
{% endhighlight %}

### Histogram

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 100_000)

v = histogram(x = x)
{% endhighlight %}

<div id="hist"></div>
<script type="text/javascript">
parse("hist",
	{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":0,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1.0,"y2":0,"group":1,"y":8106.0},{"x":2.0,"y2":0,"group":1,"y":24001.0},{"x":3.0,"y2":0,"group":1,"y":25313.0},{"x":4.0,"y2":0,"group":1,"y":18580.0},{"x":5.0,"y2":0,"group":1,"y":11453.0},{"x":6.0,"y2":0,"group":1,"y":6312.0},{"x":7.0,"y2":0,"group":1,"y":3297.0},{"x":8.0,"y2":0,"group":1,"y":1556.0},{"x":9.0,"y2":0,"group":1,"y":771.0},{"x":10.0,"y2":0,"group":1,"y":326.0},{"x":11.0,"y2":0,"group":1,"y":158.0},{"x":12.0,"y2":0,"group":1,"y":73.0},{"x":13.0,"y2":0,"group":1,"y":25.0},{"x":14.0,"y2":0,"group":1,"y":13.0},{"x":15.0,"y2":0,"group":1,"y":10.0},{"x":16.0,"y2":0,"group":1,"y":4.0},{"x":17.0,"y2":0,"group":1,"y":1.0},{"x":18.0,"y2":0,"group":1,"y":1.0}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450}

	);
</script>

### Histogram - Relative Frequency

{% highlight julia %}
using Vega, Distributions

x = rand(Gamma(3.0, 1.0), 100_000)

v = histogram(x = x, relativefreq = true)
{% endhighlight %}

<div id="relhist"></div>
<script type="text/javascript">
parse("relhist",
	{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":0,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1.0,"y2":0,"group":1,"y":0.08106},{"x":2.0,"y2":0,"group":1,"y":0.24001},{"x":3.0,"y2":0,"group":1,"y":0.25313},{"x":4.0,"y2":0,"group":1,"y":0.1858},{"x":5.0,"y2":0,"group":1,"y":0.11453},{"x":6.0,"y2":0,"group":1,"y":0.06312},{"x":7.0,"y2":0,"group":1,"y":0.03297},{"x":8.0,"y2":0,"group":1,"y":0.01556},{"x":9.0,"y2":0,"group":1,"y":0.00771},{"x":10.0,"y2":0,"group":1,"y":0.00326},{"x":11.0,"y2":0,"group":1,"y":0.00158},{"x":12.0,"y2":0,"group":1,"y":0.00073},{"x":13.0,"y2":0,"group":1,"y":0.00025},{"x":14.0,"y2":0,"group":1,"y":0.00013},{"x":15.0,"y2":0,"group":1,"y":0.0001},{"x":16.0,"y2":0,"group":1,"y":4.0e-5},{"x":17.0,"y2":0,"group":1,"y":1.0e-5},{"x":18.0,"y2":0,"group":1,"y":1.0e-5}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450}
	);
</script>
