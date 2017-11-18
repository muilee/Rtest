heights = c(180, 169, 173)
weights = c(73, 87, 43)
BMIs = weights / (heights / 100) ^ 2
names(BMIs) = c("Brian", "Toby", "Sherry")
BMIs[BMIs < 18.5 | BMIs >= 24]
