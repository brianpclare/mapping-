library(ggmap)
library(tidyverse)

# simple mapping with ggmap

# get a water map for Bude
#gc <- geocode("Bude")
gc <- c(-4.543678,50.82664)
map_water <- get_map(gc, source="stamen", maptype = "watercolor",zoom=14)
ggmap(map_water) 
# get a road map for Bude
map_road <- get_map(gc, source="google", maptype = "roadmap",zoom=14)
ggmap(map_road)

#mark points for crooklets Beach, Summerleaze Beach, cricket-Bude and THe Heron on watermap 
#gc1 <- geocode("Crooklets Beach, Bude")
#gc2 <- geocode("Summerleaze Beach, Bude, UK")
#gc3 <- geocode("Bude North Cornwall Cricket Club, Bude, UK")
#gc4 <- geocode("The Barrel at Bude") 

lon <- c(-4.553962,-4.551349,-4.552814,-4.543023)
lat <- c(50.83587,50.83054,50.83347,50.83007)


df <- data.frame("lon" = lon, "lat" = lat)

ggmap(map_water) +
  geom_point(
    aes(x = df$lon, y = df$lat),
    data = df, color = "red", size = 3
  )

#mark points for crooklets Beach,Summerleaze Beach,cricket-Bude, crooklets Inn and shortest distance on roadmap

from <- "Bude North Cornwall Cricket Club"
to <- "The Barrel at Bude"
route_df <- route(from, to, mode="walking", structure = "route")
ggmap(map_road) +
  geom_path(
    aes(x = lon, y = lat), color = "red", size = 1.5,
    data = route_df, lineend = "round")+
  geom_point(aes(x=df$lon, y=df$lat),
             data=df, color = "red", size=2)


