function ribbonplot(;x::AbstractVector = Int[],
                     ylow::AbstractVector = Int[],
                     yhigh::AbstractVector = Int[],
                     group::AbstractVector = Int[])

  v = barplot(x = x, y = yhigh, y2 = ylow, group = group)

  tablename = v.data[1].name

  innermark = VegaMark()
  innermark._type = "area"
  innermark.properties = VegaMarkProperties()
  innermark.properties.enter = VegaMarkPropertySet()
  innermark.properties.enter.x           = VegaValueRef(scale = "x", field = "x")
  innermark.properties.enter.y           = VegaValueRef(scale = "y", field = "y")
  innermark.properties.enter.y2          = VegaValueRef(scale = "y", field = "y2")
  innermark.properties.enter.fill        = VegaValueRef(scale = "group", field = "group")
  innermark.properties.enter.interpolate = VegaValueRef(value="monotone")

  mark = VegaMark()
  mark._type = "group"
  mark.from = VegaMarkFrom()
  mark.from.data      = tablename
  mark.from.transform = [VegaTransform(Dict{Any,Any}("type"=>"facet", "groupby" => ["group"]))]
  mark.marks = [innermark;]

  v.marks = [mark;]

  v.scales[1]._type = "linear"
  v.scales[1].zero = false
  v.scales[2].domain = VegaDataRef(data = tablename, field = ["y", "y2"])

  return v
end
