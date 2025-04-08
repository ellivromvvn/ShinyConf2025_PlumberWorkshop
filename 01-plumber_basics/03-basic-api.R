library(plumber)

#* @apiTitle Basic API
#* @apiDescription Sample API for ShinyConf2025
#* @apiTag Health Health-check

#* Health check
#* @get /health
function() {
  list(status = "ok")
}