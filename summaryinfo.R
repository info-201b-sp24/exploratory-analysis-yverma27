
library(dplyr)
library(stringr)
library(ggplot2)
library(tidyverse)

data <- read.csv("n_movies.csv")

summary_info <- list(
  num_observations = nrow(data),
  avg_rating = mean(data$rating, na.rm = TRUE),
  max_rating = max(data$rating, na.rm = TRUE),
  min_rating = min(data$rating, na.rm = TRUE),
  num_unique_titles = length(unique(data$title))
)

summary_info

