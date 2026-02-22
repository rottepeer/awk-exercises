# Solution to Exercise 2-1
# In this version, the number of lines that are printed is a parameter
# Usage: awk -f ex1.awk -v n=[number of line] [input file name]
{ line[NR] = $0 }
END {
    if (n > NR)
        n = NR
	for (i = 1; i<=n; i++) print line[i]
	print "..."
	for (i = NR-(n-1); i<=NR; i++) print line[i]
}
