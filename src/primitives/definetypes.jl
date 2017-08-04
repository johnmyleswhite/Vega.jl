abstract type AbstractVegaType end

# TODO: Fill me in
@with_kw type VegaTransform
	x::Dict{Any, Any} = Dict()
end

tojs(x::VegaTransform) = x.x

Base.copy(x::VegaTransform) = VegaTransform()

@with_kw type VegaStream <: AbstractVegaType
    _type::Union{AbstractString,Void} = nothing
    expr::Union{AbstractString,Void} = nothing
    scale::Union{AbstractString,Void} = nothing
end

@with_kw type VegaDataRef <: AbstractVegaType
    data::Union{AbstractString,Void} = nothing
    field::Union{AbstractString,AbstractVector,Dict{Any,Any},Void} = nothing
    fields::Union{AbstractString,AbstractVector,Dict{Any,Any},Void} = nothing
    sort::Union{Bool,Dict{Any,Any},Void} = nothing
end

@with_kw type VegaValueRef <: AbstractVegaType
    value::Any = nothing
    field::Union{AbstractString,Dict{Any,Any},Void} = nothing
    group::Union{AbstractString,Bool,Void} = nothing
    scale::Union{AbstractString,Dict{Any,Any},Void} = nothing
    mult::Union{Number,Void} = nothing
    offset::Union{Number,Void} = nothing
    band::Union{Bool,Void} = nothing
    signal::Union{AbstractString,Void} = nothing
end

@with_kw type VegaPadding <: AbstractVegaType
    top::Union{Number,Void} = 80
    left::Union{Number,Void} = 80
    bottom::Union{Number,Void} = 80
    right::Union{Number,Void} = 80
end

@with_kw type VegaMarkPropertySet <: AbstractVegaType
    x::Union{VegaValueRef,Void} = nothing
    x2::Union{VegaValueRef,Void} = nothing
    xc::Union{VegaValueRef,Void} = nothing
    width::Union{VegaValueRef,Void} = nothing
    y::Union{VegaValueRef,Void} = nothing
    y2::Union{VegaValueRef,Void} = nothing
    yc::Union{VegaValueRef,Void} = nothing
    height::Union{VegaValueRef,Void} = nothing
    opacity::Union{VegaValueRef,Void} = nothing
    fill::Union{VegaValueRef,Void} = nothing
    fillOpacity::Union{VegaValueRef,Void} = nothing
    stroke::Union{VegaValueRef,Void} = nothing
    strokeWidth::Union{VegaValueRef,Void} = nothing
    strokeOpacity::Union{VegaValueRef,Void} = nothing
    strokeDash::Union{VegaValueRef,Void} = nothing
    strokeDashOffset::Union{VegaValueRef,Void} = nothing
    cursor::Union{VegaValueRef,Void} = nothing
    clip::Union{VegaValueRef,Void} = nothing
    size::Union{VegaValueRef,Void} = nothing
    shape::Union{VegaValueRef,Void} = nothing
    path::Union{VegaValueRef,Void} = nothing
    innerRadius::Union{VegaValueRef,Void} = nothing
    outerRadius::Union{VegaValueRef,Void} = nothing
    startAngle::Union{VegaValueRef,Void} = nothing
    endAngle::Union{VegaValueRef,Void} = nothing
    interpolate::Union{VegaValueRef,Void} = nothing
    tension::Union{VegaValueRef,Void} = nothing
    orient::Union{VegaValueRef,Void} = nothing
    url::Union{VegaValueRef,Void} = nothing
    align::Union{VegaValueRef,Void} = nothing
    baseline::Union{VegaValueRef,Void} = nothing
    text::Union{VegaValueRef,Void} = nothing
    dx::Union{VegaValueRef,Void} = nothing
    dy::Union{VegaValueRef,Void} = nothing
    radius::Union{VegaValueRef,Void} = nothing
    theta::Union{VegaValueRef,Void} = nothing
    angle::Union{VegaValueRef,Void} = nothing
    font::Union{VegaValueRef,Void} = nothing
    fontSize::Union{VegaValueRef,Void} = nothing
    fontWeight::Union{VegaValueRef,Void} = nothing
    fontStyle::Union{VegaValueRef,Void} = nothing
