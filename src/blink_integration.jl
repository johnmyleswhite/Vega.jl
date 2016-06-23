using Blink

function blink_show(v::VegaVisualization)
    w = Window()
    body!(w, genhtml(v))
end
