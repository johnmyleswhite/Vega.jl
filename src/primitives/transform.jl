# TODO: Fill me in
type VegaTransform
end

tojs(x::VegaTransform) = Dict{Any, Any}()

Base.copy(x::VegaTransform) = VegaTransform()
