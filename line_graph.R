library(ggplot2)
library(dplyr)
library(stringr)

options(repos = c(CRAN = "https://cloud.r-project.org"))

dataset <- read.csv("n_movies.csv")
updated_dataset <- na.omit(dataset)

updated_dataset <- updated_dataset %>% 
  mutate(release_year = as.integer(str_extract(year, "(?<=\\()(\\d{4})")))

yearly_frequency <- updated_dataset %>%
  group_by(release_year) %>%
  summarize(frequency = n())

data_viz <- ggplot(yearly_frequency, aes(x = release_year, y = frequency)) +
  geom_line() +
  geom_point() +
  labs(title = "Amount of Content Released on Netflix Each Year",
       x = "Year",
       y = "Number of Content") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(1932, 2024, by = 5))

data_viz

  