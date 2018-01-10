using JSON, Vega, Base.Test, KernelDensity, Distributions, RDatasets

#### Tests ####
#Test that Julia returned VegaVisulization (every public function does)

#1. Area Plot
println("Test 1")
x = rand(Beta(3.0, 2.0), 10)
k = kde(x)
a = areaplot(x = k.x, y = k.density);

@test typeof(a) == VegaVisualization

#2. Stacked Area
println("Test 2")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = areaplot(x = x, y = y, group = g, stacked = true);

@test typeof(a) == VegaVisualization

#3. Normalized Stacked area
println("Test 3")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = areaplot(x = x, y = y, group = g, stacked = true, normalize = true);

@test typeof(a) == VegaVisualization

#4. Aster Plot
println("Test 4")
score = [59, 24, 98, 60 ,74,70,42,77,88,60,65,71,88,83]
id = ["FIS", "MAR","AO","NP","CS","CP","TR","LIV","ECO","ICO","LSP","CW","HAB","SPP"]
weight = [0.5, 0.5, 1,1,1,1,1,0.5,0.5,0.5,0.5,1,0.5,0.5]
a = asterplot(x = id, y = score, weight = weight, holesize = 75);

@test typeof(a) == VegaVisualization

#5. Bar plot
println("Test 5")
x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]
a = barplot(x = x, y = y);

@test typeof(a) == VegaVisualization

#6. Horizontal Bar Plot
println("Test 6")
x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]
a = barplot(x = x, y = y, horizontal = true);

@test typeof(a) == VegaVisualization

#7. Group Argument
println("Test 7")
x = collect(1:20)
y = rand(20)
group = [round(val/10) for val in x]
a = barplot(x = x, y = y, group = group);

@test typeof(a) == VegaVisualization

#8. Stacked bar
println("Test 8")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = barplot(x = x, y = y, group = g, stacked = true);

@test typeof(a) == VegaVisualization

#9. Horizontal Normalized Bar
println("Test 9")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = barplot(x = x, y = y, group = g, stacked = true, normalize = true, horizontal = true);

@test typeof(a) == VegaVisualization

#10. Single boxplot
println("Test 10")
df = dataset("datasets", "mtcars")
a = boxplot(y = df[:MPG])

@test typeof(a) == VegaVisualization

#11. Group boxplot
println("Test 11")
df = dataset("datasets", "mtcars")
boxplot(y = df[:MPG], group = df[:Cyl])

@test typeof(a) == VegaVisualization

#12. Bubble Chart
println("Test 12")
x = [95, 86.5, 80.8, 80.4, 80.3, 78.4, 74.2, 73.5, 71, 69.2, 68.6, 65.5, 65.4, 63.4, 64]
y = [95, 102.9, 91.5, 102.5, 86.1, 70.1, 68.5, 83.1, 93.2, 57.6, 20, 126.4, 50.8, 51.8, 82.9]
cont = ["EU", "EU", "EU", "EU", "EU", "EU", "EU", "NO", "EU", "EU", "RU", "US", "EU", "EU", "NZ"]
z = [13.8, 14.7, 15.8, 12, 11.8, 16.6, 14.5, 10, 24.7, 10.4, 16, 35.3, 28.5, 15.4, 31.3]
a = bubblechart(x = x, y = y, group = cont, pointSize = z)

@test typeof(a) == VegaVisualization

#13. Choropleth Counties
println("Test 13")
df = readtable(joinpath(dirname(@__FILE__), "..", "vega-datasets/unemployment.tsv"))
a = choropleth(x = df[:id], y = df[:rate])

@test typeof(a) == VegaVisualization

#14. Choropleth States
println("Test 14")
x = collect(1:60)
y = rand(Float64, 60)
a = choropleth(x = x, y = y, entity = :usstates)

@test typeof(a) == VegaVisualization

#15. Grouped Bar
println("Test 15")
category = ["A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C"]
group = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]
a = groupedbar(x = category, y = value, group = group);

