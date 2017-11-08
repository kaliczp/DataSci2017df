## Read in temperature and precipitation data and create a data.frame
Temp<-scan("t.txt")
Prec <- scan("p.txt")
Meteo.df <- data.frame(Precipitation = Prec, Temperature = Temp)
rm(Prec);rm(Temp)
summary(c(1:100,100000)) # summary on vector
summary(Meteo.df)
summary(factor(Meteo.df[,1] > 0,labels =c("NoPrec","Prec")))