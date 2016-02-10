# Open a URL in a browser
function openurl(url::AbstractString)
    @osx_only     run(`open $url`)
    @windows_only run(`cmd /c start $url`)
    @linux_only   run(`xdg-open $url`)
end

#Jupyter Notebook display
import Base.writemime

asset(url...) = readall(Pkg.dir("Vega", "assets", "bower_components", url...))

function writemime(io::IO, ::MIME"text/html", v::VegaVisualization)
    divid = "vg" * randstring(3)
    script_contents = scriptstr(v, divid)
    display("text/html", """

    <body>
    <div id=\"$divid\"></div>
    </body>

    <script type="text/javascript">
        $script_contents
    </script>
    """)
end

import Patchwork: Elem

function patchwork_repr(v::VegaVisualization)
    divid = "vg" * randstring(3)
    script_contents = scriptstr(v, divid)
    Elem(:div, [
        Elem(:div, "") & Dict(:id=>divid, :style=>Dict("min-height"=>"$(v.height + 110)px")),
        Elem(:script, script_contents) & Dict(:type=>"text/javascript")
    ])
end

function writemime(io::IO, m::MIME"text/html", v::VegaVisualization)
    writemime(io, m, patchwork_repr(v))
end

function scriptstr(v::VegaVisualization, divid)
    spec = JSON.json(tojs(v))
    return """
        require.config({
          paths: {
            d3: "https://vega.github.io/vega-editor/vendor/d3.min",
            vega: "https://vega.github.io/vega/vega.min",
            cloud: "https://vega.github.io/vega-editor/vendor/d3.layout.cloud",
            topojson: "https://vega.github.io/vega-editor/vendor/topojson"
          }
        });

        require(["d3", "topojson", "cloud"], function(d3, topojson, cloud){

            window.d3 = d3;
            window.topojson = topojson;
            window.d3.layout.cloud = cloud;

                  require(["vega"], function(vg) {

                  vg.parse.spec($spec, function(chart) { chart({el:\"#$divid\"}).update(); });

                  window.setTimeout(function() {
                    var pnglink = document.getElementById(\"$divid\").getElementsByTagName(\"canvas\")[0].toDataURL(\"image/png\")
                    document.getElementById(\"$divid\").insertAdjacentHTML('beforeend', '<br><a href=\"' + pnglink + '\" download>Save as PNG</a>')

                  }, 20);

              }); //vega require end

        }); //d3 require end
    """
end

#Vega Scaffold: https://github.com/vega/vega/wiki/Runtime
function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")

    d3 = asset("d3","d3.min.js")
    topojson = asset("topojson","topojson.js")
    cloudlayout = asset("d3-cloud", "build", "d3.layout.cloud.js")
    vega = asset("vega", "vega.js")

    divid = "vg" * randstring(3)

    println(io,
    "
    <html>
      <head>
        <title>$title</title>
        <script>$d3</script>
        <script>$topojson</script>
        <script>$cloudlayout</script>
        <script>$vega</script>

      </head>
      <body>
        <div id=\"$divid\"></div>
      </body>

    <script type=\"text/javascript\">
    // parse a spec and create a visualization view
    function parse(spec) {
      vg.parse.spec(spec, function(chart) { chart({el:\"#$divid\"}).update(); });
    }
    parse($(JSON.json(tojs(v))));

    window.setTimeout(function() {
      var pnglink = document.getElementById(\"$divid\").getElementsByTagName(\"canvas\")[0].toDataURL(\"image/png\")
      document.getElementById(\"$divid\").insertAdjacentHTML('beforeend', '<br><a href=\"' + pnglink + '\" download>Save as PNG</a>')

    }, 20);

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
