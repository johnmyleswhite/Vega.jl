---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bubble Chart

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
group::AbstractVector
pointSize::AbstractVector
pointShape::AbstractString = "circle"
{% endhighlight %}

### Bubble Chart

Example data taken from the <a href="http://www.highcharts.com/demo/bubble">High Charts Bubble Chart</a> example, with some modifications
{% highlight julia %}
x = [95, 86.5, 80.8, 80.4, 80.3, 78.4, 74.2, 73.5, 71, 69.2, 68.6, 65.5, 65.4, 63.4, 64]
y = [95, 102.9, 91.5, 102.5, 86.1, 70.1, 68.5, 83.1, 93.2, 57.6, 20, 126.4, 50.8, 51.8, 82.9]
cont = ["EU", "EU", "EU", "EU", "EU", "EU", "EU", "NO", "EU", "EU", "RU", "US", "EU", "EU", "NZ"]
z = [13.8, 14.7, 15.8, 12, 11.8, 16.6, 14.5, 10, 24.7, 10.4, 16, 35.3, 28.5, 15.4, 31.3]


v = bubblechart(x = x, y = y, group = cont, pointSize = z)

#Chart mods
v.width = 600
v.height = 300
xlim!(v, min = 60, max = 100)
ylim!(v, min = 10, max = 160)
title!(v, title = "Sugar and Fat Intake Per Country")
ylab!(v, title = "Daily Sugar Intake", grid = true)
xlab!(v, title = "Daily Fat Intake", grid = true)
hline!(v, value = 50, strokeDash = 5, stroke = "gray")
vline!(v, value = 65, strokeDash = 5, stroke = "gray")
hover!(v, opacity = 0.5)
{% endhighlight %}

<div id="bubble"></div>
<script type="text/javascript">
parse("bubble",
	{"name":"Vega Visualization","height":300,"padding":"auto","marks":[{"properties":{"update":{"fillOpacity":{"value":1}},"hover":{"fillOpacity":{"value":0.5}},"enter":{"shape":{"value":"circle"},"x":{"field":"x","scale":"x"},"size":{"mult":30,"field":"y2"},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"symbol"},{"properties":{"enter":{"align":{"value":"center"},"fontWeight":{"value":"bold"},"x":{"value":300.0},"font":{"value":""},"fontSize":{"value":16},"fill":{"value":"black"},"baseline":{"value":"top"},"text":{"value":"Sugar and Fat Intake Per Country"},"y":{"value":-40}}},"from":{"value":"Sugar and Fat Intake Per Country"},"type":"text"},{"properties":{"enter":{"strokeDash":{"value":[5]},"stroke":{"value":"gray"},"x2":{"field":{"group":"width"}},"x":{"field":{"group":"x"}},"strokeWidth":{"value":1.5},"y":{"value":50,"scale":"y"}}},"type":"rule"},{"properties":{"enter":{"strokeDash":{"value":[5]},"stroke":{"value":"gray"},"x":{"value":65,"scale":"x"},"y2":{"field":{"group":"height"}},"strokeWidth":{"value":1.5},"y":{"field":{"group":"y"}}}},"type":"rule"}],"axes":[{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"x","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":true,"title":"Daily Fat Intake","type":"x","ticks":0},{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"y","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":true,"title":"Daily Sugar Intake","type":"y","ticks":0}],"data":[{"name":"table","values":[{"x":95.0,"y2":13.8,"group":"EU","y":95.0},{"x":86.5,"y2":14.7,"group":"EU","y":102.9},{"x":80.8,"y2":15.8,"group":"EU","y":91.5},{"x":80.4,"y2":12.0,"group":"EU","y":102.5},{"x":80.3,"y2":11.8,"group":"EU","y":86.1},{"x":78.4,"y2":16.6,"group":"EU","y":70.1},{"x":74.2,"y2":14.5,"group":"EU","y":68.5},{"x":73.5,"y2":10.0,"group":"NO","y":83.1},{"x":71.0,"y2":24.7,"group":"EU","y":93.2},{"x":69.2,"y2":10.4,"group":"EU","y":57.6},{"x":68.6,"y2":16.0,"group":"RU","y":20.0},{"x":65.5,"y2":35.3,"group":"US","y":126.4},{"x":65.4,"y2":28.5,"group":"EU","y":50.8},{"x":63.4,"y2":15.4,"group":"EU","y":51.8},{"x":64.0,"y2":31.3,"group":"NZ","y":82.9}]}],"scales":[{"reverse":false,"name":"x","zero":false,"domainMax":100,"domain":{"data":"table","field":"x"},"domainMin":60,"range":"width","type":"linear","round":false},{"reverse":false,"name":"y","zero":false,"domainMax":160,"domain":{"data":"table","field":"y"},"domainMin":10,"range":"height","type":"linear","round":false},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":600,"legends":[{"title":"Group","fill":"group"}]}
	);
</script>