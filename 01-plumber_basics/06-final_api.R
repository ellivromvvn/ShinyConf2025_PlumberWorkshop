library(plumber)
library(tidyverse)
library(nycflights13)
source("analysis.R")

#* @apiTitle NYC Flights API
#* @apiDescription Sample API for ShinyConf2025
#* @apiTag Health Health-check endpoints
#* @apiTag Analysis Analysis endpoints analysis/
#* @apiTag Plots Plotting endpoints plots/

#* Health check
#* @get /health
#* @tag Health
function() {
  list(status = "ok")
}

#* Average delay per carrier
#* @param min_distance Minimum flight distance (default 500)
#* @get /analysis/delay_summary
#* @tag Analysis
function(min_distance = 500) {
  get_delay_summary(as.numeric(min_distance))
}

#* Average arrival delay by destination airport
#* @param min_flights Minimum number of flights to include airport (default 200)
#* @get /analysis/airport_delays
#* @tag Analysis
function(min_flights = 200) {
  get_airport_delays(as.numeric(min_flights))
}

#* Daily flight volume, optionally filtered by origin
#* @param origin Filter by origin airport code (e.g., JFK, LGA, EWR)
#* @get /analysis/daily_volume
#* @tag Analysis
function(origin = NULL) {
  if (origin == "NULL") origin <- NULL
  get_daily_volume(origin)
}

#* Top N destinations from a given origin
#* @param origin Origin airport code (e.g., JFK)
#* @param top_n Number of destinations to return (default 5)
#* @get /analysis/top_destinations
#* @tag Analysis
function(origin = "JFK", top_n = 5) {
  get_top_destinations(origin, as.numeric(top_n))
}

#* Plot daily flight volume (interactive ECharts)
#* @param origin Origin airport (optional)
#* @serializer htmlwidget
#* @get /plots/daily_volume
#* @tag Plots
function(origin = NULL) {
  if (origin == "NULL") origin <- NULL
  plot_daily_volume(origin)
}