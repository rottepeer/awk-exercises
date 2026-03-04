# Solution to exercise 3-1
# Basic wc clone
# Usage: awk -f ex1.awk file1 file2 file3

NR==FNR {
    prev_fn = FILENAME
    nr = 1 # keeps track of the number of rows already read
}
{
    if (FILENAME != prev_fn) {
        print NR - nr, nw, nc, prev_fn # print NR - nr to get the actual number of rows
        prev_fn = FILENAME
        nc = 0
        nw = 0
        nr = NR - 1 # save how many rows have already been read
                    # -1 because when this is executed, we have already read 1 line of the new file
    }
    nc += length($0) + 1
    nw += NF
}
END {
    print NR - nr, nw, nc, FILENAME
}
