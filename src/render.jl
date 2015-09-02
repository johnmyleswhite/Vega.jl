# Open a URL in a browser
function openurl(url::String)
    @osx_only     run(`open $url`)
    @windows_only run(`start $url`)
    @linux_only   run(`xdg-open $url`)
end


const d3 = Pkg.dir("Vega", "deps/d3/d3.min.js")
const geo = Pkg.dir("Vega", "deps/d3/d3.geo.projection.min.js")
const topo = Pkg.dir("Vega", "deps/d3/topojson.js")
const cloud = Pkg.dir("Vega", "deps/d3/d3.layout.cloud.js")
const vega = Pkg.dir("Vega", "deps/vega2/vega.min.js")

#Only inject javascript if html can be displayed (i.e. Jupyter Notebook)
if displayable("text/html")

  display("text/html", "<script type=\"text/javascript\">alert(\"Hello! Vega.jl doesn't yet work with Jupyter Notebook.\");</script>")

  # display("text/html", "<script type="text/javascript\" charset=\"utf-8\">$(readall(topo))</script>")
  # display("text/html", "<script type=\"text/javascript\" charset=\"utf-8\">$(readall(d3))</script>")
  # display("text/html", "<script type="text/javascript\" charset=\"utf-8\">$(readall(geo))</script>")
  # display("text/html", "<script type="text/javascript\" charset=\"utf-8\">$(readall(cloud))</script>")
  # display("text/html", "<script type=\"text/javascript\" charset=\"utf-8\">$(readall(vega))</script>")

  display("text/html", "<script src=\"http://vega.github.io/vega-editor/vendor/d3.min.js\" charset=\"utf-8\"></script>")
  display("text/html", "<script src=\"http://vega.github.io/vega-editor/vendor/d3.geo.projection.min.js\" charset=\"utf-8\"></script>")
  display("text/html", "<script src=\"http://vega.github.io/vega-editor/vendor/topojson.js\" charset=\"utf-8\"></script>")
  display("text/html", "<script src=\"http://vega.github.io/vega-editor/vendor/d3.layout.cloud.js\" charset=\"utf-8\"></script>")
  display("text/html", "<script src=\"http://vega.github.io/vega/vega.min.js\" charset=\"utf-8\"></script>")

end

#Only part of displaying that doesn't work
import Base.writemime
function writemime(io::IO, ::MIME"text/html", v::VegaVisualization)

        spec = JSON.json(tojs(v))
        divid = randstring(5)
        vegahtml =
            """
              <body>
                <div id=\"$(divid)\"></div>
              </body>
            <script type='text/javascript'>
            // parse a spec and create a visualization view
            function parse(spec) {
              vg.parse.spec(spec, function(chart) { chart({el:\"#$divid\", renderer:\"svg\"}).update(); });
            }
        parse($spec);
            </script>
            """
        print(io, vegahtml)
end

#Vega Scaffold: https://github.com/vega/vega/wiki/Runtime
#Only Julia code is tojson(v), converting from ::VegaVisualization to JSON
function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")

    println(io,
    "
    <html>
      <head>
        <title>$title</title>
        <script src=\"http://vega.github.io/vega-editor/vendor/d3.min.js\" charset=\"utf-8\"></script>
        <script src=\"http://vega.github.io/vega-editor/vendor/d3.geo.projection.min.js\" charset=\"utf-8\"></script>
        <script src=\"http://vega.github.io/vega-editor/vendor/topojson.js\" charset=\"utf-8\"></script>
        <script src=\"http://vega.github.io/vega-editor/vendor/d3.layout.cloud.js\" charset=\"utf-8\"></script>
        <script src=\"http://vega.github.io/vega/vega.min.js\" charset=\"utf-8\"></script>

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

    if displayable("text/html")
        v
    else
        # create a temporary file
        tmppath = string(tempname(), ".vega.html")
        io = open(tmppath, "w")
        writehtml(io, v)
        close(io)

        # Open the browser
        openurl(tmppath)

    end

    return
end
