---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Choropleth

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
entity::Symbol = :uscounties
{% endhighlight %}

# U.S. Counties
The input for the X array are [5-digit U.S. county-level FIPS codes](https://en.wikipedia.org/wiki/FIPS_county_code), not zip codes. The two are not interchangeable. Additionally, you need to account for missing FIPS codes manually at the moment, this function will not plot shapes if you do not provide a FIPS code value. This will likely be remedied in a future release.

{% highlight julia %}
using Vega, DataFrames
df = readtable(Pkg.dir("Vega", "vega-datasets/unemployment.tsv"))

v = choropleth(x = df[:id], y = df[:rate])
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/choropleth.png" alt = "choropleth">

# U.S. States
The input for the X array are 2-digit [U.S. state-level FIPS codes](https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code). Additionally, you need to account for missing FIPS codes manually at the moment, this function will not plot shapes if you do not provide a FIPS code value. This will likely be remedied in a future release.

{% highlight julia %}
x = [1:60]
y = rand(Float64, 60)

a = choropleth(x = x, y = y, entity = :usstates)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/usstates.png" alt = "usstates">