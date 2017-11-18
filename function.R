match = read.table("/home/matt/R/riii/data/match.txt", header = F, sep="|")

table = matrix(rep(-1, length(levels(match[,1]))^2), nrow=length(levels(match[,1])), 
               dimnames=list(levels(match[,1]), levels(match[,1])))

for(i in 1:nrow(match)){
    table[match[i,"V1"], match[i,"V2"]] = match[i, "V3"]
}


class(match[1,3])