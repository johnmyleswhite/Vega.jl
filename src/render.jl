# Open a URL in a browser
# function openurl(url::AbstractString)
#     @static if is_apple() run(`open $url`) end
#     @static if is_windows() run(`cmd /c start $url`) end
#     @static if is_linux()   run(`xdg-open $url`) end
# end
#

#Convenience method for getting Vega JSON
print(x::VegaVisualization) = print(JSON.json(tojs(x)))

# #Jupyter Notebook display
function show(io::IO, ::MIME"text/html", v::VegaVisualization)
     divid = "vg" * randstring(3)
     spec = JSON.json(tojs(v))

     display("text/html", """

     <body>
     <div id=\"$divid\"></div>
     </body>

     <script type="text/javascript">

             require.config({
               paths: {
                 d3: "https://johnmyleswhite.github.io/Vega.jl/javascripts/d3.min",
                 vega: "https://johnmyleswhite.github.io/Vega.jl/javascripts/vega.min",
                 cloud: "https://johnmyleswhite.github.io/Vega.jl/javascripts/d3.layout.cloud",
                 topojson: "https://johnmyleswhite.github.io/Vega.jl/javascripts/topojson"
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
     </script>
     """)
end
