---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Wordcloud

Function Keywords:

{% highlight julia %}
x::AbstractVector
y::AbstractVector
{% endhighlight %}

### Wordcloud

{% highlight julia %}
words = ["mullet", "mull it", "julialang", "viz", "visualization", "muppet", "business", "front", "party", "back", "juliacon", "julia"]
frequencies = [80, 44, 40, 36, 32, 28, 24, 50, 12, 10, 10, 8]

wordcloud(x = words, y = frequencies)
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/wordcloud.png" alt="wordcloud">
