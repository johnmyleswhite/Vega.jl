abstract AbstractVegaType

function Base.call{T<:AbstractVegaType}(::Type{T}; kwargs...)
    out = T()
    for (sym, val) in kwargs
        setfield!(out, sym, val)
    end
    out
end

# TODO: Fill me in
type VegaTransform
	x::Dict{Any, Any}
end

tojs(x::VegaTransform) = x.x

Base.copy(x::VegaTransform) = VegaTransform()

type VegaStream <: AbstractVegaType
    _type::Union{AbstractString,Void}
    expr::Union{AbstractString,Void}
    scale::Union{AbstractString,Void}
end

type VegaDataRef <: AbstractVegaType
    data::Union{AbstractString,Void}
    field::Union{AbstractString,AbstractVector,Dict{Any,Any},Void}
    fields::Union{AbstractString,AbstractVector,Dict{Any,Any},Void}
    sort::Union{Bool,Dict{Any,Any},Void}
end

type VegaValueRef <: AbstractVegaType
    value::Any
    field::Union{AbstractString,Dict{Any,Any},Void}
    group::Union{AbstractString,Bool,Void}
    scale::Union{AbstractString,Dict{Any,Any},Void}
    mult::Union{Number,Void}
    offset::Union{Number,Void}
    band::Union{Bool,Void}
    signal::Union{AbstractString,Void}
end

type VegaPadding <: AbstractVegaType
    top::Union{Number,Void}
    left::Union{Number,Void}
    bottom::Union{Number,Void}
    right::Union{Number,Void}
end

type VegaMarkPropertySet <: AbstractVegaType
    x::Union{VegaValueRef,Void}
    x2::Union{VegaValueRef,Void}
    xc::Union{VegaValueRef,Void}
    width::Union{VegaValueRef,Void}
    y::Union{VegaValueRef,Void}
    y2::Union{VegaValueRef,Void}
    yc::Union{VegaValueRef,Void}
    height::Union{VegaValueRef,Void}
    opacity::Union{VegaValueRef,Void}
    fill::Union{VegaValueRef,Void}
    fillOpacity::Union{VegaValueRef,Void}
    stroke::Union{VegaValueRef,Void}
    strokeWidth::Union{VegaValueRef,Void}
    strokeOpacity::Union{VegaValueRef,Void}
    strokeDash::Union{VegaValueRef,Void}
    strokeDashOffset::Union{VegaValueRef,Void}
    cursor::Union{VegaValueRef,Void}
    clip::Union{VegaValueRef,Void}
    size::Union{VegaValueRef,Void}
    shape::Union{VegaValueRef,Void}
    path::Union{VegaValueRef,Void}
    innerRadius::Union{VegaValueRef,Void}
    outerRadius::Union{VegaValueRef,Void}
    startAngle::Union{VegaValueRef,Void}
    endAngle::Union{VegaValueRef,Void}
    interpolate::Union{VegaValueRef,Void}
    tension::Union{VegaValueRef,Void}
    orient::Union{VegaValueRef,Void}
    url::Union{VegaValueRef,Void}
    align::Union{VegaValueRef,Void}
    baseline::Union{VegaValueRef,Void}
    text::Union{VegaValueRef,Void}
    dx::Union{VegaValueRef,Void}
    dy::Union{VegaValueRef,Void}
    radius::Union{VegaValueRef,Void}
    theta::Union{VegaValueRef,Void}
    angle::Union{VegaValueRef,Void}
    font::Union{VegaValueRef,Void}
    fontSize::Union{VegaValueRef,Void}
    fontWeight::Union{VegaValueRef,Void}
    fontStyle::Union{VegaValueRef,Void}
end

type VegaAxis <: AbstractVegaType
    _type::Union{AbstractString,Void}
    scale::Union{AbstractString,Void}
    orient::Union{AbstractString,Void}
    title::Union{AbstractString,Void}
    titleOffset::Union{Number,Void}
    format::Union{AbstractString,Void}
    formatType::Union{AbstractString,Void}
    ticks::Union{Number,Void}
    values::Union{AbstractVector,Void}
    subdivide::Union{Number,Void}
    tickPadding::Union{Number,Void}
    tickSize::Union{Number,Void}
    tickSizeMajor::Union{Number,Void}
    tickSizeMinor::Union{Number,Void}
    tickSizeEnd::Union{Number,Void}
    offset::Union{Dict{Any,Any},Number,Void}
    layer::Union{AbstractString,Void}
    grid::Union{Bool,Void}
    properties::Union{Dict{Any,Any},VegaMarkPropertySet,Void}
end

type VegaFormat <: AbstractVegaType
    _type::Union{AbstractString,Void}
    parse::Union{Dict{Any,Any},Void}
    property::Union{AbstractString,Void}
    feature::Union{AbstractString,Void}
    mesh::Union{AbstractString,Void}
    children::Union{Dict{Any,Any},Void}
end

