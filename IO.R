test.data = read.csv("/home/matt/R/riii/data/2330.csv", header = T)
head(test.data)
class(test.data)
str(test.data)
tail(test.data)
test.data$Date = as.Date(test.data$Date)

test.data_range = test.data[test.data$Date >= "2014-03-01" & test.data$Date <= "2014-08-31",]

test.data_range_order = test.data_range[order(test.data_range$Close, decreasing = T),]
test.data_range_order