@test typeof(a) == VegaVisualization

#16. Heatmap
println("Test 16")
x = Array{Int}(900)
y = Array{Int}(900)
color = Array{Float64}(900)

t = 0
for i in 1:30
    for j in 1:30
        t += 1
        x[t] = i
        y[t] = j
        color[t] = rand()
    end
end
a = heatmap(x = x, y = y, color = color);

@test typeof(a) == VegaVisualization

#17. Histogram
println("Test 17")
x = rand(Gamma(3.0, 1.0), 100_000)
a = histogram(x = x);

@test typeof(a) == VegaVisualization

#18. Histogram
println("Test 18")
x = rand(Gamma(3.0, 1.0), 100_000)
a = histogram(x = x, relativefreq = true);

@test typeof(a) == VegaVisualization

#19. Joint Plot
println("Test 19")
faithful = dataset("datasets", "faithful")
a = jointplot(x = faithful[:Eruptions], y = faithful[:Waiting]);

@test typeof(a) == VegaVisualization

#20. Line Plot
println("Test 20")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group);

@test typeof(a) == VegaVisualization

#21. Line Plot with Points
println("Test 21")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group, points = true);

@test typeof(a) == VegaVisualization

#22. Line Plot, Bigger Points
println("Test 22")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group, points = true, pointSize = 20);

@test typeof(a) == VegaVisualization

#23. Pie chart
println("Test 23")
fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]
a = piechart(x = fruit, y = bushels);

@test typeof(a) == VegaVisualization

#24. Donut chart
println("Test 24")
fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]
a = piechart(x = fruit, y = bushels, holesize = 175);

@test typeof(a) == VegaVisualization

#25. Population Chart
# println("Test 25")
# df = DataFrame()
# for p in JSON.parse(readstring(joinpath(dirname(@__FILE__), "..", "vega-datasets/population.json")))
#     df = vcat(df, DataFrame(;Dict(Symbol(k)=>v for (k,v) in p)...))
# end
# pop1900 = df[df[:year] .== 1900, :];
# x = pop1900[:people]
# y = pop1900[:age]
# group = pop1900[:sex]
# a = popchart(x = x, y = y, group = group);
#
# @test typeof(a) == VegaVisualization

#26. Rug Plot
println("Test 26")
mtcars = dataset("datasets", "mtcars")
x = mtcars[:Disp]
a = rugplot(x = x);

@test typeof(a) == VegaVisualization

#27. Scatter Plot
println("Test 27")
d1 = MultivariateNormal([0.0, 0.0], [1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0, 10.0], [4.0 0.5; 0.5 4.0])
points = vcat(rand(d1, 500)', rand(d2, 500)')
x = points[:, 1]
y = points[:, 2]
group = vcat(ones(Int, 500), ones(Int, 500) + 1)
a = scatterplot(x = x, y = y, group = group);

@test typeof(a) == VegaVisualization

#28. Stem and Leaf
println("Test 28")
data = [6, 1,3,5, 17, 32, 47, 53, 60, 61, 64, 67, 70, 70, 71, 72, 73, 73, 74, 76, 77,
        79, 81, 82, 83, 83, 83, 83, 84, 85, 86, 87, 87, 88, 89, 90, 91, 91, 92, 94, 94,
        95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 100, 100, 100, 101, 101, 102, 103, 103,
        103, 103, 104, 106, 106, 106, 106, 107, 107, 107, 107, 108, 109, 109, 110, 111,
        111, 111, 112, 112, 113, 114, 114, 114, 115, 116, 117, 117, 119, 120, 120, 120,
        120, 121, 121, 122, 122, 122, 123, 124, 124, 125, 125, 126, 126, 127, 128, 129,
        130, 131, 131, 131, 131, 132, 132, 132, 132, 133, 133, 134, 134, 134, 135, 135,
        135, 136, 136, 136, 137, 138, 139, 140, 140, 142, 143, 144, 145, 145, 145, 145,
        145, 147, 149, 152, 155, 157, 159]
