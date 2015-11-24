#Scales
#xlim!/ylim!
for fun in [:x, :y]

    fname = symbol("$(fun)lim!")

    @eval begin function ($fname)(v::VegaVisualization; min::Real = 0, max::Real = 1000, reverse::Bool = false, round::Bool = false)

                    if min > max
                        error("Min must be less than Max")
                    end

                    s = v.scales[findfirst([z.name == $"$fun" for z in v.scales])]
                    s.domainMin = min == 0? s.domainMin : min
                    s.domainMax = max == 1000? s.domainMax : max
                    s.reverse = reverse
                    s.round = round
                    min != 0? s.zero = false : s.zero = true
                    return v
                end
          end
end