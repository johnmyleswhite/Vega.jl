---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# hover!

Arguments:

{% highlight julia %}
v::VegaVisualization
opacity::Number = 1
{% endhighlight %}

This function mutates `:VegaVisualization`, changing the opacity of a mark when the mouse cursor moves over it.

### Example code
GitHub Pages doesn't support interactivity, so there isn't a way to show the functionality of hovering over the chart. Running the code snippet below will highlight the behavior, or you can visit the [area chart example](http://vega.github.io/vega-editor/?mode=vega&spec=stacked_area) at the Vega editor.

{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = areaplot(x = x, y = y, group = g, stacked = true)

hover!(a, opacity = 0.5)
{% endhighlight %}
