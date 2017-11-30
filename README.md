# RforInvestigators
Notes, R scripts, practice exercises, etc. for the YouTube Videos (see the [intro video here](https://youtu.be/wEKVxeIRBXU) )

# What's the purpose of this? 

I'm putting together a series of videos to help people in the Investigtions or Intelligence Analysis fields learn how R might make their lives simpler. When I was an FBI Agent, the tools that were available to use for evidence analysis and digital forensic investigations were either too expensive, too generic, or both. Some of the capabilities I needed back then are available now in completely open-source R.

# What is R?

(From the R Project Website: www.r-project.org): "R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS."

**Simpler answer**: R is a simple way to manipulate and analyze data for FREE

R is a high-level, interpreted language - meaning it uses fairly simple, human-readable commands to perform complex operations. For example, if I downloaded the partial call record sample set (in Comma Separated Value, or, csv format) from http://nodobo.com/release.html, and wanted to explore them, I might start with:
~~~R
mydata<-read.csv('calls.csv', header = TRUE, stringsAsFactors = FALSE)
head(mydata)
~~~
The first line means pretty much what it says:
- "Read this csv file called 'calls.csv'" (`read.csv('calls.csv')`). 
- "The file's first line is a 'header'" (it contains the labels of the columns in the data) (`read.csv('calls.csv', header=TRUE)`). 
- "I do _not_ want you to return the set of strings as factors __*__" (`read.csv('calls.csv', header = TRUE, stringsAsFactors = FALSE)`). 
- "Store the contents as a data frame in a variable named "mydata" (`mydata<-read.csv('calls.csv', header = TRUE, stringsAsFactors = FALSE)`).
- "Show me the first six lines of the file" (`head(mydata)`)

The result of these statements would be:
~~~
        user      other direction duration                      timestamp
1 7610039694 7434677419  Incoming      211 Wed Sep 15 19:17:44 +0100 2010
2 7641036117 1666472054  Outgoing       31 Mon Feb 11 07:18:23 +0000 1980
3 7641036117 7371326239  Incoming       45 Mon Feb 11 07:45:42 +0000 1980
4 7641036117 7681546436  Outgoing       10 Mon Feb 11 08:04:42 +0000 1980
5 7641036117 7681546436  Outgoing        0 Mon Feb 11 08:05:31 +0000 1980
6 7641036117 7681546436  Incoming        0 Mon Feb 11 08:06:18 +0000 1980
~~~

Although much has been written about using R for Data Science, statistical analysis, and life sciences, these same capabilities are useful in other areas of inquiry - including Law Enforcement, Intelligence Analysis, and even private investigations (such as financial fraud).

__*__ For a discussion of what "factors" are, see https://www.stat.berkeley.edu/classes/s133/factors.html

# Why Learn R?
- It’s FREE
- It’s POWERFUL
- It has a huge DEVELOPER COMMUNITY
- … Did I mention it’s FREE?

# What Can I Do With It?

R has a seemingly endless library of tools to manipulate, analyze, and display data in ways that can make understanding the relationships between things much easier. For example, you could use R to analyze Twitter postings, and see how a user's activity varies from day-to-day or hour-to-hour. You could "heatmap" that activity and see when they are most and least likely to be on, or plot their geo-tagged tweets on a map. There is an example of this in the first video.

You can also develop graph representations of data to show connections between individuals or events. For example, you could use Wireshark or it's command-line version, Tshark (https://www.wireshark.org/), capture a bunch of packets on your network, export them as a .csv file, and then plot that as a graph, showing the connections between each device (as seen in the first video). Sample code for that R plotting is provided in the directory "Introduction."

With each subsequent video, I will put some sort of tutorial or exercise for you to understand better the concepts.

# I'm convinced - where can I get some more advanced training?
Both Coursera and Udemy have courses online available. I'm partial to the Johns Hopkins University Data Science Specialization on Coursera (https://www.coursera.org/specializations/jhu-data-science) but you can find many courses there, and on Udemy (and others, I'm sure)
