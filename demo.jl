using Vega

barplot([1, 2, 3, 4, 5], [1, 2, 3, 2, 1])

srand(1)
barplot([1:20], rand(20))

lineplot([1:100, 1:100],
	     [randn(100), randn(100)],
	     [[1 for i in 1:100], [2 for i in 1:100]])

using Distributions
d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [3.0 0.1; 0.1 3.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')
x = points[:, 1]
y = points[:, 2]

scatterplot(x, y)
