# appledaily
load("/home/matt/R/riii/Statistics/appledaily.RData")
dt = as.POSIXct(appledaily$dt, format = "%Y年%m月%d日%H:%M")
unclass(dt)

dt2 = strptime(appledaily$dt, "%Y年%m月%d日%H:%M")
unclass(dt2)$wday

a = c("abc", "bcd", "cde")
grep("b", a)
grepl("b", a)

s = "abc-def-ghi-jkl"
strsplit(s, "-")
substring(s, 1, 5)

library("stringr")
as.integer(str_match(appledaily$clicked, "人氣\\((\\d+)\\)")[,2])

# applenews
load("/home/matt/R/riii/Statistics/applenews.RData")

is.na(applenews)
complete.cases(applenews$clicked)
nrow(applenews[complete.cases(applenews),])

mean(applenews$clicked, na.rm = T)

cat_means = tapply(applenews$clicked, applenews$category, function(x){as.integer(mean(x))})
cat_means

install.packages("dplyr")
library("dplyr")
filter(applenews, category == "娛樂")
