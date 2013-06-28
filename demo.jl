using Distributions
using Vega

x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

plot(x = x, y = y, kind = :scatter)
plot(x = x, y = y, kind = :line)
plot(x = x, y = y, kind = :bar)
plot(x = x, y = y, kind = :area)

srand(1)
x = [1:20]
y = rand(20)
g = vcat([1 for i in 1:10], [2 for i in 1:10])
plot(x = x, y = y, kind = :bar)
plot(x = x, y = y, group = g, kind = :bar)

x = [1:100, 1:100]
y = [[1:100] + randn(100), 3.0 + 1.5 * [1:100] + randn(100)]
g = [[1 for i in 1:100], [2 for i in 1:100]]
plot(x = x, y = y, group = g, kind = :line)

x = rand(Gamma(1.0, 1.0), 1_000_000)
k = kde(x, 0.1, 2048)
plot(x = k.x, y = k.density, kind = :area)

x = rand(Beta(3.0, 2.0), 1_000_000)
k = kde(x, 0.1, 2048)
plot(x = k.x, y = k.density, kind = :area)

d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [4.0 0.5; 0.5 4.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')
x = points[:, 1]
y = points[:, 2]
p = plot(x = x, y = y,
	 group = vcat(ones(Int, 500), ones(Int, 500) + 1),
	 kind = :scatter)
p.marks[1].properties.hover = copy(p.marks[1].properties.enter)
p.marks[1].properties.update = copy(p.marks[1].properties.enter)
p.marks[1].properties.hover.fill = VegaValueRef(value = "#33ff33")
p.marks[1].properties.hover.shape = VegaValueRef(value = "diamond")
p.marks[1].properties.hover.size = VegaValueRef(value = 250.0)
p

p1 = plot(x = [1:100, 1:100],
	      y = [[1:100] + randn(100), 3.0 + 1.5 * [1:100] + randn(100)],
	      group = [[1 for i in 1:100], [2 for i in 1:100]],
	      kind = :line)
p2 = plot(x = [1:100, 1:100],
	      y = [[1:100] + randn(100), 3.0 + 1.5 * [1:100] + randn(100)],
	      group = [[1 for i in 1:100], [2 for i in 1:100]],
	      kind = :scatter)
p2.marks[1].properties.enter.size = VegaValueRef(value = 10.0)
p2.marks[1].properties.enter.shape = VegaValueRef(value = "diamond")
push!(p1.marks, p2.marks[1])
p1

d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [4.0 0.5; 0.5 4.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')
x = points[:, 1]
Vega.plot(k::Distributions.UnivariateKDE) = areaplot(x = k.x, y = k.density)
plot(kde(x, 0.1, 2_048))
plot(kde(x, 1.0, 2_048))
plot(kde(x, 10.0, 2_048))
