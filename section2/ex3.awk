# Exercise 3-2
# Adds parameters to the "multi-column printer" program
# width sets the wdth of the columns
# columns sets the number of columns
# indicate crops the string if it is to long and adds a tilde to indicate it has been shortened
# ellipsis splits the string in two if it is to long and adds ellipses in the middle to indicate it has been shortened
# Example usage: cat names | awk -f ex3.awk -v columns=6 -v width=9 -v ellipses=y

{
    fmt = sprintf("%%s%%-%d.%ds  ", width, width) # Make a format string with the custom width
    str = $0
    if (indicate == "y")
        if (length($0) > width)
            str = substr(str, 1, width-1) "~" # If the string is to long, shorten it and add a tilde to show it is shortend
    if (ellipses == "y")
        if (length($0) > width)
            str = substr(str, 1, int(((width - 3) / 2) + 0.5)) "..." substr(str, length($0) - int(((width - 3) / 2) - 0.5), length($0)) # If the string is too long, split in two and add "..."
    out = sprintf(fmt, out, str)
    if (++n >= columns) {
        print substr(out, 1, length(out)-2)
        out = ""
        n = 0
    }
}

END {
    if (n > 0)
        print substr(out, 1, length(out)-2)
}