a = stemleaf(y = data);

@test typeof(a) == VegaVisualization

#29. Stream Plot
println("Test 29")
df = readtable(joinpath(dirname(@__FILE__), "..", "vega-datasets/streamdata.csv"))
a = streamplot(x = df[:date], y = df[:value], group = df[:key]);

@test typeof(a) == VegaVisualization

#30. Waterfall
println("Test 30")
categories = ["Product Revenue", "Services Revenue", "Fixed Costs", "Variable Costs", "One-Time Costs"]
value = [420000, 210000, -170000, -140000, -75000]
a = waterfall(x = categories, y = value)

@test typeof(a) == VegaVisualization

#31. Wordcloud
println("Test 31")
corpus = [
"Julia is a high-level, high-performance dynamic programming language for technical computing, with syntax that is familiar to users of other technical computing environments. It provides a sophisticated compiler, distributed parallel execution, numerical accuracy, and an extensive mathematical function library. Julia’s Base library, largely written in Julia itself, also integrates mature, best-of-breed open source C and Fortran libraries for linear algebra, random number generation, signal processing, and string processing. In addition, the Julia developer community is contributing a number of external packages through Julia’s built-in package manager at a rapid pace. IJulia, a collaboration between the IPython and Julia communities, provides a powerful browser-based graphical notebook interface to Julia.",
"Julia programs are organized around multiple dispatch; by defining functions and overloading them for different combinations of argument types, which can also be user-defined. For a more in-depth discussion of the rationale and advantages of Julia over other systems, see the following highlights or read the introduction in the online manual."
]
a = wordcloud(x = corpus);

@test typeof(a) == VegaVisualization

#32. Wordcloud
println("Test 32")
corpus = [
"Julia is a high-level, high-performance dynamic programming language for technical computing, with syntax that is familiar to users of other technical computing environments. It provides a sophisticated compiler, distributed parallel execution, numerical accuracy, and an extensive mathematical function library. Julia’s Base library, largely written in Julia itself, also integrates mature, best-of-breed open source C and Fortran libraries for linear algebra, random number generation, signal processing, and string processing. In addition, the Julia developer community is contributing a number of external packages through Julia’s built-in package manager at a rapid pace. IJulia, a collaboration between the IPython and Julia communities, provides a powerful browser-based graphical notebook interface to Julia.",
"Julia programs are organized around multiple dispatch; by defining functions and overloading them for different combinations of argument types, which can also be user-defined. For a more in-depth discussion of the rationale and advantages of Julia over other systems, see the following highlights or read the introduction in the online manual."
]
a = wordcloud(x = corpus, wordAngles = [0, 90]);

@test typeof(a) == VegaVisualization

#33. Wordcloud
println("Test 33")
corpus = [
"Julia is a high-level, high-performance dynamic programming language for technical computing, with syntax that is familiar to users of other technical computing environments. It provides a sophisticated compiler, distributed parallel execution, numerical accuracy, and an extensive mathematical function library. Julia’s Base library, largely written in Julia itself, also integrates mature, best-of-breed open source C and Fortran libraries for linear algebra, random number generation, signal processing, and string processing. In addition, the Julia developer community is contributing a number of external packages through Julia’s built-in package manager at a rapid pace. IJulia, a collaboration between the IPython and Julia communities, provides a powerful browser-based graphical notebook interface to Julia.",
"Julia programs are organized around multiple dispatch; by defining functions and overloading them for different combinations of argument types, which can also be user-defined. For a more in-depth discussion of the rationale and advantages of Julia over other systems, see the following highlights or read the introduction in the online manual."
]
a = wordcloud(x = corpus, minThreshold = 1);

@test typeof(a) == VegaVisualization

#34. colorscheme!
println("Test 34")
a = barplot(x = collect(1:20), y = rand(20), group = vcat([1 for i in 1:10], [2 for i in 1:10]));
colorscheme!(a, palette = ("Purples", 3));

