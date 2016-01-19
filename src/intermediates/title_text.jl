function title!(v::VegaVisualization;
                        title::AbstractString = "", y::Int = -40, fill::AbstractString = "black", fontSize::Int = 16,
                        align::AbstractString = "center", baseline::AbstractString = "top", fontWeight::AbstractString = "bold",
                        font::AbstractString = "", x::Int = 0)

	titlemark = VegaMark(_type = "text",
                       from = VegaMarkFrom(value = title),
                       properties = VegaMarkProperties(enter = VegaMarkPropertySet(x = VegaValueRef(value = (x == 0 ? (v.width / 2) : x)),
                                                                                   y = VegaValueRef(value = y),
                                                                                   text = VegaValueRef(value = title),
                                                                                   fill = VegaValueRef(value = fill),
                                                                                   fontSize = VegaValueRef(value = fontSize),
                                                                                   align = VegaValueRef(value = align),
                                                                                   baseline = VegaValueRef(value = baseline),
                                                                                   fontWeight = VegaValueRef(value = fontWeight),
                                                                                   font = VegaValueRef(value = font)
                                                                                  )
))


	push!(v.marks, titlemark)

	return v
end

#Same function as title, just with different name and defaults for a different conceptual feel
text!(v::VegaVisualization; title::AbstractString = "", y::Int = 50, fill::AbstractString = "black", fontSize::Int = 12,
      align::AbstractString = "center", baseline::AbstractString = "top", fontWeight::AbstractString = "",
      font::AbstractString = "", x::Int = 50) =

      title!(v, title = title, y = y, fill = fill, fontSize = fontSize, align = align, baseline = baseline, fontWeight = fontWeight, font = font, x = x)