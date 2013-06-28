type VegaPadding
	top::Int
	left::Int
	bottom::Int
	right::Int
end

function VegaPadding(;top::Int = 80,
	                  left::Int = 80,
	                  bottom::Int = 80,
	                  right::Int = 80)
	VegaPadding(top, left, bottom, right)
end

function Base.copy(x::VegaPadding)
	VegaPadding(x.top, x.left, x.bottom, x.right)
end

function tojs(x::VegaPadding)
	res = Dict()
	res["top"] = x.top
	res["left"] = x.left
	res["bottom"] = x.bottom
	res["right"] = x.right
	return res
end
