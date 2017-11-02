# This is an advanced example - just to show you the power of the tools
# It requires the libraries dplyr, iGraph, and visNetwork
# You can read about dplyr here: https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
# Learn about visNetwork here: http://datastorm-open.github.io/visNetwork/
# Learn about iGraph here: http://igraph.org/r/
library(visNetwork)
library(dplyr)
library(igraph)
# read the csv file you saved from Wireshark (or Tshark), which has a header
pcap<-read.csv('pcapfile.csv', header = TRUE, stringsAsFactors = FALSE)

# Get the total list (a vector) of all the nodes (network devices/addresses) by combining - c() - the Source and Destination
# use unique() to remove duplicates
nodes<-unique(c(pcap$Source,pcap$Destination))

# make a vector (bunch of entries strung together) for the color.
# Think of a vector as a line of little boxes - each one numbered - containing some entry
# In this case, the entry is the name of a color.
# repeat - rep() the color light blue the same number of times as the number of - length() nodes
colors<-rep('lightblue',length(nodes))

# Now set different colors and shapes accoring to different properties of the device
# In this case, grep() is a function that searches for  a pattern in something, and returns
# a vector of the indices (the numbers on the boxes) where the pattern is found
# A number of arbitrary examples are below

# Find all the entries in "nodes" with "::" in them and make their color orange instead of light blue
colors[grep('::', nodes)]<-'orange'
# Now find everything with fe80:: (which would include some of the "::" entries) and color them light green
colors[grep('fe80::', nodes)]<-'lightgreen'

# Now set the border color for each shape
borders<-rep('darkblue',length(nodes))
borders[grep('::', nodes)]<-'red'
borders[grep('fe80::', nodes)]<-'green'

# And set the shape of the node the same way
shapes<-rep('circle', length(nodes))
shapes[grep('::', nodes)]<-'ellipse'
shapes[grep('fe80::', nodes)]<-"square"

# Tell it what color to make each node change to (highlight) when I click on it
highlights<-rep('yellow',length(nodes))

# Now create a set of data frames (which you can think of as a table of column vectors - boxes in a grid)
# Instead of column numbers, our nodeData frame will have the column names (labels) "id," "color," "shape," and "label"
# We fill those columns with the vectors we just created
nodeData<-data.frame(id=nodes, color=list(background=colors,border=borders,highlight=highlights), shape=shapes, label=nodes, stringsAsFactors = FALSE)


# Our edge data frame will take our "Source" and "Destination columns from our pcap and make them "from" and "to" of a graph
# We use the "Protocol" column to label the arrows of our graph
edgeData<-data.frame(from=pcap$Source, label=pcap$Protocol, to=pcap$Destination, tooltip=pcap$Info, length=(pcap$Length)*2, stringsAsFactors = FALSE)

# Now call visnetwork to plot our data. Label it "Network Plot." The width will take 100% of the window width.
# The height is set to 600 pixels. Then we use the pipe %>% to start altering that graph
# The first pipe sends our graph to the "visEdges" function, which tells the graph to add arrows going in the "to" direction
# The next pipe sends the graph to "visIgraph" (http://igraph.org/) function which tells it to use the full space available and use the "Kamada-Kawai" layout (http://igraph.org/r/doc/layout_.html)
# Finally, we pipe it to visOptions and set "highlightNearest" so that the graph highlights the closest neighbors to the node you click
visNetwork(nodeData, edgeData, main = "Network Plot", width = "100%", height='600px')  %>% visEdges(arrows = "to") %>% 
   visIgraphLayout(type='full', layout='layout_with_kk') %>% 
   visOptions(highlightNearest = TRUE)



