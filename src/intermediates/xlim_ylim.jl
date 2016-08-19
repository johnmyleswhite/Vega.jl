#Scales
#xlim!/ylim!
for fun in [:x, :y]

    fname = Symbol("$(fun)lim!")

    @eval begin function ($fname)(v::VegaVisualization; min::Real = 0, max::Real = 1000, reverse::Bool = false, round::Bool = false, _type::AbstractString = "", exponent::Real = 0.3)

                    if min > max
                        error("Min must be less than Max")
                    end

                    s = v.scales[findfirst([z.name == $"$fun" for z in v.scales])]
                    s.domainMin = min == 0? s.domainMin : min
                    s.domainMax = max == 1000? s.domainMax : max
                    s.reverse = reverse
                    s.round = round
                    min != 0? s.zero = false : s.zero = true

                    #Allow for changing scale type; if type == pow, also need to set exponent. Defaulting to 0.3 instead of d3 value of 1, since 1 returns identity
                    #Returning identity is safer, but also makes user believe function is broken
                    _type != ""? s._type = _type: nothing
                    _type == "pow"? s.exponent = exponent: nothing
                    return v
                end
          end
end
