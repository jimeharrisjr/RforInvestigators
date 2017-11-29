# Read the copy of the evidence file
textData<-read.csv('UnbilledMessaging.csv', header = TRUE, stringsAsFactors = FALSE) #stringsAsFactors is a parameter we aren't ready to deal with yet - just include for now

# Explore the data
colnames(textData)
head(textData)

# Get individual columns, rows, and cells
textData$Date #Get the Date Column
textData$Date[33] #Get the 33rd element of the Date Column
textData[5,4] #Row 5, column 4
textData[4,] #Row 4 ALL

#find out the unique values of each column
unique(textData$Date)
unique(textData$Time)
unique(textData$To)
unique(textData$From)
unique(textData$Direction)
unique(textData$Message.Type)


# Get a count of "To" and "From" messages
table(textData$To) # Make a numeric table with frequency of occurence 
table(textData$From)
barplot(table(textData$To))

## lots of extra space in the margin for side 1
op <- par(mar = c(10,4,4,2) + 0.1) # Set margin - stores original margins in variable "op"
barplot(table(textData$From), las = 2, main="All 'From' numbers") # las is "label style," 2 means "perpendicular to the axis
barplot(table(textData$To), las = 2, main="All 'To' numbers")
par(op) ## reset margin back to original