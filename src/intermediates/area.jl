function add_area!(v::VegaVisualization)
    res = VegaMark(_type = "area",
                   from = VegaMarkFrom(data="table"),
                   properties = VegaMarkProperties(enter = default_props()))

    if v.marks == nothing
        v.marks = [res]
    else
        push!(v.marks, res)
    end

    return v
end

# for fun in (:area,    :rect, :symbol, :path, :arc,  :rule, :image, :text, :group)
#          fname = symbol("add_$(fun)mark!")
#          @eval begin
#          	function ($fname)(v::VegaVisualization)

#          		res = VegaMark(_type = $fun,
# 			                   from = VegaMarkFrom(data="table"),
# 			                   properties = VegaMarkProperties(enter = default_props()))

# 			    if v.marks == nothing
# 			        v.marks = [res]
# 			    else
# 			        push!(v.marks, res)
# 			    end

# 			    return v
#          	end
#          end
# end