end

@with_kw type VegaAxis <: AbstractVegaType
    _type::Union{AbstractString,Void} = "x"
    scale::Union{AbstractString,Void} = "x"
    orient::Union{AbstractString,Void} = nothing
    title::Union{AbstractString,Void} = nothing
    titleOffset::Union{Number,Void} = nothing
    format::Union{AbstractString,Void} = nothing
    formatType::Union{AbstractString,Void} = nothing
    ticks::Union{Number,Void} = nothing
    values::Union{AbstractVector,Void} = nothing
    subdivide::Union{Number,Void} = nothing
    tickPadding::Union{Number,Void} = nothing
    tickSize::Union{Number,Void} = nothing
    tickSizeMajor::Union{Number,Void} = nothing
    tickSizeMinor::Union{Number,Void} = nothing
    tickSizeEnd::Union{Number,Void} = nothing
    offset::Union{Dict{Any,Any},Number,Void} = nothing
    layer::Union{AbstractString,Void} = "front"
    grid::Union{Bool,Void} = false
    properties::Union{Dict{Any,Any},VegaMarkPropertySet,Void} = nothing
end

@with_kw type VegaFormat <: AbstractVegaType
    _type::Union{AbstractString,Void} = nothing
    parse::Union{Dict{Any,Any},Void} = nothing
    property::Union{AbstractString,Void} = nothing
    feature::Union{AbstractString,Void} = nothing
    mesh::Union{AbstractString,Void} = nothing
    children::Union{Dict{Any,Any},Void} = nothing
end

@with_kw type VegaData <: AbstractVegaType
    name::Union{AbstractString,Void} = "table"
    format::Union{VegaFormat,Void} = nothing
    values::Union{AbstractVector,Void} = nothing
    source::Union{AbstractString,Void} = nothing
    url::Union{AbstractString,Void} = nothing
    transform::Union{Array{VegaTransform,1},Void} = nothing
    modify::Union{Array{VegaStream,1},Void} = nothing
end

@with_kw type VegaMarkProperties <: AbstractVegaType
    enter::Union{VegaMarkPropertySet,Void} = nothing
    exit::Union{VegaMarkPropertySet,Void} = nothing
    update::Union{VegaMarkPropertySet,Void} = nothing
    hover::Union{VegaMarkPropertySet,Void} = nothing
end

@with_kw type VegaMarkFrom <: AbstractVegaType
    data::Union{AbstractString,Void} = nothing
    mark::Union{AbstractString,Void} = nothing
    transform::Union{Array{VegaTransform,1},Void} = nothing
    value::Union{AbstractString,Void} = nothing
end

@with_kw type VegaSignal <: AbstractVegaType
    name::Union{AbstractString,Void} = nothing
    init::Any = nothing
    verbose::Union{Bool,Void} = false
    expr::Union{AbstractString,Void} = nothing
    scale::Any = nothing
    streams::Any = nothing
end

@with_kw type VegaScale <: AbstractVegaType
    name::Union{AbstractString,Void} = "x"
    _type::Union{AbstractString,Void} = "linear"
    domain::Union{AbstractVector,VegaDataRef,Void} = nothing
    domainMin::Union{Number,VegaDataRef,VegaSignal,Void} = nothing
    domainMax::Union{Number,VegaDataRef,VegaSignal,Void} = nothing
    range::Union{AbstractString,AbstractVector,VegaDataRef,Void} = nothing
    rangeMin::Union{Number,VegaDataRef,VegaSignal,Void} = nothing
    rangeMax::Union{Number,VegaDataRef,VegaSignal,Void} = nothing
    reverse::Union{Bool,VegaDataRef,Void} = nothing
    round::Union{Bool,Void} = nothing
    points::Union{Bool,Void} = nothing
    padding::Union{Number,Void} = nothing
    outerPadding::Union{Number,Void} = nothing
    bandWidth::Union{Number,VegaSignal,Void} = nothing
    sort::Union{Bool,Dict{Any,Any},Void} = nothing
    clamp::Union{Bool,Void} = nothing
    nice::Union{AbstractString,Bool,Void} = nothing
    exponent::Union{Number,Void} = nothing
    zero::Union{Bool,Void} = nothing
