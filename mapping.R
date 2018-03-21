library(ggmap)
library(tidyverse)

# simple mapping with ggmap

# get a water map for Bude
gc <- geocode("Bude")
map_water <- get_map(gc, source="stamen", maptype = "watercolor",zoom=14)
ggmap(map_water) 
# get a road map for Bude
map_road <- get_map(gc, source="google", maptype = "roadmap",zoom=14)
ggmap(map_road)

#mark points for crooklets Beach and Summerleaze Beach on watermap 
gc1 <- geocode("Crooklets Beach, Bude")
gc2 <- geocode("Summerleaze Beach, Bude")
gc3 <- geocode("Cricket-bude, Bude")
gc4 <- geocode("The Heron, Bude") 
gc_combine <- rbind(gc1, gc2, gc3, gc4)
ggmap(map_water) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc_combine, color = "red", size = 3
  )

#mark points for crooklets Beach and Summerleaze Beach on roadmap
ggmap(map_road) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc_combine, color = "red", size = 3
  )

from <- "Cricket-bude, Bude"
to <- "The Heron, Bude"
route_df <- route(from, to, structure = "route")
ggmap(map_road) +
  geom_path(
    aes(x = lon, y = lat), color = "red", size = 1.5,
    data = route_df, lineend = "round"
    )


