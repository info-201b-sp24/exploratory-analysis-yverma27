install.packages("ggplot2")
install.packages("dplyr")
install.packages("stringr")
install.packages("tidyverese")
netflix_data <- read.csv('Downloads/n_movies.csv')

new_data <- na.omit(netflix_data)

library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)

extracted_years <- str_extract(new_data$year,"(?<=\\()(\\d{4})")
print(extracted_years)

updated_netflix_data <- new_data %>%
  mutate(release_year = as.numeric(extracted_years))

votes_per_year <- updated_netflix_data %>%
  group_by(release_year) %>%
  summarise(total_votes = sum(votes, na.rm = TRUE))

final_data <- slice(votes_per_year, 71:83)

ggplot(final_data, aes(x = release_year, y = total_votes, fill = release_year)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Votes of Netflix Shows and Movies Per Year",
       x = "Year",
       y = "Total Votes") +
  theme_minimal() 
