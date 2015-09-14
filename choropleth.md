---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Choropleth

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
{% endhighlight %}

Note: The input for the X array are FIPS codes, not zip codes. The two are not interchangeable. Additionally, you need to account for missing FIPS codes manually at the moment, this function will not plot shapes if you do not provide a FIPS code value. This will likely be remedied in a future release.

{% highlight julia %}
using Vega, DataFrames
df = readtable(Pkg.dir("Vega", "deps/vega2/test/data/unemployment.tsv"))

v = choropleth(x = df[:id], y = df[:rate])
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/choropleth.png" alt = "choropleth">