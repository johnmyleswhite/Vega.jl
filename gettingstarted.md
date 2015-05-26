---

layout: minimal
title: Vega.jl - A Julia package for generating visualizations using Vega

---

# Getting Started

Vega.jl is listed on METADATA.jl, so downloading and installing Vega is the same as any other package:

{% highlight julia %}
Pkg.add("Vega")
using Vega
{% endhighlight %}

The [vega.js](http://trifacta.github.io/vega/vega.min.js) and [d3.js](https://github.com/mbostock/d3/releases/download/v3.5.5/d3.zip) libraries needed to render graphics have been provided as part of the package for convenience, as well as for the ability to create visualizations without requiring an Internet connection.

Should you choose to update to a newer version of either of these libraries, just be sure that the [`deps/vega`](https://github.com/johnmyleswhite/Vega.jl/tree/master/deps/vega) directory structure remains the same, so that the Julia code references will continue to work.

## Supported Environments

Vega.jl works with both Jupyter Notebook and the Julia REPL. When using Jupyter Notebooks, the graphics will automatically be printed in-line. Submitting commands via the REPL will either open a new tab in the currently open (default) browser, or trigger the default browser to open.

Note that given the consistent updates to Base Julia, Vega.jl is only targeted to work against v0.4 of Julia (or newer). Use of the [`Compat.jl`](https://github.com/JuliaLang/Compat.jl) package to provide backwards compatibility is not planned.

## Browser / OS compatibility

Testing for this package is done primarily on OSX, using recent versions Chrome, Firefox and Safari. Testing is also occasionally done on ElementaryOS (Linux) using the Midori browser.

It is expected, but not confirmed, that Vega.jl will work in an equivalent Windows environment and browsers. If it does not, please submit a [GitHub issue](https://github.com/johnmyleswhite/Vega.jl/issues).


