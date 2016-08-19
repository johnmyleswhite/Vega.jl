---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Using Interact.jl and Vega in Jupyter Notebooks

The [Interact](https://github.com/JuliaLang/Interact.jl) package provides interactive widgets such as sliders, dropdowns and checkboxes to play with the Julia code that generates your plots.

Here is a simple example using the Distributions package:
{% highlight julia %}
    using Interact, Vega, Distributions
    @manipulate for μ in -10:10, σ = 0.1:0.5:5.1
        x = -20:0.01:20
        lineplot(y = pdf(Normal(μ, σ), x), x=x)
    end
{% endhighlight %}
<img src="http://johnmyleswhite.github.io/Vega.jl/images/interact_jupyter.gif"/>
