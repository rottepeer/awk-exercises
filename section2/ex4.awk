# Exercise 2-4
# This program prints tommorow's date in the dd/mm/yyyy format.
# It also prints the dd mmm yyyy format with the months in text
BEGIN {
    "date -uI --date='tomorrow'" | getline date
    split(date, dt, "-")
    print dt[3] "/" dt[2] "/" dt[1]
    split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", m, " ")
    print dt[3] " " m[int(dt[2])] " " dt[1]
    close("date")
}
