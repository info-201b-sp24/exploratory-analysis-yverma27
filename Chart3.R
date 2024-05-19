
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)

movies <- read.csv("n_movies.csv")

movies <- movies %>% 
  separate_rows(genre, sep = ",\\s*")

movies <- na.omit(movies)

movies$extracted_genre <- word(movies$genre, 1)

genre_count <- movies %>%
  group_by(extracted_genre) %>%
  summarize(frequency = n()) %>%
  arrange(desc(frequency))

# Create the bar graph
ggplot(genre_count, aes(x = reorder(extracted_genre, -frequency), y = frequency)) +
  geom_bar(stat = "identity") +
  labs(title = "Frequency of Movies by Genre",
       x = "Genre",
       y = "Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  scale_y_continuous(breaks = seq(0, max(genre_count$frequency), by = 500))