# To install d3treeR
#devtools::install_github("gluc/data.tree")
#devtools::install_github("timelyportfolio/d3treeR")

# http://www.buildingwidgets.com/blog/2015/7/22/week-29-d3treer-v2

library(treemap)
library(d3treeR)

data(GNI2014)
tm <- treemap(GNI2014,
        index=c("continent", "country"),
        vSize="population",
        vColor="GNI",
        type="value",
        format.legend = list(scientific = FALSE, big.mark = " "))


d3tree2(tm, rootname = "World" )

# Lab assignment
# install.packages("ggplot2movies")
library(ggplot2movies)
data(movies)
head(movies)
m <- na.omit(movies)

# Design an interactive treemap visualization for the movies dataset
# ?treemap to customize various features such as color
# Can you change the default tooltip?
