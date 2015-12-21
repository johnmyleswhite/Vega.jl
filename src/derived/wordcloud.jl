function wordcloud(; x::AbstractVector =  UTF8String[], wordAngles::AbstractVector = [-45, 0, 45], minThreshold::Int = 0)

    v = VegaVisualization(height = 400,
                      width = 800,
                      padding = "auto",
                      name = "wordcloud",
                      data = Array(VegaData,1),
                      scales = Array(VegaScale, 1),
                      marks = Array(VegaMark, 1))

    #Make unique table name
    table = string("table_", lowercase(randstring(5)))

    v.data[1] = VegaData(name = table,
                         values = x,
                         transform = Array(VegaTransform, 6))

    v.data[1].transform[1] = VegaTransform(Dict{Any, Any}("type" => "countpattern",
                                                        "field" => "data",
                                                        "case" => "upper",
                                                        "pattern" => "[\\w']{3,}",
                                                        "stopwords" => "(i|me|my|myself|we|us|our|ours|ourselves|you|your|yours|yourself|yourselves|he|him|his|himself|she|her|hers|herself|it|its|itself|they|them|their|theirs|themselves|what|which|who|whom|whose|this|that|these|those|am|is|are|was|were|be|been|being|have|has|had|having|do|does|did|doing|will|would|should|can|could|ought|i'm|you're|he's|she's|it's|we're|they're|i've|you've|we've|they've|i'd|you'd|he'd|she'd|we'd|they'd|i'll|you'll|he'll|she'll|we'll|they'll|isn't|aren't|wasn't|weren't|hasn't|haven't|hadn't|doesn't|don't|didn't|won't|wouldn't|shan't|shouldn't|can't|cannot|couldn't|mustn't|let's|that's|who's|what's|here's|there's|when's|where's|why's|how's|a|an|the|and|but|if|or|because|as|until|while|of|at|by|for|with|about|against|between|into|through|during|before|after|above|below|to|from|up|upon|down|in|out|on|off|over|under|again|further|then|once|here|there|when|where|why|how|all|any|both|each|few|more|most|other|some|such|no|nor|not|only|own|same|so|than|too|very|say|says|said|shall)"
                                                        ))

    #Calculate angles
    v.data[1].transform[3] = VegaTransform(Dict{Any, Any}("type" => "formula",
                                                            "field" => "angle",
                                                            "expr" => "$(wordAngles)[~~(random() * $(length(wordAngles)))]"
                                                            ))

    #Specify wordcloud properties
    v.data[1].transform[4] = VegaTransform(Dict{Any, Any}("type" => "wordcloud",
                                                            "size" => [800,400],
                                                            "text" => Dict{Any, Any}("field" => "text"),
                                                            "rotate" => Dict{Any, Any}("field" => "angle"),
                                                            "font" => Dict{Any, Any}("value" => "Helvetica Neue"),
                                                            "fontSize" => Dict{Any, Any}("field" => "count"),
                                                            "fontWeight" => Dict{Any, Any}("field" => "weight"),
                                                            "fontScale" => [12,56]
                                                            ))

    #Set weights
    v.data[1].transform[2] = VegaTransform(Dict{Any, Any}("type" => "formula",
    "field" => "weight",
    "expr" => "if(datum.text=='VEGA', 600, 300)"

                                                         ))

    #Set min word count
    v.data[1].transform[5] = VegaTransform(Dict{Any, Any}("type" => "filter",
    "test" => "datum.count > $(minThreshold)"

                                                         ))

    #Create field "group" for consistency
    v.data[1].transform[6] = VegaTransform(Dict{Any, Any}("type" => "formula",
    "field" => "group",
    "expr" => "datum.text"

                                                         ))

    #Define color palette
    v.scales[1] = VegaScale(name = "group", _type = "ordinal", range = ["#d5a928", "#652c90", "#939597"])

    #Draw words
    v.marks[1] = VegaMark(_type = "text",
                          from = VegaMarkFrom(data = table),
                          properties = VegaMarkProperties(enter = VegaMarkPropertySet(
                                                                                      x = VegaValueRef(field = "layout_x"),
                                                                                      y = VegaValueRef(field = "layout_y"),
                                                                                      angle = VegaValueRef(field = "layout_rotate"),
                                                                                      font = VegaValueRef(field = "layout_font"),
                                                                                      fontSize = VegaValueRef(field = "layout_fontSize"),
                                                                                      fontStyle = VegaValueRef(field = "layout_fontStyle"),
                                                                                      fontWeight = VegaValueRef(field = "layout_fontWeight"),
                                                                                      text = VegaValueRef(field = "text"),
                                                                                      align = VegaValueRef(value = "center"),
                                                                                      baseline = VegaValueRef(value = "alphabetic"),
                                                                                      fill = VegaValueRef(scale = "group", field = "text")
                                                                                     )

                                                          )
                         )


    #Default to Paired color scale, 12
    colorscheme!(v; palette = ("Paired", 12))
    return v
end