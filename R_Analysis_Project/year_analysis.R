setwd("/Users/alexeitipenko/Dropbox/Year3/DIGH3814O/FinalProject/R_Analysis_Project")

# give yourself as much memory as you've got
options(java.parameters = "-Xmx5120m")

#install.packages('rJava')
library(rJava)

#install.packages("ggplot2")
library("ggplot2")

#install.packages("scales")
library("scales")

#install.packages("lubridate")
library("lubridate")


document <- read.csv("/Users/alexeitipenko/Dropbox/Year3/DIGH3814O/FinalProject/cleaning/14_Main_Cleaned.csv",
                      col.names=c("Documented_Date", "Event", "Event_Date"),
                      sep=",", quote="",
                      row.names = NULL)


event_dates <- dmy(document$Event_Date) # ymd stands for year, month, date
event_dates
class(event_dates)

bin <- 60 # used for aggregating the data and aligning the labels

dates_frame <- data.frame(event_dates)

p <- ggplot(dates_frame, aes(x=event_dates), inherit.aes = FALSE)
p <- p + geom_histogram(binwidth = bin, colour="white")

#p <- p + scale_x_date(labels = date_format("%Y-%b"))

# from here, format at ease
p <- p + theme_bw() + xlab(NULL)
p

dates <- table(documents$Event_Date)
barplot(dates, main="Event Date Distribution", xlab="Dates", ylab="Frequency")
