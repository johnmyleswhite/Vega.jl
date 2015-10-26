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
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/stemleaf.png" alt="stemleaf">