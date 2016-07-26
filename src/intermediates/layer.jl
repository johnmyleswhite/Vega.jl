#Only really going to work for xy plots?
function layer(plot1::VegaVisualization, plot2::VegaVisualization)

    #Make copy of plots as to not modify the inputs
    baseplot = deepcopy(plot1)
    overlay = deepcopy(plot2)

    #Stash plot2 main "group" scale into inner Vega group mark scale
    #This allows for different colors for every layer, presuming you set the color prior to layering
    #Still need to write code to avoid overwriting value if it's already there
    i = findfirst([z.name == "group" for z in overlay.scales])
    for m in 1:length(overlay.marks)
        overlay.marks[m].scales = [overlay.scales[i]]
    end

    #Iterate over data tables in second plot, append to baseplot
    #This should be fine as-is
    for i in 1:length(overlay.data)
        push!(baseplot.data, overlay.data[i])
    end

    #Add all marks to baseplot
    #This should be fine as-is
    for i in 1:length(overlay.marks)
        push!(baseplot.marks, overlay.marks[i])
    end

    #Make joint x and y scales
    xloc1 = findfirst([z.name == "x" for z in baseplot.scales])
    xloc2 = findfirst([z.name == "x" for z in overlay.scales])
    yloc1 = findfirst([z.name == "y" for z in baseplot.scales])
    yloc2 = findfirst([z.name == "y" for z in overlay.scales])

    #Overwrite baseplot domain value
    if baseplot.scales[xloc1].domain.fields == nothing
        xdomain1=baseplot.scales[xloc1].domain
    else
        xdomain1=baseplot.scales[xloc1].domain.fields
    end
    if overlay.scales[xloc2].domain.fields == nothing
        xdomain2=overlay.scales[xloc2].domain
    else
        xdomain2=overlay.scales[xloc2].domain.fields
    end

    if baseplot.scales[yloc1].domain.fields == nothing
        ydomain1=baseplot.scales[yloc1].domain
    else
        ydomain1=baseplot.scales[yloc1].domain.fields
    end
    if overlay.scales[yloc2].domain.fields == nothing
        ydomain2=overlay.scales[yloc2].domain
    else
        ydomain2=overlay.scales[yloc2].domain.fields
    end

    baseplot.scales[xloc1].domain = VegaDataRef(fields =
        [xdomain1, xdomain2;])
    baseplot.scales[yloc1].domain = VegaDataRef(fields =
        [ydomain1, ydomain2;])

    return baseplot

end
