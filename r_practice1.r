# R Practice 1
# ctrl + l = clear console

library(tidyverse)
library(ggplot2)
ggplot2()::ggplot()

# create 2D scatter plot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# GRAPHING TEMPLATE 
#   ggplot(data=<DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

#color class
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
# scale by size -- using size for a discrete variable is not advised
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size=class))
#alpha aesthetic which controls the transparency of the points,...
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
#....or the shape of the points -- shape palette can deal w/ max of 6 discrete values
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))
#set aesthetic properties of geom manually
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color="purple")

#EXERCISES:
# 1. Whats gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color="blue"))
# -- because the syntax is incorrect, the "manual" color setting should be outsite aes(), thus,
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color="blue")
# 2. Which variables in mpg are categorical? Continuous? 
?mpg
# -- categorical manufacturer model, trans, drb, fl
# -- continuous: hwy, cty, cyl, year, displ
# 3. Map a continuous variable to color, size and shape. How do these aesthetics behave differently 
# for categorical vs continuous?
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()
ggplot(mpg, aes(x = displ, y = hwy, size = cty)) + geom_point()
# --continuous variable cannot be mapped to a shape
# 4. What happens if you map the same variable to multiple aesthetics?
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) +
  geom_point()
# 5. What does the stroke aesthetic do? What shapes does it work with?
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)

