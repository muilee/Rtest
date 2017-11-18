table = matrix(1:81, nrow=9);

for (i in seq_len(9)){
    for (j in seq_len(9)){
        table[i, j] = i * j
    }
}
table

table2 = matrix(seq_len(9), nrow=9) %*% matrix(seq_len(9), nrow=1);
table2