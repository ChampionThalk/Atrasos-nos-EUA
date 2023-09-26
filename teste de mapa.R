library(tidyverse)
library(leaflet)
library(htmlwidgets)

juntos <- atrasos

juntos = juntos %>%
  mutate(cor = ifelse(media_correta < 10, "green", "red" ))


juntos %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(~LONGITUDE, ~LATITUDE,
                   color = ~cor,
                   clusterOptions = markerClusterOptions()) -> mapa

saveWidget(file = "EUA.html", widget = mapa)

