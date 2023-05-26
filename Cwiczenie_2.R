setwd('/home/karina/Загрузки') 
getwd() 

data <- read.csv("tabl_2021.csv" ) 
names(data) <- c("Age", "Number_of_survivors_(lx)", "Probability_of_death_(qx)", "Number_of_dead_(dx)","Stationary_population_(Lx)", "Cumulative_stationary_population_(Tx)","Average_life_expectancy_(ex)") 

install.packages("readr") 
library(readr) 

install.packages("dplyr") 

names(data) <- gsub("[()]", "", names(data)) 
names(data) <- gsub("[_]", "", names(data)) 
names(data) <- c("Age", "Survivors", "DeathProb", "Dead", "StationPop", "CumulStatPop", "LifeExpect") 

data <- data %>% 
	mutate( 
    	Age = as.numeric(Age), 
    	Survivors = parse_number(Survivors, locale = locale(decimal_mark = ",", grouping_mark = ".")), 
    	DeathProb = parse_number(DeathProb, locale = locale(decimal_mark = ",", grouping_mark = ".")), 
    	Dead = as.numeric(Dead), 
    	StationPop = parse_number(StationPop, locale = locale(decimal_mark = ",", grouping_mark = ".")), 
    	CumulStatPop = parse_number(CumulStatPop, locale = locale(decimal_mark = ",", grouping_mark = ".")), 
    	LifeExpect = parse_number(LifeExpect, locale = locale(decimal_mark = ",", grouping_mark = ".")) 
	) 


head(data) 

install.packages("ggplot2") 
library(ggplot2) 

p <- ggplot(data, aes(x = Age, y = DeathProb)) + 
	geom_line(color = "blue") + 
	geom_point(color = "red") + 
	xlab("Возраст") + 
	ylab("Вероятность смерти") + 
	theme_minimal() 

print(p)

