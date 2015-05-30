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
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/waterfall.png" alt = "waterfall">