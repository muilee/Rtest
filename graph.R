load("/home/matt/R/riii/Statistics/cdc.Rdata")

##graphic

  #bar chart
barplot(table(cdc$smoke100), xlab="is smoke", ylab="population", main="title", col="blue")

  # pie chart
pie(table(cdc$genhlth), col=rainbow(5))
pct = round(table(cdc$genhlth) / nrow(cdc) * 100, 1)
labels = paste(names(pct), pct, "%")
pie(table(cdc$genhlth), labels=labels, col=rainbow(5))

  # mosaic plot
smokers_gender = table(cdc$gender, cdc$smoke100)
colnames(smokers_gender) = c("no", "yes")
mosaicplot(smokers_gender, col=rainbow(length(colnames(smokers_gender))))

  # histogram

hist(cdc$height, breaks = 50)
hist(cdc$height, breaks = 40)

  # box chart

boxplot(cdc$weight ~ cdc$gender, xlab="gender", ylab="weight")

  #scatter
plot(cdc$weight, cdc$wtdesire)

#ggplot

install.packages("ggplot2")
library("ggplot2")
g = ggplot(cdc, aes(x=height, y=weight))
g + geom_point(aes(col=exerany))

  # bar chart
g = ggplot(cdc, aes(x=genhlth))
g + geom_bar()
g + geom_bar(fill="snow", color="black")
g + geom_bar(fill="snow", color="black") + ylab("count") + ggtitle("cdc")

g_bygrp = ggplot(cdc, aes(x=exerany, fill=genhlth))
g_bygrp + geom_bar(position="dodge")
g_bygrp + geom_bar(position="stack")
g_bygrp + geom_bar(position="identity")

precounted = as.data.frame(table(cdc$genhlth, dnn = c("genhlth")))
ggplot(precounted, aes(x=genhlth, y=Freq)) + geom_bar(stat="identity")
  # histogram
g = ggplot(cdc, aes(x=weight))
g + geom_histogram() + facet_wrap(~genhlth)

