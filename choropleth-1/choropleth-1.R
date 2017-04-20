library("maps")
library("ggplot2")
library("mapproj")

setwd("/Users/yinterian/teaching/data-vis/github/data-vis/lab-geo/choropleth-1")

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
crimesm <- reshape2::melt(crimes, id = 1)
# See http://ggplot2.tidyverse.org/reference/map_data.html for details
states <- map_data("state")

arrests <- USArrests
names(arrests) <- tolower(names(arrests))
arrests$region <- tolower(rownames(USArrests))

choro <- merge(states, arrests, sort = FALSE, by = "region")
choro <- choro[order(choro$order), ]
ggplot(choro, aes(long, lat)) +
  geom_polygon(aes(group = group, fill = assault)) +
  coord_map("albers",  at0 = 45.5, lat1 = 29.5)

