---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Bar Plot

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
y2::AbstractVector
group::AbstractVector
stacked::Bool = false
horizontal::Bool = false
normalize::Bool = false
{% endhighlight %}

### Vertical Bar
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

barplot(x = x, y = y)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/barplot.png" alt = "barplot" >

 <div id="vis"></div>

 <script type="text/javascript">
// parse a spec and create a visualization view
function parse(spec) {
  vg.parse.spec(spec, function(chart) { chart({el:"#vis"}).update(); });
}
parse(

{"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"x":{"field":"x","scale":"x"},"y2":{"field":"y2","scale":"y"},"width":{"offset":-1,"scale":"x","band":true},"fill":{"field":"group","scale":"group"},"y":{"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"rect"}],"axes":[{"properties":{"title":{"fontSize":{"value":14}}},"title":"x","type":"x","scale":"x"},{"titleOffset":40,"properties":{"title":{"fontSize":{"value":14}}},"title":"y","type":"y","scale":"y"}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":1},{"x":2,"y2":0,"group":1,"y":2},{"x":3,"y2":0,"group":1,"y":3},{"x":4,"y2":0,"group":1,"y":2},{"x":5,"y2":0,"group":1,"y":1}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"ordinal"},{"name":"y","range":"height","domain":{"data":"table","field":"y"},"type":"linear"},{"name":"group","range":["rgb(166,206,227)","rgb( 31,120,180)","rgb(178,223,138)","rgb( 51,160, 44)","rgb(251,154,153)","rgb(227, 26, 28)","rgb(253,191,111)","rgb(255,127,  0)","rgb(202,178,214)","rgb(106, 61,154)","rgb(255,255,153)","rgb(177, 89, 40)"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450});
</script>

### Horizontal Bar
{% highlight julia %}
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

barplot(x = x, y = y, horizontal = true)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/horizontalbar.png" alt = "horizontalbar" >

### Group Argument
{% highlight julia %}
using Vega

x = [1:20]
y = rand(20)
group = [round(val/10) for val in x]

barplot(x = x, y = y, group = group)
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/groupbar.png" alt = "groupedbar">

### Stacked Bar (with additional `colorscheme!` change)
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

b = barplot(x = x, y = y, group = g, stacked = true)
colorscheme!(b, palette = ("Greens", 3))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/stackedbar.png" alt = "stackedbar">

### Horizontal Stacked Bar (with additional `colorscheme!` change)
{% highlight julia %}
using Vega

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

b = barplot(x = x, y = y, group = g, stacked = true, horizontal = true)
colorscheme!(b, palette = ("Greens", 3))
{% endhighlight %}

<img src ="http://johnmyleswhite.github.io/Vega.jl/images/stackedbarh.png" alt = "stackedbarh">
