function histogram(; x::AbstractArray = Int[],
					relativefreq::Bool = false,
					horizontal::Bool = false)

	a, b = hist(x)
	total = relativefreq == false? 1 : sum(b)

    v = barplot(x = a[2:end], y = b/total)

    if horizontal
        coord_flip!(v)
    end


	return v
end