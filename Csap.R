dec <- scan("2014dec.txt",character())
dec <- as.numeric(dec)
dec[is.na(dec)] <- 0
nov <- scan(file="2014nov.txt",comment.char = "#",na.strings = '-')
maradek2014 <-scan("2014janokt.txt")
m51tol <- scan("p1951_2013.txt")
p <- c(m51tol, maradek2014, nov, dec)
Sys.Date()
precdate <- seq(as.Date("1951-01-01"),as.Date("2014-12-31"),by="days")
plot(precdate,p,typ="h")
library(xts)
p.xts <- xts(p,precdate)
plot(p.xts)
plot(p.xts['2014'],typ="h")
plot(p.xts['2013/2014'],typ="h")
plot(p.xts['2014-06-01/2014-07-30'],typ="h")
