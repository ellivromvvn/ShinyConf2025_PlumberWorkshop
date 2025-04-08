# Load packages
library(tidyverse)
library(nycflights13)

# Filter flights longer than 1000 miles
long_flights <- flights |>
  filter(distance > 1000)

# Average delays by carrier
delay_summary <- long_flights |>
  group_by(carrier) |>
  summarise(
    avg_arr_delay = mean(arr_delay, na.rm = TRUE),
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    n_flights = n(),
    .groups = "drop"
  ) |>
  left_join(airlines, by = "carrier") |>
  arrange(desc(avg_arr_delay))

delay_summary
