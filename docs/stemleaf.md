---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Stem-and-Leaf Plot

Function Keywords:

{% highlight julia %}
y::AbstractVector{Int}
{% endhighlight %}

### Stem-and-Leaf Plot

{% highlight julia %}
data = [6, 1,3,5, 17, 32, 47, 53, 60, 61, 64, 67, 70, 70, 71, 72, 73, 73, 74, 76, 77,
        79, 81, 82, 83, 83, 83, 83, 84, 85, 86, 87, 87, 88, 89, 90, 91, 91, 92, 94, 94,
        95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 100, 100, 100, 101, 101, 102, 103, 103,
        103, 103, 104, 106, 106, 106, 106, 107, 107, 107, 107, 108, 109, 109, 110, 111,
        111, 111, 112, 112, 113, 114, 114, 114, 115, 116, 117, 117, 119, 120, 120, 120,
        120, 121, 121, 122, 122, 122, 123, 124, 124, 125, 125, 126, 126, 127, 128, 129,
        130, 131, 131, 131, 131, 132, 132, 132, 132, 133, 133, 134, 134, 134, 135, 135,
        135, 136, 136, 136, 137, 138, 139, 140, 140, 142, 143, 144, 145, 145, 145, 145,
        145, 147, 149, 152, 155, 157, 159]

v = stemleaf(y = data)

#Add Key
text!(v, title = "Key: 4 | 2 = 42 parts per million", y = 500, x= 80, fontWeight = "bold")
{% endhighlight %}

