# Installing R and RStudio in Ubuntu Linux

Since the Windows and Mac OSX installations are fairly straightforward, this document offers tips on Linux - specifically Ubuntu 16.04.

Digital Ocean has a pretty good tutorial here: https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-16-04-2

I actually followed the steps here: https://cran.r-project.org/bin/linux/ubuntu/README.html

Either way, you should be fine - remember to go to the CRAN list at https://cran.r-project.org/mirrors.html to make sure you have one selected reasonably near you (for speed).

RStudio can be installed easily in Ubuntu from the RStudio web site. **However** there is one Linux package you will likely need: libcurl4-openssl-dev. Install it like this:
~~~
sudo apt-get install libcurl4-openssl-dev
~~~

# A word of advice...
If you're not really familiar with Linux (and don't want to learn it), then don't go the Linux path. Really, just save yourself the effort. Use Windows or Mac. Why? Because installing some R packages in the future will require you to get more and more familiar with installing Linux packages. Everything you want to do in R and RStudio, you can do on a Mac or Windows PC just fine.

I'm using Linux here to prove a point: there are open source tools that can help Law Enforcement, Intelligence, and other investigative professionals do their work - even better - without spending tens of thousands of dollars on expensive software.

