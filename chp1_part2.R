# Geometric Objects

# geoms - a geometrical obj that a plot uses to represent data.
# -- people often describe plots by the type of geom that the plot uses.
# -- for example bar charts use bar geoms, line charts use line geoms, boxplot uses
# boxplot geoms, etc. Scatterplots break the trend and use the point geom. 
# -- you can use different geoms to plot the same data. 
# To change the geom in your plot, change the geom function added to ggplot()
 
library(ggplot2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))e