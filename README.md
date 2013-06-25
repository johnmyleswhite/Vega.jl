Vega.jl
=======

# Introduction

A Julia package for creating the simplest kinds of Vega visualizations.

* Barplots
* Scatterplots
* Lineplots

# Usage Examples

using Vega

printjson(barplot([1, 2, 3, 4, 5], [1, 2, 3, 2, 1]))

srand(1)
printjson(barplot([1:20], rand(20)))
