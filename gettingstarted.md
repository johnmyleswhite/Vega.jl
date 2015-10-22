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

Currently, Vega.jl requires an Internet connection to render graphs, as the [vega](https://github.com/vega/vega) project is progressing so rapidly in version 2 that it is infeasible to have the JavaScript libraries as local copies. In the future, all of the JavaScript libraries needed to render graphics will be provided as part of the package for the ability to create visualizations without requiring an Internet connection.

## Supported Environments

Vega.jl works with both Jupyter Notebook and the Julia REPL. When using Jupyter Notebooks, the graphics will automatically be printed in-line. Submitting commands via the REPL will either open a new tab in the currently open (default) browser, or trigger the default browser to open.

Vega.jl is only targeted to work against v0.4 of Julia (or newer). However, some use of the [`Compat.jl`](https://github.com/JuliaLang/Compat.jl) package to provide backwards compatibility has been done. If you are looking for increased backwards capatibility, please submit a pull request as necessary to support your preferred version of Julia.

## Browser / OS compatibility

Testing for this package is done primarily on OSX, using recent versions Chrome, Firefox and Safari. Testing is also occasionally done on ElementaryOS (Linux) using the Midori browser.

It is expected, but not confirmed, that Vega.jl will work in an equivalent Windows environment and browsers. If it does not, please submit a [GitHub issue](https://github.com/johnmyleswhite/Vega.jl/issues).