type VegaData <: AbstractVegaType
    name::Union{AbstractString,Void}
    format::Union{VegaFormat,Void}
    values::Union{AbstractVector,Void}
    source::Union{AbstractString,Void}
    url::Union{AbstractString,Void}
    transform::Union{Array{VegaTransform,1},Void}
    modify::Union{Array{VegaStream,1},Void}
end

type VegaMarkProperties <: AbstractVegaType
    enter::Union{VegaMarkPropertySet,Void}
    exit::Union{VegaMarkPropertySet,Void}
    update::Union{VegaMarkPropertySet,Void}
    hover::Union{VegaMarkPropertySet,Void}
end

type VegaMarkFrom <: AbstractVegaType
    data::Union{AbstractString,Void}
    mark::Union{AbstractString,Void}
    transform::Union{Array{VegaTransform,1},Void}
    value::Union{AbstractString,Void}
end

type VegaSignal <: AbstractVegaType
    name::Union{AbstractString,Void}
    init::Any
    verbose::Union{Bool,Void}
    expr::Union{AbstractString,Void}
    scale::Any
    streams::Any
end

type VegaScale <: AbstractVegaType
    name::Union{AbstractString,Void}
    _type::Union{AbstractString,Void}
    domain::Union{AbstractVector,VegaDataRef,Void}
    domainMin::Union{Number,VegaDataRef,VegaSignal,Void}
    domainMax::Union{Number,VegaDataRef,VegaSignal,Void}
    range::Union{AbstractString,AbstractVector,VegaDataRef,Void}
    rangeMin::Union{Number,VegaDataRef,VegaSignal,Void}
    rangeMax::Union{Number,VegaDataRef,VegaSignal,Void}
    reverse::Union{Bool,VegaDataRef,Void}
    round::Union{Bool,Void}
    points::Union{Bool,Void}
    padding::Union{Number,Void}
    outerPadding::Union{Number,Void}
    bandWidth::Union{Number,VegaSignal,Void}
    sort::Union{Bool,Dict{Any,Any},Void}
    clamp::Union{Bool,Void}
    nice::Union{AbstractString,Bool,Void}
    exponent::Union{Number,Void}
    zero::Union{Bool,Void}
end

type VegaMark <: AbstractVegaType
    name::Union{AbstractString,Void}
    key::Union{AbstractString,Void}
    _type::Union{AbstractString,Void}
    from::Union{VegaMarkFrom,Void}
    properties::Union{VegaMarkProperties,Void}
    delay::Union{VegaValueRef,Void}
    ease::Union{AbstractString,Void}
    marks::Union{AbstractVector,Void}
    scales::Union{Array{VegaScale,1},Void}
    axes::Union{Array{VegaAxis,1},Void}
    interactive::Union{Bool,Void}
end

type VegaLegend <: AbstractVegaType
    size::Union{AbstractString,Void}
    shape::Union{AbstractString,Void}
    fill::Union{AbstractString,Void}
    stroke::Union{AbstractString,Void}
    orient::Union{AbstractString,Void}
    offset::Union{Number,Void}
    title::Union{AbstractString,Void}
    format::Union{AbstractString,Void}
    formatType::Union{AbstractString,Void}
    values::Union{AbstractVector,Void}
    properties::Union{Dict{Any,Any},VegaMarkPropertySet,Void}
end

type VegaScene <: AbstractVegaType
    fill::Any
    fillOpacity::Any
    stroke::Any
    strokeOpacity::Any
    strokeWidth::Any
    strokeDash::Any
    strokeDashOffset::Any
end

type VegaContainer <: AbstractVegaType
    scene::Union{Array{VegaScene,1},Void}
    scales::Union{Array{VegaScale,1},Void}
    axes::Union{Array{VegaAxis,1},Void}
    legends::Union{Array{VegaLegend,1},Void}
    marks::Union{Array{VegaMark,1},Void}
end

type VegaPredicate <: AbstractVegaType
    name::Union{AbstractString,Void}
    _type::Union{AbstractString,Void}
    operands::Union{AbstractVector,Void}
    range::Union{AbstractVector,Void}
    scale::Union{AbstractVector,Void}
    item::Any
end

type VegaVisualization <: AbstractVegaType
    name::Union{AbstractString,Void}
    width::Union{Int64,Void}
    height::Union{Int64,Void}
    padding::Union{AbstractString,Number,VegaPadding,Void}
    viewport::Union{Array{Int64,1},Void}
    background::Union{AbstractString,Void}
    data::Union{Array{VegaData,1},Void}
    scales::Union{Array{VegaScale,1},Void}
    axes::Union{Array{VegaAxis,1},Void}
    marks::Union{Array{VegaMark,1},Void}
    legends::Union{Array{VegaLegend,1},Void}
    signals::Union{Array{Dict{Any,Any},1},Void}
    predicates::Union{Array{Dict{Any,Any},1},Void}
    modify::Union{Array{Dict{Any,Any},1},Void}
end
