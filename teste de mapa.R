library(tidyverse)
library(leaflet)
library(htmlwidgets)

juntos <- juntos_1_
juntos$media_correta <-   round(juntos$media_correta,digits = 2)

juntos = juntos %>%
  mutate(cor = ifelse(media_correta < 10, "green", "red" ))



 legenda<- paste(sep=" ","Aeroporto:",juntos$AIRPORT,
      "<br>Media de atraso em minutos:",juntos$media_correta) %>% lapply(htmltools::HTML)


juntos %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(~LONGITUDE, ~LATITUDE,
                   color = ~cor,
                  label = ~legenda,
                   clusterOptions = markerClusterOptions() ) -> mapa

saveWidget(file = "EUA.html", widget = mapa)

mapa

