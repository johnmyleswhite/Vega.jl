function histogram(; x::AbstractArray = Int[], relativefreq::Bool = false)

	a, b = hist(x)
	total = relativefreq == false? 1 : sum(b)

    v = plot(x = a[2:end], y = b/total, kind = :bar)

	return v
end