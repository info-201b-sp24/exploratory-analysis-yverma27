library(ggplot2)
library(dplyr)
library(knitr)

dataset <- read.csv("n_movies.csv")
updated_dataset <- na.omit(dataset)

arranged_data <- updated_dataset %>% 
  arrange(desc(rating))

arranged_data

selected_data <- arranged_data %>% 
  select(title, year, certificate, genre, rating, votes) %>% 
  head(10)

kable(selected_data, caption = "Top 10 Movies by Rating")