markpropertyset_type = :VegaMarkPropertySet

markpropertyset_spec =
[
	(:x, VegaValueRef, nothing, true),
	(:x2, VegaValueRef, nothing, true),
	(:width, VegaValueRef, nothing, true),
	(:y, VegaValueRef, nothing, true),
	(:y2, VegaValueRef, nothing, true),
	(:height, VegaValueRef, nothing, true),
	(:opacity, VegaValueRef, nothing, true),
	(:fill, VegaValueRef, nothing, true),
	(:fillOpacity, VegaValueRef, nothing, true),
	(:stroke, VegaValueRef, nothing, true),
	(:strokeWidth, VegaValueRef, nothing, true),
	(:strokeOpacity, VegaValueRef, nothing, true),
	(:strokeDash, VegaValueRef, nothing, true),
	(:strokeDashOffset, VegaValueRef, nothing, true),
	(:size, VegaValueRef, nothing, true),
	(:shape, VegaValueRef, nothing, true),
	(:path, VegaValueRef, nothing, true),
	(:innerRadius, VegaValueRef, nothing, true),
	(:outerRadius, VegaValueRef, nothing, true),
	(:startAngle, VegaValueRef, nothing, true),
	(:endAngle, VegaValueRef, nothing, true),
	(:interpolate, VegaValueRef, nothing, true),
	(:tension, VegaValueRef, nothing, true),
	(:url, VegaValueRef, nothing, true),
	(:align, VegaValueRef, nothing, true),
	(:baseline, VegaValueRef, nothing, true),
	(:text, VegaValueRef, nothing, true),
	(:dx, VegaValueRef, nothing, true),
	(:dy, VegaValueRef, nothing, true),
	(:angle, VegaValueRef, nothing, true),
	(:font, VegaValueRef, nothing, true),
	(:fontSize, VegaValueRef, nothing, true),
	(:fontWeight, VegaValueRef, nothing, true),
	(:fontStyle, VegaValueRef, nothing, true)
]

eval(maketype(markpropertyset_type, markpropertyset_spec))
eval(makekwfunc(markpropertyset_type, markpropertyset_spec))
eval(maketojs(markpropertyset_type, markpropertyset_spec))
eval(makecopy(markpropertyset_type, markpropertyset_spec))