end

@with_kw type VegaMark <: AbstractVegaType
    name::Union{AbstractString,Void} = nothing
    key::Union{AbstractString,Void} = nothing
    _type::Union{AbstractString,Void} = "symbol"
    from::Union{VegaMarkFrom,Void} = nothing
    properties::Union{VegaMarkProperties,Void} = nothing
    delay::Union{VegaValueRef,Void} = nothing
    ease::Union{AbstractString,Void} = nothing
    marks::Union{AbstractVector,Void} = nothing
    scales::Union{Array{VegaScale,1},Void} = nothing
    axes::Union{Array{VegaAxis,1},Void} = nothing
    interactive::Union{Bool,Void} = nothing
end

@with_kw type VegaLegend <: AbstractVegaType
    size::Union{AbstractString,Void} = nothing
    shape::Union{AbstractString,Void} = nothing
    fill::Union{AbstractString,Void} = nothing
    stroke::Union{AbstractString,Void} = nothing
    orient::Union{AbstractString,Void} = nothing
    offset::Union{Number,Void} = nothing
    title::Union{AbstractString,Void} = nothing
    format::Union{AbstractString,Void} = nothing
    formatType::Union{AbstractString,Void} = nothing
    values::Union{AbstractVector,Void} = nothing
    properties::Union{Dict{Any,Any},VegaMarkPropertySet,Void} = nothing
end

@with_kw type VegaScene <: AbstractVegaType
    fill::Any = nothing
    fillOpacity::Any = nothing
    stroke::Any = nothing
    strokeOpacity::Any = nothing
    strokeWidth::Any = nothing
    strokeDash::Any = nothing
    strokeDashOffset::Any = nothing
end

@with_kw type VegaContainer <: AbstractVegaType
    scene::Union{Array{VegaScene,1},Void} = nothing
    scales::Union{Array{VegaScale,1},Void} = nothing
    axes::Union{Array{VegaAxis,1},Void} = nothing
    legends::Union{Array{VegaLegend,1},Void} = nothing
    marks::Union{Array{VegaMark,1},Void} = nothing
end

@with_kw type VegaPredicate <: AbstractVegaType
    name::Union{AbstractString,Void} = nothing
    _type::Union{AbstractString,Void} = nothing
    operands::Union{AbstractVector,Void} = nothing
    range::Union{AbstractVector,Void} = nothing
    scale::Union{AbstractVector,Void} = nothing
    item::Any = nothing
end

@with_kw type VegaVisualization <: AbstractVegaType
    name::Union{AbstractString,Void} = "Vega Visualization"
    width::Union{Int64,Void} = 450
    height::Union{Int64,Void} = 450
    padding::Union{AbstractString,Number,VegaPadding,Void} = "auto"
    viewport::Union{Array{Int64,1},Void} = nothing
    background::Union{AbstractString,Void} = nothing
    data::Union{Array{VegaData,1},Void} = nothing
    scales::Union{Array{VegaScale,1},Void} = nothing
    axes::Union{Array{VegaAxis,1},Void} = nothing
    marks::Union{Array{VegaMark,1},Void} = nothing
    legends::Union{Array{VegaLegend,1},Void} = nothing
    signals::Union{Array{Dict{Any,Any},1},Void} = nothing
    predicates::Union{Array{Dict{Any,Any},1},Void} = nothing
    modify::Union{Array{Dict{Any,Any},1},Void} = nothing
end
