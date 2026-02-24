# Exercise 2-5
# Versions of sub and gsub that return the altered string

function r_sub(regexp, replacement, target) {
    sub(regexp, replacement, target)
    return target
}

function r_gsub(regexp, replacement, target) {
    gsub(regexp, replacement, target)
    return target
}

# Test
BEGIN {
    print r_sub(@/a/, "b", "ab") # uses a strongly types regex but this is a gawk feature
    print r_gsub(@/a/, "b", "aba") # here too. I don't know how I can do this without it
}
