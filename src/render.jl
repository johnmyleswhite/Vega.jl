# Open a URL in a browser
function openurl(url::String)
    @osx_only     run(`open $url`)
    @windows_only run(`start $url`)
    @linux_only   run(`xdg-open $url`)
end

const d3 = Pkg.dir("Vega", "deps/vega/examples/lib/d3.v3.min.js")
const geo = Pkg.dir("Vega", "deps/vega/examples/lib/d3.geo.projection.min.js")
const topo = Pkg.dir("Vega", "deps/vega/examples/lib/topojson.js")
const vega = Pkg.dir("Vega", "deps/vega/vega.js")
const cloud = Pkg.dir("Vega", "deps/vega/examples/lib/d3.layout.cloud.js")


#Only inject javascript if html can be displayed (i.e. Jupyter Notebook)
if displayable("text/html")

    display("text/html", "<script>$(readall(topo))</script>")
    display("text/html", "<script>$(readall(d3))</script>")
    display("text/html", "<script>$(readall(geo))</script>")
    display("text/html", "<script>$(readall(vega))</script>")
    display("text/html", "<script>$(readall(cloud))</script>")
end

#Overload writemime so that plots are displayed inline for Jupyter
import Base.writemime
function writemime(io::IO, ::MIME"text/html", v::VegaVisualization)

        spec = JSON.json(tojs(v))
        divid = randstring(5)
        vegahtml =
            """
              <body>
                <div id="$divid"></div>
              </body>

            <script type='text/javascript'>
            // parse a spec and create a visualization view
            function parse(spec) {
              vg.parse.spec(spec, function(chart) { chart({el:"#$divid", renderer:"svg"}).update(); });
            }
        parse($spec);
            </script>
            """

        print(io, vegahtml)

end

#Function to create full HTML version in cases where browser pops open
function writehtml(io::IO, v::VegaVisualization; title="Vega.jl Visualization")
    js = tojs(v)

    # spec = tojson(v)
    d3path = Pkg.dir("Vega", "deps/vega/examples/lib/d3.v3.min.js")
    vegapath = Pkg.dir("Vega", "deps/vega/vega.js")

    println(io, "<html>")

    # print head
    println(io, "<head>")
    println(io, "  <title>$title</title>")
    #println(io, "  <script src='$d3path'></script>")
    #println(io, "  <script src='$vegapath'></script>")
    println(io," <script src=\"http://trifacta.github.io/vega/lib/d3.v3.min.js\"></script>")
    println(io," <script src=\"http://trifacta.github.io/vega/lib/d3.geo.projection.min.js\"></script>")
    println(io," <script src=\"http://trifacta.github.io/vega/lib/topojson.js\"></script>")
    println(io," <script src=\"http://vega.github.io/vega/vega.js\"></script>")
    println(io, "</head>")

    # print body
    println(io, "<body><div style='text-align: center' id='view' class='view'></div></body>")

    # print script
    println(io, "<script type='text/javascript'>")
    print(io, "spec = ")
    JSON.print(io, js)
    println(io, ";")
    println(io, "vg.parse.spec(spec, function(chart) {
        self.view = chart({el:'#view'}).update();
    });")
    println(io, "</script>")
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
