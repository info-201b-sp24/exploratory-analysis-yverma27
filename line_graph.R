library(ggplot2)
library(dplyr)
library(stringr)

dataset <- read.csv("n_movies.csv")
updated_dataset <- na.omit(dataset)

extracted_year <- str_extract(updated_dataset$year, "(?<=\\()(\\d{4})")

updated_dataset2 <- updated_dataset %>% 
  mutate(release_year = as.integer(extracted_year))

yearly_frequency <- updated_dataset2 %>%
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
  
  