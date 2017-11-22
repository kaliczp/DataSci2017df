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
## plot only the days with precipitation
boxplot(Meteo.df[Meteo.df$WasPrec=="Prec", 1])
boxplot(Meteo.df[Meteo.df$Precipitation > 0, 1])

Meteo.df$Date <- seq(as.Date("1951-01-01"),as.Date("2014-12-31"),"days")
## Plot temperature against Date
plot(Meteo.df$Date,Meteo.df$Temperature, type= "l")
plot(Temperature ~ Date,data=Meteo.df, type="l")

## Monthly temperature
Meteo.df$Month <- format.Date(Meteo.df$Date, format="%m")
boxplot(Temperature ~ Month, data = Meteo.df)
## Construct the precipitation distribution

## xts loading
library(xts)
head(xts(Meteo.df[,-(3:5)], Meteo.df$Date))
Meteo.xts <- xts(Meteo.df[,1:2], Meteo.df$Date)


## Trend line regression
plot(Precipitation ~ Date,data = Meteo.df, typ="l")
abline(lm(Precipitation ~ Date,data = Meteo.df),col=2)

## Regression object and summary
Prec.lm <- lm(Precipitation ~ Date,data = Meteo.df)
summary(Prec.lm)