@test typeof(a) == VegaVisualization

#35. colorscheme!
println("Test 35")
srand(1)
a = barplot(x = collect(1:20), y = rand(20))
colorscheme!(a, palette = "Violet");

@test typeof(a) == VegaVisualization

#36. colorscheme!
# println("Test 36")
# df = DataFrame()
# for p in JSON.parse(readstring(joinpath(dirname(@__FILE__), "..", "vega-datasets/population.json")))
#     df = vcat(df, DataFrame(;Dict(Symbol(k)=>v for (k,v) in p)...))
# end
# pop1900 = df[df[:year] .== 1900, :];
# x = pop1900[:people]
# y = pop1900[:age]
# group = pop1900[:sex]
# a = popchart(x = x, y = y, group = group);
# colorscheme!(a, palette = ["Green", "Red"]);
#
# @test typeof(a) == VegaVisualization

#37. hline!
println("Test 37")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = areaplot(x = x, y = y, group = g, stacked = true);
hline!(a, value = 60.25, strokeDash = 3)

@test typeof(a) == VegaVisualization

#38 hover!
println("Test 38")
score = [59, 24, 98, 60 ,74,70,42,77,88,60,65,71,88,83]
id = ["FIS", "MAR","AO","NP","CS","CP","TR","LIV","ECO","ICO","LSP","CW","HAB","SPP"]
weight = [0.5, 0.5, 1,1,1,1,1,0.5,0.5,0.5,0.5,1,0.5,0.5]
a = asterplot(x = id, y = score, weight = weight, holesize = 75);
hover!(a, opacity = 0.5);

@test typeof(a) == VegaVisualization

#39 jitter!
println("Test 39")
x = rand(1:10, 500)
y = rand(0:10, 500) + x
a = scatterplot(x = x, y = y);
jitter!(a)

@test typeof(a) == VegaVisualization

jitter!(a, pctXrange = 0.1, pctYrange = 0)

@test typeof(a) == VegaVisualization

#40 legend!
println("Test 40")
fruit = ["peaches", "plums", "blueberries", "strawberries", "bananas"]
bushels = [100, 32, 180, 46, 21]
a = piechart(x = fruit, y = bushels);
legend!(a, title = "Fruit")

@test typeof(a) == VegaVisualization

#41 stroke!
println("Test 41")
category = ['A', 'A', 'A', 'A', 'B', 'B', 'B', 'B', 'C', 'C', 'C', 'C']
group = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3]
value = [0.1, 0.6, 0.9, 0.4, 0.7, 0.2, 1.1, 0.8, 0.6, 0.2, 0.1, 0.7]
a = groupedbar(x = category, y = value, group = group);
stroke!(a, width = 1.5)

@test typeof(a) == VegaVisualization

#42 text!
println("Test 42")
x = [95, 86.5, 80.8, 80.4, 80.3, 78.4, 74.2, 73.5, 71, 69.2, 68.6, 65.5, 65.4, 63.4, 64]
y = [95, 102.9, 91.5, 102.5, 86.1, 70.1, 68.5, 83.1, 93.2, 57.6, 20, 126.4, 50.8, 51.8, 82.9]
cont = ["EU", "EU", "EU", "EU", "EU", "EU", "EU", "NO", "EU", "EU", "RU", "US", "EU", "EU", "NZ"]
z = [13.8, 14.7, 15.8, 12, 11.8, 16.6, 14.5, 10, 24.7, 10.4, 16, 35.3, 28.5, 15.4, 31.3]
a = bubblechart(x = x, y = y, group = cont, pointSize = z);

#Annotate graph
text!(a, title = "Safe Sugar Intake 50g/day", x = 525, y = 200)
text!(a, title = "Safe Fat Intake 65g/day", x = 150, y = 10)

@test typeof(a) == VegaVisualization

