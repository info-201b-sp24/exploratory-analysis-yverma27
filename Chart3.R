
library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)

options(repos = c(CRAN = "https://cloud.r-project.org"))

data <- read.csv("n_movies.csv")

data2 <- na.omit(data)

genre_frequency <- data2 %>%
  count(genre, sort = TRUE)

chart_3 <- ggplot(data = genre_frequency, aes(x = reorder(genre, n), y = n), fill = x) +
  geom_bar(stat = "identity") +
  labs(title = "Frequency of Different Genres",
       x = "Genre",
       y = "Frequency") +
  theme_minimal()

chart_3
