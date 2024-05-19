
library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)

options(repos = c(CRAN = "https://cloud.r-project.org"))

netflix_data <- read.csv("n_movies.csv")

new_data <- na.omit(netflix_data)

extracted_years <- str_extract(new_data$year,"\\d{4}")

updated_netflix_data <- new_data %>%
  mutate(release_year = as.integer(extracted_years),
         votes = as.numeric(gsub(",", "", votes)))

votes_per_year <- updated_netflix_data %>%
  group_by(release_year) %>%
  summarize(total_votes = sum(votes, na.rm = TRUE))

final_data <- slice(votes_per_year, 71:83)

chart_2 <- ggplot(final_data, aes(x = release_year, y = total_votes, fill = factor(release_year))) +
  geom_bar(stat = "identity") +
  labs(title = "Total Votes of Netflix Shows and Movies Per Year",
       x = "Year",
       y = "Total Votes") +
  theme_minimal() 

chart_2
