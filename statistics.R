# table

download.file("https://github.com/YuHsuanLin/riii/raw/master/Statistics/cdc.Rdata", "/home/matt/R/aaa.Rdata")
load("/home/matt/R/aaa.Rdata")

load("/home/matt/R/riii/Statistics/cdc.Rdata")

names(cdc)
head(cdc)
table(cdc$gender, cdc$hlthplan) / nrow(cdc)

table(cut(cdc$weight, seq(60, 520, by=20), right=F))

# correlation

gdp = read.csv("/home/matt/R/riii/data/gdp.csv")
gdp = gdp[1:15,]

gdp$GDP = sapply(gdp$GDP, function(x){as.numeric(sub(",", "", x))})
gdp$Export = sapply(gdp$Export, function(x){as.numeric(sub(",", "", x))})
cor(gdp)
