{ line[NR] = $0 }
END {
    if (n > NR)
        n = NR # prevents the printing of empty lines when n > NR
    for (i = NR; i > NR-n; i--) print line[i]
}