#43 title!
# println("Test 43")
# df = DataFrame()
# for p in JSON.parse(readstring(joinpath(dirname(@__FILE__), "..", "vega-datasets/population.json")))
#     df = vcat(df, DataFrame(;Dict(Symbol(k)=>v for (k,v) in p)...))
# end
# pop1900 = df[df[:year] .== 1900, :];
# x = pop1900[:people]
# y = pop1900[:age]
# group = pop1900[:sex]
# a = popchart(x = x, y = y, group = group);
# title!(a, title = "Gender & Age Comparison - 1900")
#
# @test typeof(a) == VegaVisualization

#44 xlab!/ylab!
println("Test 44")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group);
xlab!(a, title = "Weight (kg)")
ylab!(a, title = "Height (cm)")

@test typeof(a) == VegaVisualization

#45 xlim!/ylim!
println("Test 45")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group);
xlim!(a, min=0, max=200)
ylim!(a, min=0, max=200)

@test typeof(a) == VegaVisualization

#46 background color
println("Test 46")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]
a = lineplot(x = x, y = y, group = group);
a.background = "green"

@test typeof(a) == VegaVisualization

#47 dotplot
# println("Test 47")
# df = DataFrame()
# for p in JSON.parse(readstring(joinpath(dirname(@__FILE__), "..", "vega-datasets/movies.json")))
#     df = vcat(df, DataFrame(;Dict(Symbol(k)=>v for (k,v) in p)...))
# end
#
# a = dotplot(x = x = df[:US_Gross], y = df[:Major_Genre])
# a.width = 500
# ylab!(a, title = " ", grid = true)
# xlab!(a, title = "Avg. U.S. Gross Movie Receipts", format = ".3s")
#
# @test typeof(a) == VegaVisualization

#48 dotplot
# println("Test 48")
# df = DataFrame()
# for p in JSON.parse(readstring(joinpath(dirname(@__FILE__), "..", "vega-datasets/movies.json")))
#     df = vcat(df, DataFrame(;Dict(Symbol(k)=>v for (k,v) in p)...))
# end
#
# a = dotplot(x = x = df[:US_Gross], y = df[:Major_Genre], sorted = false)
# @test typeof(a) == VegaVisualization

#49 lineplot with log yaxis
println("Test 49")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

a = lineplot(x = x, y = y, group = group)
ylim!(a, _type = "log")
@test typeof(a) == VegaVisualization

#50 lineplot with pow yaxis
println("Test 50")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

a = lineplot(x = x, y = y, group = group)
ylim!(a, _type = "pow")
@test typeof(a) == VegaVisualization

#51 lineplot with sqrt yaxis
println("Test 51")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

a = lineplot(x = x, y = y, group = group)
ylim!(a, _type = "sqrt")
@test typeof(a) == VegaVisualization

#52 reverse keyword for colorscheme!
println("Test 52")
x = [1:100; 1:100]
y = [collect(1:100) + randn(100); 3.0 + 1.5 * collect(1:100) + randn(100)]
group = [[1 for i in 1:100]; [2 for i in 1:100]]

a = lineplot(x = x, y = y, group = group)
colorscheme!(a, palette = ("wesanderson", "BottleRocket1"), reversePalette = true)
@test typeof(a) == VegaVisualization

#53 color keyword for hover!
println("Test 53")
x = [1, 2, 3, 4, 5]
y = [1, 2, 3, 2, 1]

a = barplot(x = x, y = y)
hover!(a, color = "red")
@test typeof(a) == VegaVisualization

#54. Ribbon plot
println("Test 54")
x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
a = ribbonplot(x = x, ylow = 0.9y, yhigh=1.1y, group = g);

@test typeof(a) == VegaVisualization

#55. Horizon plot
x = 1:20
y = [28, 55, 43, 91, 81, 53, 19, 87, 52, 48, 24, 49, 87, 66, 17, 27, 68, 16, 49, 15]
a = horizon(x = x, y = y)
colorscheme!(a, palette = "green")

@test typeof(a) == VegaVisualization
