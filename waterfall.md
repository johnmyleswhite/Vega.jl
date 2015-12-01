---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Waterfall

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
{% endhighlight %}

A waterfall chart is often used in marketing and finance to show the cumulative effect of multiple line items in an Income Statement or Marketing Campaign.

To create this chart, pass in each line-item individually; the function will do the appropriate calculations, as well as setting the positive values to green, the negative values to red and the total to blue (customizable using [colorscheme!](http://johnmyleswhite.github.io/Vega.jl/colorscheme.html))

{% highlight julia %}
using Vega

categories = ["Product Revenue", "Services Revenue", "Fixed Costs", "Variable Costs", "One-Time Costs"]
value = [420000, 210000, -170000, -140000, -75000]

waterfall(x = categories, y = value)
{% endhighlight %}

<div id="wf"></div>
<script type="text/javascript">
parse("wf",
    {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"offset":31,"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"mult":0.5,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"x","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":false,"title":"","type":"x","ticks":0},{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"y","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}}},"grid":false,"title":"","type":"y","ticks":0}],"data":[{"name":"table","values":[{"x":"Product Revenue","y2":0,"group":0,"y":420000},{"x":"Services Revenue","y2":420000,"group":0,"y":630000},{"x":"Fixed Costs","y2":630000,"group":1,"y":460000},{"x":"Variable Costs","y2":460000,"group":1,"y":320000},{"x":"One-Time Costs","y2":320000,"group":1,"y":245000},{"x":"Total","y2":0,"group":2,"y":245000}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["#4daf4a","#e41a1c","#377eb8"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":660,"legends":[]}

	);
</script>