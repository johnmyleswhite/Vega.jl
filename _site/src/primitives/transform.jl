# TODO: Fill me in
type VegaTransform
	x::Dict{Any, Any}
end

tojs(x::VegaTransform) = x.x

Base.copy(x::VegaTransform) = VegaTransform()
