function add_data!(v::VegaVisualization;
                              name::AbstractString = string("table_", lowercase(randstring(5))),
                              x::AbstractVector = Int[],
                              x2::AbstractVector = Int[],
                              y::AbstractVector = Int[],
                              y2::AbstractVector = Int[],
                              group::AbstractVector = Int[])

    #Check arrays all of same length
    n = length(x)

    if n != length(y) || (n != length(group) && length(group) != 0)
        error("x, y and group must all have the same length")
    end

    #Create empty arrays as necessary
    res = Array{Dict{Any, Any}}(n)
    isempty(group)? group = ones(Int, n): group
    isempty(y2)? y2 = zeros(Int, n): y2
    isempty(x2)? x2 = zeros(Int, n): x2

    #Concatenate arrays into Dicts
    for i in 1:n
        res[i] = Dict{Any, Any}()
        res[i]["x"] = x[i]
        res[i]["x2"] = x2[i]
        res[i]["y"] = y[i]
        res[i]["group"] = group[i]
        res[i]["y2"] = y2[i]
    end

    #Set VegaData with values, create/add to VegaVisualization
    d = VegaData(name = name, values = res)
    v.data == nothing? v.data = [d]: push!(v.data, d)

    return v
end
