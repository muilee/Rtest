install.packages("C50")
library(C50)

data(churn)
str(churnTrain)

churnTrain = churnTrain[, !names(churnTrain) %in% c("state", "area_code", "account_length")]

set.seed(2)
index = sample(2, nrow(churnTrain), replace = T, prob = c(0.7, 0.3))
trainset = churnTrain[index == 1,]
testset = churnTrain[index == 2,]

install.packages('rpart')
library('rpart')
con = rpart.control(cp=0.01)
churn.rp<-rpart(churn ~., data=trainset, control = con)

churn.rp
summary(churn.rp)

plot(churn.rp, uniform=TRUE,branch = 0.6, margin=0.1)
text(churn.rp, all=TRUE, use.n=TRUE, cex=0.7)

printcp(churn.rp)
plotcp(churn.rp)

install.packages("party")
library('party')
ctree.model = ctree(churn ~ . , data = trainset)
plot(ctree.model, margin=0.1)

daycharge.model = ctree(churn ~ total_day_charge + international_plan, data = trainset)
plot(daycharge.model)

ctree.predict = predict(ctree.model ,testset)
table(ctree.predict, testset$churn)

install.packages("caret")
install.packages("e1071")
confusionMatrix(table(ctree.predict, testset$churn))
