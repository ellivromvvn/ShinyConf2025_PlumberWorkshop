source("dependencies.R")
source("auth_helper.R")
source("analysis.R")

#* @apiTitle NYC Flights API

#* Health check
#* @get /health
function() {
  list(status = "ok")
}

#* Average delay per carrier
#* @param min_distance Minimum flight distance (default 500)
#* @get /delay_summary
function(
  res,
  req,
  min_distance = 500
) {
  auth_helper(
    res,
    req,
    get_delay_summary,
    min_distance = as.numeric(min_distance)
  )
}