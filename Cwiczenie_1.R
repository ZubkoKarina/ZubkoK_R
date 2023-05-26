c <- seq(0, 10, by = 2)
c

m <- matrix(c, 6, 6)
m

m <- matrix("K", 5, 5)
m

m[2:4, 2:4] <- "Z"
m

write.csv(students, "Zubko.csv", sep = ";")

students <- read.csv("Zubko.csv", sep = ";")
students

students <- rename(students, "Surname" = "Last_name")
students

my_data <- data.frame("First_name" = "Lola", "Last_name" = "Lolaae", "Age" = 25, "Index" = 6)
students <- rbind(students, my_data)
students

students <- mutate(students, Email = tolower(paste0(`First_name`, "@ujd.edu.pl")))
students

students <- arrange(students, desc(Age))
students

