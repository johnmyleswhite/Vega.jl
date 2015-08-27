# Open a URL in a browser
function openurl(url::String)
    @osx_only     run(`open $url`)
    @windows_only run(`start $url`)
    @linux_only   run(`xdg-open $url`)
end

#Vega Scaffold: https://github.com/vega/vega/wiki/Runtime
#Only Julia code is tojson(v), converting from ::VegaVisualization to JSON
function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")

println(io,
"
<html>
  <head>
    <title>$title</title>
    <script src=\"http://vega.github.io/vega-editor/vendor/d3.min.js\"></script>
    <script src=\"http://vega.github.io/vega-editor/vendor/d3.geo.projection.min.js\"></script>
    <script src=\"http://vega.github.io/vega-editor/vendor/topojson.js\"></script>
    <script src=\"http://vega.github.io/vega-editor/vendor/d3.layout.cloud.js\"></script>
    <script src=\"http://vega.github.io/vega/vega.min.js\"></script>

  </head>
  <body>
    <div id=\"vis\"></div>
  </body>
<script type=\"text/javascript\">
// parse a spec and create a visualization view
function parse(spec) {
  vg.parse.spec(spec, function(chart) { chart({el:\"#vis\"}).update(); });
}
parse($(tojson(v)));
</script>
</html>
")

end

function Base.show(io::IO, v::VegaVisualization)

    # create a temporary file
    tmppath = string(tempname(), ".vega.html")
    io = open(tmppath, "w")
    writehtml(io, v)
    close(io)

    # Open the browser
    openurl(tmppath)

end