<div id="stem"></div>
<script type="text/javascript">
parse("stem",
    {"name":"Vega Visualization","height":450,"padding":"auto","marks":[{"properties":{"enter":{"text":{"field":"group"},"shape":{"value":""},"x":{"offset":-10,"field":"x","scale":"x"},"fillOpacity":{"value":1},"fill":{"field":"group","scale":"group"},"size":{"value":""},"baseline":{"value":"middle"},"y":{"offset":0.5,"field":"y","scale":"y"}}},"from":{"data":"table"},"type":"text"},{"properties":{"enter":{"align":{"value":"center"},"fontWeight":{"value":"bold"},"x":{"value":80},"font":{"value":""},"fontSize":{"value":12},"fill":{"value":"black"},"baseline":{"value":"top"},"text":{"value":"Key: 4 | 2 = 42 parts per million"},"y":{"value":500}}},"from":{"value":"Key: 4 | 2 = 42 parts per million"},"type":"text"}],"axes":[{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"x","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"axis":{"stroke":{"value":"transparent"}},"labels":{"fill":{"value":"transparent"}},"title":{"fontSize":{"value":14}},"ticks":{"stroke":{"value":"transparent"}}},"grid":false,"title":"","type":"x","ticks":0},{"tickSizeEnd":0,"tickSizeMajor":0,"scale":"y","tickSize":0,"tickSizeMinor":0,"format":"","layer":"front","properties":{"title":{"fontSize":{"value":14}},"ticks":{"stroke":{"value":"transparent"}}},"grid":false,"title":"","type":"y","ticks":15}],"data":[{"name":"table","values":[{"x":1,"y2":0,"group":1,"y":0},{"x":2,"y2":0,"group":3,"y":0},{"x":3,"y2":0,"group":5,"y":0},{"x":4,"y2":0,"group":6,"y":0},{"x":1,"y2":0,"group":7,"y":1},{"x":1,"y2":0,"group":2,"y":3},{"x":1,"y2":0,"group":7,"y":4},{"x":1,"y2":0,"group":3,"y":5},{"x":1,"y2":0,"group":0,"y":6},{"x":2,"y2":0,"group":1,"y":6},{"x":3,"y2":0,"group":4,"y":6},{"x":4,"y2":0,"group":7,"y":6},{"x":1,"y2":0,"group":0,"y":7},{"x":2,"y2":0,"group":0,"y":7},{"x":3,"y2":0,"group":1,"y":7},{"x":4,"y2":0,"group":2,"y":7},{"x":5,"y2":0,"group":3,"y":7},{"x":6,"y2":0,"group":3,"y":7},{"x":7,"y2":0,"group":4,"y":7},{"x":8,"y2":0,"group":6,"y":7},{"x":9,"y2":0,"group":7,"y":7},{"x":10,"y2":0,"group":9,"y":7},{"x":1,"y2":0,"group":1,"y":8},{"x":2,"y2":0,"group":2,"y":8},{"x":3,"y2":0,"group":3,"y":8},{"x":4,"y2":0,"group":3,"y":8},{"x":5,"y2":0,"group":3,"y":8},{"x":6,"y2":0,"group":3,"y":8},{"x":7,"y2":0,"group":4,"y":8},{"x":8,"y2":0,"group":5,"y":8},{"x":9,"y2":0,"group":6,"y":8},{"x":10,"y2":0,"group":7,"y":8},{"x":11,"y2":0,"group":7,"y":8},{"x":12,"y2":0,"group":8,"y":8},{"x":13,"y2":0,"group":9,"y":8},{"x":1,"y2":0,"group":0,"y":9},{"x":2,"y2":0,"group":1,"y":9},{"x":3,"y2":0,"group":1,"y":9},{"x":4,"y2":0,"group":2,"y":9},{"x":5,"y2":0,"group":4,"y":9},{"x":6,"y2":0,"group":4,"y":9},{"x":7,"y2":0,"group":5,"y":9},{"x":8,"y2":0,"group":6,"y":9},{"x":9,"y2":0,"group":7,"y":9},{"x":10,"y2":0,"group":8,"y":9},{"x":11,"y2":0,"group":8,"y":9},{"x":12,"y2":0,"group":9,"y":9},{"x":13,"y2":0,"group":9,"y":9},{"x":14,"y2":0,"group":9,"y":9},{"x":15,"y2":0,"group":9,"y":9},{"x":16,"y2":0,"group":9,"y":9},{"x":1,"y2":0,"group":0,"y":10},{"x":2,"y2":0,"group":0,"y":10},{"x":3,"y2":0,"group":0,"y":10},{"x":4,"y2":0,"group":1,"y":10},{"x":5,"y2":0,"group":1,"y":10},{"x":6,"y2":0,"group":2,"y":10},{"x":7,"y2":0,"group":3,"y":10},{"x":8,"y2":0,"group":3,"y":10},{"x":9,"y2":0,"group":3,"y":10},{"x":10,"y2":0,"group":3,"y":10},{"x":11,"y2":0,"group":4,"y":10},{"x":12,"y2":0,"group":6,"y":10},{"x":13,"y2":0,"group":6,"y":10},{"x":14,"y2":0,"group":6,"y":10},{"x":15,"y2":0,"group":6,"y":10},{"x":16,"y2":0,"group":7,"y":10},{"x":17,"y2":0,"group":7,"y":10},{"x":18,"y2":0,"group":7,"y":10},{"x":19,"y2":0,"group":7,"y":10},{"x":20,"y2":0,"group":8,"y":10},{"x":21,"y2":0,"group":9,"y":10},{"x":22,"y2":0,"group":9,"y":10},{"x":1,"y2":0,"group":0,"y":11},{"x":2,"y2":0,"group":1,"y":11},{"x":3,"y2":0,"group":1,"y":11},{"x":4,"y2":0,"group":1,"y":11},{"x":5,"y2":0,"group":2,"y":11},{"x":6,"y2":0,"group":2,"y":11},{"x":7,"y2":0,"group":3,"y":11},{"x":8,"y2":0,"group":4,"y":11},{"x":9,"y2":0,"group":4,"y":11},{"x":10,"y2":0,"group":4,"y":11},{"x":11,"y2":0,"group":5,"y":11},{"x":12,"y2":0,"group":6,"y":11},{"x":13,"y2":0,"group":7,"y":11},{"x":14,"y2":0,"group":7,"y":11},{"x":15,"y2":0,"group":9,"y":11},{"x":1,"y2":0,"group":0,"y":12},{"x":2,"y2":0,"group":0,"y":12},{"x":3,"y2":0,"group":0,"y":12},{"x":4,"y2":0,"group":0,"y":12},{"x":5,"y2":0,"group":1,"y":12},{"x":6,"y2":0,"group":1,"y":12},{"x":7,"y2":0,"group":2,"y":12},{"x":8,"y2":0,"group":2,"y":12},{"x":9,"y2":0,"group":2,"y":12},{"x":10,"y2":0,"group":3,"y":12},{"x":11,"y2":0,"group":4,"y":12},{"x":12,"y2":0,"group":4,"y":12},{"x":13,"y2":0,"group":5,"y":12},{"x":14,"y2":0,"group":5,"y":12},{"x":15,"y2":0,"group":6,"y":12},{"x":16,"y2":0,"group":6,"y":12},{"x":17,"y2":0,"group":7,"y":12},{"x":18,"y2":0,"group":8,"y":12},{"x":19,"y2":0,"group":9,"y":12},{"x":1,"y2":0,"group":0,"y":13},{"x":2,"y2":0,"group":1,"y":13},{"x":3,"y2":0,"group":1,"y":13},{"x":4,"y2":0,"group":1,"y":13},{"x":5,"y2":0,"group":1,"y":13},{"x":6,"y2":0,"group":2,"y":13},{"x":7,"y2":0,"group":2,"y":13},{"x":8,"y2":0,"group":2,"y":13},{"x":9,"y2":0,"group":2,"y":13},{"x":10,"y2":0,"group":3,"y":13},{"x":11,"y2":0,"group":3,"y":13},{"x":12,"y2":0,"group":4,"y":13},{"x":13,"y2":0,"group":4,"y":13},{"x":14,"y2":0,"group":4,"y":13},{"x":15,"y2":0,"group":5,"y":13},{"x":16,"y2":0,"group":5,"y":13},{"x":17,"y2":0,"group":5,"y":13},{"x":18,"y2":0,"group":6,"y":13},{"x":19,"y2":0,"group":6,"y":13},{"x":20,"y2":0,"group":6,"y":13},{"x":21,"y2":0,"group":7,"y":13},{"x":22,"y2":0,"group":8,"y":13},{"x":23,"y2":0,"group":9,"y":13},{"x":1,"y2":0,"group":0,"y":14},{"x":2,"y2":0,"group":0,"y":14},{"x":3,"y2":0,"group":2,"y":14},{"x":4,"y2":0,"group":3,"y":14},{"x":5,"y2":0,"group":4,"y":14},{"x":6,"y2":0,"group":5,"y":14},{"x":7,"y2":0,"group":5,"y":14},{"x":8,"y2":0,"group":5,"y":14},{"x":9,"y2":0,"group":5,"y":14},{"x":10,"y2":0,"group":5,"y":14},{"x":11,"y2":0,"group":7,"y":14},{"x":12,"y2":0,"group":9,"y":14},{"x":1,"y2":0,"group":2,"y":15},{"x":2,"y2":0,"group":5,"y":15},{"x":3,"y2":0,"group":7,"y":15},{"x":4,"y2":0,"group":9,"y":15}]}],"scales":[{"name":"x","range":"width","domain":{"data":"table","field":"x"},"type":"linear"},{"reverse":true,"name":"y","zero":true,"domainMax":15,"domain":{"data":"table","field":"y"},"range":"height","type":"linear","round":false},{"name":"group","range":["black"],"domain":{"data":"table","field":"group"},"type":"ordinal"}],"width":450,"legends":[]}

	);
</script>