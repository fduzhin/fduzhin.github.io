head(cars)
?cars

library(ggplot2)
setwd("C://Users//fduzhin//Dropbox//Outreach Fedor//Singapore Poly - regression")

flats <- read.csv("reflections.csv")
rawFloorArea <- as.character(flats$Floor.Area)
flats$Area <- as.numeric(regmatches(rawFloorArea,regexpr("[0-9]+",rawFloorArea)))
head(flats)
flats <- flats[flats$Area<3000,]

ggplot(data=flats,aes(x=Area,y=Rent)) +
        geom_point() + geom_smooth(method=lm)

head(mtcars)
nrow(mtcars)
?mtcars

qplot(data=mtcars,x=disp,y=mpg)

students <- read.csv("ode_students.csv",na.strings = "ABS")
qplot(data=students,x=Project,y=Exam)
head(students)
min(students$Exam,na.rm = TRUE)
class(students$Exam)

library(scatterplot3d)
?scatterplot3d

attach(students)
scatterplot3d(x=Quizzes,y=Project,z=Exam,
              color="blue", pch=19, # filled blue circles
              type="h")
detach(students)

head(diamonds)
unique(diamonds$color)
qplot(data=diamonds[diamonds$clarity=="IF"&diamonds$color=="G",],x=carat,y=price)


library(HistData)

data(GaltonFamilies)
attach(GaltonFamilies)
colGender <- as.character(GaltonFamilies$gender)
colGender[colGender=="female"] <- "pink"
colGender[colGender=="male"] <- "blue"
scatterplot3d(x=father,y=mother,z=childHeight,
              color=colGender, pch=19, # filled blue circles
              type="h")
detach(GaltonFamilies)

set.seed(14)
error <- rnorm(20)
ohm <- data.frame(voltage=seq(from=100,to=100+19*5,by=5))
ohm$current <- ohm$voltage*7.5+40*error

ggplot(ohm, aes(x=voltage, y=current))+
        geom_point() + stat_function(fun = function(x) 7.5*x, colour="blue")

#### Below is the chocolate data but it doesn't really work

library(XML)
theurl <- "http://en.wikipedia.org/wiki/List_of_countries_by_Nobel_laureates_per_capita"
tables <- readHTMLTable(theurl)

nobel_prizes <- tables[[2]]
# Clean column names
colnames(nobel_prizes) <- 
        gsub(" ", "_", 
             gsub("(/|\\[[0-9]+\\])", "", 
                  gsub("\n", " ", colnames(nobel_prizes))
             )
        )

# Delete those that aren't countries and thus lack rank
nobel_prizes$Rank <- as.numeric(as.character(nobel_prizes$Rank))
nobel_prizes <- subset(nobel_prizes, is.na(Rank) == FALSE)

# Clean the country names
nobel_prizes$Country <- 
        gsub("[^a-zA-Z ]", "", nobel_prizes$Country)

# Clean the loriates variable
nobel_prizes$Laureates_10_million <- 
        as.numeric(as.character(nobel_prizes$Laureates_10_million))