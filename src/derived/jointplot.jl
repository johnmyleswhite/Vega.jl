function jointplot(; x::AbstractVector = Int[], y::AbstractVector = Int[], smoothing::Int = 4)

    @assert sum(Missings.ismissing.(x)) == 0 "x has missing data"
    @assert sum(Missings.ismissing.(y)) == 0 "y has missing data"

    #Calculate kde
    a = kde((collect(skipmissing(x)),collect(skipmissing(y))))

    #Parse data from grid to 1D array
    x_mod = []
    y_mod = []
    d_mod = []

    for _x in enumerate(a.x)
        for _y in enumerate(a.y)
            push!(x_mod, _x[2])
            push!(y_mod, _y[2])
            push!(d_mod, a.density[_x[1], _y[1]])
        end
    end

    min_d = minimum(d_mod)
    max_d = maximum(d_mod)
    intervals = (max_d - min_d)/10
    center =  (max_d - min_d)/2

    #Plot
    a = heatmap(x = x_mod, y = y_mod, color = d_mod)
    a.width = a.height = 500
    a.scales[1]._type = a.scales[2]._type = "linear"
    a.marks[1].properties.enter.width = a.marks[1].properties.enter.height = VegaValueRef(value = smoothing)

    a.scales[2].zero = false

    a.scales[1].nice = a.scales[2].nice = true
    a.scales[3].domain =  collect(min_d:intervals:max_d)
    a.legends[1].values = [min_d, center, max_d]

    return a

end
