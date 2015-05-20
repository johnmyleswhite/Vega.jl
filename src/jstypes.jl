#tojs functions
tojs(s::Symbol) = string(s)
tojs(v::Vector) = [tojs(v_i) for v_i in v]

function tojs(v::Dict)
    res = Dict()
    for (k, v) in v
        res[k] = tojs(v)
    end
    return res
end
tojs(x::Any) = x

#validation functions
function isvalidentry(entry::Tuple)
    if length(entry) != 4
        return false
    else
        return isa(entry[1], Symbol) &&
               isa(entry[2], Type) &&
               isa(entry[3], entry[2]) &&
               isa(entry[4], Bool)
    end
end

# function isvalidspec(spec)
#     for entry in spec
#         if !isvalidentry(entry)
#             return false
#         end
#     end
#     return true
# end

#Build types from spects
function fielddef(entry::Tuple)
    if entry[4]
        return Expr(:(::), entry[1], Union(entry[2], Nothing))
    else
        return Expr(:(::), entry[1], entry[2])
    end
end

function maketype(typename::Symbol, spec)
    n = length(spec)
    lines = Array(Expr, n)
    for i in 1:n
        entry = spec[i]
        lines[i] = fielddef(entry)
    end
    return Expr(:type, true, typename, Expr(:block, lines...))
end

# Build up a constructor that takes in all fields for a type
# as keyword args using defaults
function makekwfunc(typename::Symbol, spec)
    return Expr(:function,
                Expr(:call, typename,
                     Expr(:parameters,
                          map(entry -> Expr(:kw, fielddef(entry), entry[3]),
                              spec)...)),
                Expr(:block,
                     Expr(:call, typename, map(entry -> entry[1], spec)...)))
end


function makehash(fieldname::Symbol)
    if fieldname == :_type
        return Expr(:(=),
                    Expr(:ref, :res, "type"),
                    Expr(:call, :tojs, Expr(:., :x, Expr(:quote, fieldname))))
    else
        return Expr(:(=),
                    Expr(:ref, :res, string(fieldname)),
                    Expr(:call, :tojs, Expr(:., :x, Expr(:quote, fieldname))))
    end
end

# Define translation of type to JSON-ready data structure
function makejsline(entry::Tuple)
    fieldname = entry[1]
    if entry[4]
        return Expr(:if,
                    Expr(:comparison,
                        Expr(:., :x, Expr(:quote, fieldname)),
                        :!=,
                        :nothing),
                    Expr(:block, makehash(fieldname)))

    else
        return makehash(fieldname)
    end
end

#COnvert to js functions
function makejsbody(spec)
    return Expr(:block,
                :(res = Dict()),
                map(makejsline, spec)...,
                :(return res))
end

function maketojs(typename::Symbol, spec)
    return Expr(:function,
                Expr(:call,
                     :tojs,
                     Expr(:(::), :x, typename)),
                     makejsbody(spec))
end

#Copy functions
function makecopyline(entry::Tuple)
    return Expr(:call, :copy, Expr(:., :x, Expr(:quote, entry[1])))
end

function makecopybody(typename::Symbol, spec)
    return Expr(:block,
                Expr(:call,
                     typename,
                     map(makecopyline, spec)...))
end

function makecopy(typename::Symbol, spec)
    return Expr(:function,
                Expr(:call,
                     Expr(:., :Base, Expr(:quote, :copy)),
                     Expr(:(::), :x, typename)),
                makecopybody(typename, spec))
end

#Create primitives from one function instead of repeating
function primitivefactory(create::Symbol, spec::AbstractArray)
    eval(maketype(create, spec))
    eval(makekwfunc(create, spec))
    eval(maketojs(create, spec))
    eval(makecopy(create, spec))
end

Base.copy(x::Nothing) = nothing

# TODO: Move this elsewhere
function makevalues(x::Vector, y::Vector, group::Vector)
    n = length(x)
    res = Array(Dict{Any, Any}, n)
    if isempty(group)
        group = ones(Int, n)
    end
    for i in 1:n
        res[i] = Dict{Any, Any}()
        res[i]["x"] = x[i]
        res[i]["y"] = y[i]
        res[i]["group"] = group[i]
    end
    return res
end

tojson(x::Any) = JSON.json(tojs(x))