#There's two primary apis for graphics in R. ggplot2 and base graphics (the built in plotting library)
#This demo uses base because it's easier. 

#Let's get some data
povertyDf = read.csv("./data/world_poverty_in_millions.csv")

#lets make the dates into years
getYear = function(x) { as.numeric(format(as.Date(x), '%Y')) }
povertyDf$Year = sapply(povertyDf$Date, getYear)

#order the data by date asc
povertyDf = povertyDf[order(povertyDf$Year, decreasing = FALSE),]

#A very basic barchart. Just the two data sets. 
barplot(povertyDf$Value, names.arg = povertyDf$Year)

# adding in some labels
barplot(povertyDf$Value, names.arg = povertyDf$Year, main = "World Poverty in Millions", xlab = "Year", ylab = "People in Poverty (Millions)")


#lets make things a little prettier using par()
par(bg = "#EDFBFF", las = 1, col.lab = "#262626", col.axis = "#262626", cex.axis = 0.9, cex.lab = 1.25, cex.main = 1.5)

#lets tweak the look a little bit more
barplot(povertyDf$Value, names.arg = povertyDf$Year,
    main = "World Poverty in Millions",
    xlab = "Year", ylab = "People in Poverty (Millions)",
    ylim = c(0, 2000), col = "#00B01A")

#let's try a line chart instead | type l = line chart
plot(povertyDf$Year, povertyDf$Value, type = "l",
    main = "World Poverty in Millions",
    xlab = "Year", ylab = "People in Poverty (Millions)",
    ylim = c(0, 2000), xlim = c(1980, 2013), col = "#00475E", lwd = 3)

# we can save plots too | Supported formats include: svg(), pdf(), jpeg(), png()...
png("data/Poverty_In_Millions.png", width = 800, height = 1000)
barplot(povertyDf$Value, names.arg = povertyDf$Year,
    main = "World Poverty in Millions",
    xlab = "Year", ylab = "People in Poverty (Millions)",
    ylim = c(0, 2000), col = "#00B01A")
dev.off() #turns off the plot saving