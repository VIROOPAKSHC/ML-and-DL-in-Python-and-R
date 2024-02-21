file_location <- "C:\\Users\\kabali\\Downloads\\Data Files\\1. ST Academy - Crash course and Regression files\\House_Price.csv"

df <- read.csv(file_location,header=T)

View(df)
str(df)

summary(df)
hist(df$crime_rate)

pairs(~price+crime_rate+n_hos_beds+rainfall,data=df)

barplot(table(df$airport))
barplot(table(df$waterbody))
barplot(table(df$bus_ter))

#1. Missing values in n_hos_beds
#2. Skewness or outliers in crime_rate
#3. Outliers in n_hot_rooms and rainfall
#4. Bus_ter has only Yes values

quantile(df$n_hot_rooms,0.99)
uv <- 3*quantile(df$n_hot_rooms,0.99)
df$n_hot_rooms[df$n_hot_rooms>uv] <- uv

summary(df$n_hot_rooms)
lv <- 0.3 * quantile(df$rainfall, 0.01)
df$rainfall[df$rainfall < lv] <- lv
summary(df$rainfall)

sapply(df,mean)
mean(df$n_hos_beds)
mean(df$n_hos_beds,na.rm=T)
which(is.na(df$n_hos_beds))

df$n_hos_beds[is.na(df$n_hos_beds)] <- mean(df$n_hos_beds,na.rm=T)
which(is.na(df$n_hos_beds))
mean(df$n_hos_beds)

