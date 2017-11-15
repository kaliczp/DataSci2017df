## Read in temperature and precipitation data and create a data.frame
Temp<-scan("t.txt")
Prec <- scan("p.txt")
Meteo.df <- data.frame(Precipitation = Prec, Temperature = Temp)
rm(Prec);rm(Temp)
summary(c(1:100,100000)) # summary on vector
summary(Meteo.df)
summary(factor(Meteo.df[,1] > 0,labels =c("NoPrec","Prec")))
Meteo.df$WasPrec <- factor(Meteo.df[,1] > 0,labels =c("NoPrec","Prec"))
## Boxplot of temp with different df indexing
boxplot(Meteo.df[,2])
boxplot(Meteo.df[,"Temperature"])
boxplot(Meteo.df$Temperature)

## Modify boxplot
boxplot(Meteo.df$Temperature, ylim=c(-30,30), col="red")

## Boxplot of Precipitation
boxplot(Meteo.df$Precipitation)
boxplot(Meteo.df[,1])
