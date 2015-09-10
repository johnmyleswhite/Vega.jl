# Open a URL in a browser
function openurl(url::String)
    @osx_only     run(`open $url`)
    @windows_only run(`cmd /c start $url`)
    @linux_only   run(`xdg-open $url`)
end

#Only part of displaying that doesn't work
import Base.writemime
function writemime(io::IO, ::MIME"text/html", v::VegaVisualization)

        spec = JSON.json(tojs(v))
        divid = "vg" * randstring(3)

        display("text/html", """

              <body>
                <div id=\"$divid\"></div>
              </body>

                <script type="text/javascript">

                    require.config({
                      paths: {
                        d3: "https://vega.github.io/vega-editor/vendor/d3.min",
                        vega: "https://vega.github.io/vega/vega.min",
                        cloud: "https://vega.github.io/vega-editor/vendor/d3.layout.cloud",
                        topojson: "https://vega.github.io/vega-editor/vendor/topojson"
                      }
                    });

                    require(["d3"], function(d3){

                        console.log('Loading from require.js...')
                        window.d3 = d3;

                        require(["topojson"], function(topojson){

                          window.topojson = topojson;

                          require(["cloud"], function(cloud){

                            window.cloud = cloud;

                              require(["vega"], function(vg) {

                              vg.parse.spec($spec, function(chart) { chart({el:\"#$divid\"}).update(); });

                          }); //vega require end

                        }); //cloud require end

                      }); //topojson require end

                    }); //d3 require end

                  </script>


              """)
end

#Vega Scaffold: https://github.com/vega/vega/wiki/Runtime
#Only Julia code is tojson(v), converting from ::VegaVisualization to JSON
function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")

    println(io,
    "
    <html>
      <head>
        <title>$title</title>
        <script src=\"https://vega.github.io/vega-editor/vendor/d3.min.js\" charset=\"utf-8\"></script>
        <script src=\"https://vega.github.io/vega-editor/vendor/topojson.js\" charset=\"utf-8\"></script>
        <script src=\"https://vega.github.io/vega-editor/vendor/d3.layout.cloud.js\" charset=\"utf-8\"></script>
        <script src=\"https://vega.github.io/vega/vega.min.js\" charset=\"utf-8\"></script>

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
