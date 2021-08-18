## R Visualizations
#install.packages("tidyverse")
library(tidyverse)

mpg
?mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
