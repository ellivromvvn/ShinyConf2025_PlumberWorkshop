library(tidyverse)
library(nycflights13)
library(echarts4r)

# 1. Delay by carrier
get_delay_summary <- function(min_distance = 500) {
  flights |>
    dplyr::filter(distance > min_distance) |>
    dplyr::group_by(carrier) |>
    dplyr::summarise(
      avg_arr_delay = mean(arr_delay, na.rm = TRUE),
      avg_dep_delay = mean(dep_delay, na.rm = TRUE),
      n_flights = dplyr::n(),
      .groups = "drop"
    ) |>
    dplyr::left_join(airlines, by = "carrier") |>
    dplyr::arrange(desc(avg_arr_delay))
}
