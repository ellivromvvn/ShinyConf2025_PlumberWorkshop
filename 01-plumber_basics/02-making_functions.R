# Find everything you can ask a user for
# Well, that's a parameter

# 1. Delay by carrier
get_delay_summary <- function(min_distance = 500) {
  flights |>
    filter(distance > min_distance) |>
    group_by(carrier) |>
    summarise(
      avg_arr_delay = mean(arr_delay, na.rm = TRUE),
      avg_dep_delay = mean(dep_delay, na.rm = TRUE),
      n_flights = n(),
      .groups = "drop"
    ) |>
    left_join(airlines, by = "carrier") |>
    arrange(desc(avg_arr_delay))
}