---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Rugplot

Function Keywords:

{% highlight julia %}
x::AbstractVector
{% endhighlight %}

### Rugplot

{% highlight julia %}
using Vega, RDatasets

mtcars = dataset("datasets", "mtcars")
x = mtcars[:Disp]

v = rugplot(x = x)
{% endhighlight %}

<div id="rug"></div>
<script type="text/javascript">
parse("rug",
{"name":"Vega Visualization","height":20,"padding":"auto","marks":[{"name":"cell","marks":[{"properties":{"update":{"height":{"value":14},"x":{"field":"x","scale":"x"},"width":{"value":1},"fill":{"value":"#4682b4"},"opacity":{"value":0.7},"y":{"value":0}},"enter":{"height":{"value":14},"x":{"field":"x","scale":"x"},"width":{"value":1},"fill":{"value":"#4682b4"},"opacity":{"value":0.7},"y":{"value":0}}},"from":{"data":"table"},"type":"rect"}],"properties":{"enter":{"height":{"value":20},"width":{"value":400}}},"axes":[{"titleOffset":38,"format":"","layer":"back","properties":{"stroke":{"value":"#000000"},"opacity":{"value":0.08}},"title":"","grid":true,"type":"x","scale":"x","ticks":5}],"scales":[{"reverse":false,"name":"x","nice":true,"zero":true,"range":[0,400],"domain":{"data":"table","field":"x"},"type":"linear","round":true}],"type":"group"}],"data":[{"name":"table","values":[{"x":160.0,"y2":0,"group":1,"y":0},{"x":160.0,"y2":0,"group":1,"y":0},{"x":108.0,"y2":0,"group":1,"y":0},{"x":258.0,"y2":0,"group":1,"y":0},{"x":360.0,"y2":0,"group":1,"y":0},{"x":225.0,"y2":0,"group":1,"y":0},{"x":360.0,"y2":0,"group":1,"y":0},{"x":146.7,"y2":0,"group":1,"y":0},{"x":140.8,"y2":0,"group":1,"y":0},{"x":167.6,"y2":0,"group":1,"y":0},{"x":167.6,"y2":0,"group":1,"y":0},{"x":275.8,"y2":0,"group":1,"y":0},{"x":275.8,"y2":0,"group":1,"y":0},{"x":275.8,"y2":0,"group":1,"y":0},{"x":472.0,"y2":0,"group":1,"y":0},{"x":460.0,"y2":0,"group":1,"y":0},{"x":440.0,"y2":0,"group":1,"y":0},{"x":78.7,"y2":0,"group":1,"y":0},{"x":75.7,"y2":0,"group":1,"y":0},{"x":71.1,"y2":0,"group":1,"y":0},{"x":120.1,"y2":0,"group":1,"y":0},{"x":318.0,"y2":0,"group":1,"y":0},{"x":304.0,"y2":0,"group":1,"y":0},{"x":350.0,"y2":0,"group":1,"y":0},{"x":400.0,"y2":0,"group":1,"y":0},{"x":79.0,"y2":0,"group":1,"y":0},{"x":120.3,"y2":0,"group":1,"y":0},{"x":95.1,"y2":0,"group":1,"y":0},{"x":351.0,"y2":0,"group":1,"y":0},{"x":145.0,"y2":0,"group":1,"y":0},{"x":301.0,"y2":0,"group":1,"y":0},{"x":121.0,"y2":0,"group":1,"y":0}]}],"width":400}
);
</script>