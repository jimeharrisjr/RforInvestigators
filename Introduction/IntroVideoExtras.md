# Exploring Further - Understanding the Video Demos

In the Introduction video, which you can see [here](https://youtu.be/wEKVxeIRBXU), I showed a couple of examples of the types of things you can do with R. Many of these visualizations depend on what R calls "packages." Packages are ways to group R functions you create, and to share them with the world. 

In the next videos, I'm gong to build up to packages slowly, but if you are a more advanced user, and you want to look ahead, proceed on!

# Sneak Peak - Packages

There are officially maintained packages at CRAN, which you can view [here](https://cran.r-project.org/web/packages/available_packages_by_name.html)

Plenty of other packages (which have not yet been adopted by CRAN) are available on GitHub.

Some of the ones you saw in the video are :

rtweet (https://cran.r-project.org/web/packages/rtweet/index.html);
heatmaply (https://cran.r-project.org/web/packages/heatmaply/index.html);
shiny (https://cran.r-project.org/web/packages/shiny/index.html);
leaflet (https://cran.r-project.org/web/packages/leaflet/index.html); and
visNetwork (https://cran.r-project.org/web/packages/visNetwork/index.html)

Most packages are installed by typing:
```
install.packages("<package_name>")
```

If the package has not been adopted by CRAN, but is on GitHub, you can generally install it with the R Developer Tools, known as devtools (https://cran.r-project.org/web/packages/devtools/index.html)

In that case, you install like this:
```
install.packages("devtools")
library(devtools)
install_github("<the_GitHub_Repository>")
```
See [this link](http://kbroman.org/pkg_primer/pages/github.html) for more details.

## Note for Linux users
This is where the rubber meets the road. R doesn't have binary repositories for Linux - that means each package has to be built when you install it in Linux. Any C++ libraries have to be recompiled, etc. This takes time - and it may also involve some patience with error messages - and some diligent Google searches (which usually lead you to https://stackoverflow.com/ )

Often, these occur because either a required R package or - often in Linux - a Linux library is missing (so you have to go to the Linux command line and type `sudo apt-get install <whatever is missing>`). These required linux and R libraries are called dependencies - and they come up a lot.

The Linux installation instructions in this repository mention one such dependency - libcurl. Others will come up. Again, if this isn't your cup of tea, Windows and Mac are generally more forgiving than Linux.

# Provided Network Investigation Example
Included in this directory is an example R script file, ExamplePacketPlot.R. Take a good look at the R script. The lines that begin with a "#" symbol are my comments - they don't execute, they're just there to tell you what's happening. 

The script takes the output of a packet capture (pcap) export from Wireshark or Tshark (https://www.wireshark.org/), and graphs it as a network directed graph, as you saw in the Intro video.

If you have Wireshark or Tshark, you can do your own packet capture on the network, export it as pcapfile.csv, and plot it. You can follow directions for exporting pcap data [here](https://www.wireshark.org/docs/wsug_html_chunked/ChIOExportSection.html). Otherwise, a sample file is provided for you - it's a tiny segment of the data from the National CyberWatch Mid-Atlantic Collegiate Cyber Defense Competition (MACCDC). The original pcap files (which are WAY too big to plot) are [here](http://www.netresec.com/?page=MACCDC). Unless you are working on an extremely high-end system with LOTS of RAM and an extremely fast processor, I do NOT recommend trying to analyze one of those entire pcap files all at once. First of all, you won't be able to see anything in all the noise. Second, your performance would be terrible. 

For this reason, I have provided a snippet of their pcap file, converted to csv, which displays some interesting activity.

To play with this, you will need to copy this script and the csv file into the working directory of a new RStudio project (go to File -> New Project and create a new empty project in a new directory) or, if you are using command-line R, in your working directory (you can get your current working directory at the R command line by typing `getwd()` at the prompt, or reset it to a different directory with `setwd("<your path>")`.

You need to make sure the necessary packages are installed (**Note** as of the date of this writing (11/2/2017) Linux users need to see the footnote):
```
install.packages('dplyr')
install.packages('visNetwork')
install.packages('igraph') # Linux users see below *
```
(*) The current igraph release (as of 11/2/2017) has a build error on some Ubuntu Linux systems (including mine). To properly install igraph, you will need to use devtools (see above) and install this way:
```
# For Linux users only
library(devtools)
install_version('igraph', version='1.0.1', repos='https://cran.rstudio.org/')
```
## Running the demo
### RStudio (easy)
From RStudio, open the R file (File -> Open File -> ExamplePacketPlot.R), then click the "Source" button on the menu bar of the top, left window (where the R script is open). The plot will appear (after a delay, depending on the power of your machine) in the "viewer" tab of the bottom, right-hand window.

### RConsole (harder)
Now, from R console (non-RStudio users), if you source the document (source('ExamplePacketPlot.R') from the console), you will notice nothing happens. This is because you haven't told the console to really do anything directly. There are several ways to make something happen. Open the document in R's text editor. Select all of the text, then go to Edit -> Execute. Your web browser should launch with the graph.

Alternatively, just highlight all of the visNetwork commands (once you have "sourced") and Edit -> Execute, or just cut-and-paste the visNetwork commands into the R console and hit "enter."

Voila - your browser should pop up!
