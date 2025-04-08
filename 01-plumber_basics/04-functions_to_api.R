library(plumber)
library(tidyverse)
library(nycflights13)
source("analysis.R")

#* @apiTitle NYC Flights API
#* @apiDescription Sample API for ShinyConf2025
#* @apiTag Health Health-check
#* @apiTag Analysis

#* Health check
#* @get /health
#* @tag Health
function() {
  list(status = "ok")
}

#* Average delay per carrier
#* @param min_distance Minimum flight distance (default 500)
#* @get /delay_summary
#* @tag Analysis
function(min_distance = 500) {
  get_delay_summary(as.numeric(min_distance))
}
