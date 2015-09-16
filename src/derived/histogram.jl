function histogram(; x::AbstractVector = Int[],
					relativefreq::Bool = false,
					horizontal::Bool = false)

	a, b = hist(x)
	total = relativefreq == false? 1 : sum(b)

    v = barplot(x = a[2:end], y = b/total)

    #Remove space between bars per theory
    v.marks[1].properties.enter.width.offset = 0

    if horizontal
        coord_flip!(v)
        v.marks[1].properties.enter.height.offset = 0
    end

    #Default to Paired color scale, 12
    colorscheme!(v, ("Paired", 12))
    return v

end