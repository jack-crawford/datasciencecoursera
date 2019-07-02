dataFile = read.csv("hw1_data.csv", header=TRUE);
dataFile
#head(dataFile);
#tail(dataFile);

sum(is.na(dataFile$Ozone))
colMeans(dataFile, na.rm = TRUE)
colMeans(subset(dataFile, (Ozone>31&Temp>90)), na.rm = TRUE)
apply(subset(dataFile, Month==5&!is.na(Ozone)), 2, max)

      