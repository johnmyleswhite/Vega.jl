function add_data!(v::VegaVisualization;
	                          x::AbstractVector = Int[],
	                          y::AbstractVector = Int[],
                              y2::AbstractVector = Int[],
	                          group::AbstractVector = Int[])
    n = length(x)

    if n != length(y) || (n != length(group) && length(group) != 0)
    	error("x, y and group must all have the same length")
    end

    res = Array(Dict{Any, Any}, n)

    if isempty(group)
        group = ones(Int, n)
    end

    if isempty(y2)
        y2 = zeros(Int, n)
    end

    for i in 1:n
        res[i] = Dict{Any, Any}()
        res[i]["x"] = x[i]
        res[i]["y"] = y[i]
        res[i]["group"] = group[i]
        res[i]["y2"] = y2[i]
    end

    d = VegaData(values = res)

    if v.data == nothing
		v.data = [d]
    else
		push!(v.data, d)
	end

    return v
end