install.packages("ggplot2")
install.packages("dplyr")
install.packages("stringr")
install.packages("tidyverese")
data <- read.csv('Downloads/n_movies.csv')

data2 <- na.omit(netflix_data)

library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)

genre_frequency <- data2 %>%
  count(genre, sort = TRUE)

ggplot(data = genre_frequency, aes(x = reorder(genre, n), y = n), fill = x) +
  geom_bar(stat = "identity") +
  labs(title = "Frequency of Different Genres",
       x = "Genre",
       y = "Frequency") +
  theme_minimal()