---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Wordcloud

Function Keywords:

{% highlight julia %}
x::AbstractVector
{% endhighlight %}

### Wordcloud

{% highlight julia %}
corpus = [
"Julia is a high-level, high-performance dynamic programming language for technical computing, with syntax that is familiar to users of other technical computing environments. It provides a sophisticated compiler, distributed parallel execution, numerical accuracy, and an extensive mathematical function library. Julia’s Base library, largely written in Julia itself, also integrates mature, best-of-breed open source C and Fortran libraries for linear algebra, random number generation, signal processing, and string processing. In addition, the Julia developer community is contributing a number of external packages through Julia’s built-in package manager at a rapid pace. IJulia, a collaboration between the IPython and Julia communities, provides a powerful browser-based graphical notebook interface to Julia.",
"Julia programs are organized around multiple dispatch; by defining functions and overloading them for different combinations of argument types, which can also be user-defined. For a more in-depth discussion of the rationale and advantages of Julia over other systems, see the following highlights or read the introduction in the online manual."
]

wc = wordcloud(x = corpus)
colorscheme!(wc, ("Spectral", 11))
{% endhighlight %}
<img src ="http://johnmyleswhite.github.io/Vega.jl/images/wordcloud.png" alt="wordcloud">
