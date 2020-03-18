# Process Robert De Niro's movies
# Introduction to R workshop, March 2020

deniro <- read.csv("deniro.csv")

print(summary(deniro))

print(paste("Total movies:", nrow(deniro)))
goods <- deniro$Score > 80
print(paste("Good movies:", sum(goods)))
bads <- deniro$Score < 20
print(paste("Bad movies:", sum(bads)))

# Assign good/okay/bad categories

deniro$Category <- "Okay"
deniro$Category[goods] <- "Good"
deniro$Category[bads] <- "Bad"

# Plot movies over time

library(ggplot2)
print(qplot(Year, Score, color = Category, data = deniro))
ggsave("deniro.pdf")

howmany <- aggregate(Score ~ Category, data = deniro, FUN = length)
print(howmany)

good_movies <- subset(deniro, goods)
write.csv(good_movies, "good_deniro_films.csv")
