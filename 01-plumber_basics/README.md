# Plumber API Workshop

This project demonstrates how to build a Plumber API in R starting from a basic analysis.

## Setup

Install required packages:

```r
install.packages(c("plumber", "tidyverse", "nycflights13", "echarts4r"))
```

## Run the API

```r
library(plumber)
pr <- plumb("plumber.R")
pr$run(port = 8000)
```

## Endpoints

- `/health`: Basic check
- `/delay_summary?min_distance=1000`: Delay summary by carrier
- `/airport_delays?min_flights=200`: Delay summary by destination airport
- `/daily_volume?origin=JFK`: Daily flight volume
- `/top_destinations?origin=JFK&top_n=5`: Top destination airports
- `/plot_daily_volume?origin=JFK`: Interactive HTML chart

Open [http://localhost:8000/__docs__](http://localhost:8000/__docs__) for live API documentation.