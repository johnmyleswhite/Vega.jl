using Distributions
using Vega

plot(x = [1, 2, 3, 4, 5],
	 y = [1, 2, 3, 2, 1],
	 kind = :bar)

srand(1)
plot(x = [1:20],
	 y = rand(20),
	 kind = :bar)

plot(x = [1:100, 1:100],
	 y = [[1:100] + randn(100), 3.0 + 1.5 * [1:100] + randn(100)],
	 group = [[1 for i in 1:100], [2 for i in 1:100]],
	 kind = :line)

d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [3.0 0.1; 0.1 3.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')
x = points[:, 1]
y = points[:, 2]

plot(x = x, y = y, kind = :scatter)

d = rand(Gamma(1.0, 1.0), 1_000_000)
k = kde(d)
plot(x = k.x, y = k.density, kind = :area)

d = rand(Beta(10.0, 8.0), 1_000_000)
k = kde(d)
plot(x = k.x, y = k.density, kind = :area)
