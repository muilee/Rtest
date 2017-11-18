kevin = c(85, 73)
marry = c(72, 64)
jerry = c(59, 66)
mat = matrix(c(kevin, marry, jerry), nrow=3, byrow=T)
rownames(mat) = c("kevin", "marry", "jerry")
colnames(mat) = c("first", "second")

weight = c(0.4, 0.6)

mat_final = cbind(mat, mat %*% weight)
colnames(mat_final)[ncol(mat_final)] = "final"
