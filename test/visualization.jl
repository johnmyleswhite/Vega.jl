d = [VegaData(values = [{"x" => 1, "y" => 1},
                        {"x" => 2, "y" => 3},
                        {"x" => 3, "y" => 10}])]
s = [VegaScale(name = :x,
	           scaletype = :ordinal,
	           range = :width,
               domain = {"data" => "table", "field" => "data.x"}),
	 VegaScale(name = :y,
	 	       scaletype = :linear,
	 	       range = :height,
	           domain = {"data" => "table", "field" => "data.y"})]
m = [VegaMark(marktype = :rect,
              from = {"data" => "table"},
              properties =
                {
                 "enter" =>
                 {
                  "x" => {"scale" => "x", "field" => "data.x"},
                  "width" => {"scale" => "x", "band" => true, "offset" => -1},
                  "y" => {"scale" => "y", "field" => "data.y"},
                  "y2" => {"scale" => "y", "value" => 0}
                 },
                 "update" =>
                 {
                  "fill" => {"value" => "steelblue"}
                 },
                 "hover" =>
                 {
                  "fill" => {"value" => "red"}
                 }
                })]
v = VegaVisualization(data = d,
	                    scales = s,
	                    marks = m)

f = Vega.tojs(v)

using JSON
print(JSON.to_json(f))
