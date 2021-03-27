library(tidyverse)

download.file("https://ndownloader.figshare.com/files/22031487",
              "data/books.csv", mode = "wb")
books <- read.csv("./data/books.csv")

books <- rename(books,
                title = X245.ab)

books <- rename(books,
                author = X245.c,
                callnumber = CALL...BIBLIO.,
                isbn = ISN,
                pubyear = X008.Date.One,
                subCollection = BCODE1,
                format = BCODE2,
                location = LOCATION,
                tot_chkout = TOT.CHKOUT,
                loutdate = LOUTDATE,
                subject = SUBJECT)
books

books_only <- books%>%
  filter(format == 'a')

checked_out <- books%>%
  filter(format == 'a', tot_chkout>0)

download.file(url="https://ndownloader.figshare.com/files/2292169", 
              destfile = "portal_data_joined.csv")

surveys <- read.csv("portal_data_joined.csv") 
head(surveys)


ggplot(data=surveys, aes(hindfoot_length)) + 
  geom_histogram()

plot_1 <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) 
plot_1 + geom_point() 

install.packages('hexbin')

surveys_complete <- surveys%>%
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

library(ggplot2)

x <- c(seq(1,10))

y1 <- c(0,0,0,1,1,3,4,5,7,8)
y2 <- c(0,0,0,1,1,1,2,2,3,3)

df <- as.data.frame(cbind(x,y1,y2))
cutoff <- data.frame(x = c(-Inf,Inf), y=6, cutoff = factor(6))

p <- ggplot()+
  geom_line(data = df, aes(x=x, y=y1), color = 'blue',lwd=2)+
  geom_line(data = df, aes(x=x, y=y2), color = 'red',lwd=2)+
  geom_line(aes(x,y),cutoff)+
  theme_tufte()+
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank())
p
