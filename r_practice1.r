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
  ?geom_point
  vignette("ggplot2-specs")

  
# FACETS : one way to add additional variables is with aesthetics. Another technique,
# useful for categorical variables, is to split your plot into 
# facets - subplots that each display one subset of the data. 
  
### To facet your plot by a single variable, use facet_wrap()
  # -- the first argument should be a formula, created with ~ followed by a variable name
  #    (of a data structure in R)
  # -- the variable that you pass should be discrete 
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow=2)

### To facet your plot on the combination of two variable, add facet_grid()
  # -- the first argument is also a formula, containing two variables separated by a ~
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy )) +
  facet_grid(drv ~ cyl)


# EXERCISES:
# I. What happens in you facet on a continuous variable? 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(. ~ cty)
# -- it converts the continuous variable to a factor and creates facets for all,
# unique values of it.
# II. What do the empty cells in a plot with face_grid(drv ~ cyl) mean?
# -- they are the cells in which there are no values of the combination of drv and cyl 
# How do they relate to this plot? 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y =cyl))
# The locations in the above plot without points are the same cells 
# in facet_grid(drv ~ cyl) that have no points.
# III. What plots does the following code make? What does . do?
# The symbol . ignores that dimension for faceting. This plot facets by values
# of drv on the y-axis:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
# This plot facets by values of cyl on the x-axis:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# IV. Take the first faceted plot in this section:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
#What are the advantages to using faceting instead of the colour
# aesthetic? What are the disadvantages? How might the balance 
# change if you had a larger dataset?
# This is what the plot looks like when class is represented by
# the colour the color aesthetic instead of faceting.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# Advantages of encoding class with facets instead of color include the ability 
# to encode more distinct categories. Given human visual perception, the max number of colors
# to use when encoding unordered categorical(qualitative) data is nine, and in practice,
# often much less than that. When placing points in different categories in different scales,
# makes it difficult to directly compare values of individual points in different 
# categories, it can make it easier to compare pattern b/w categories. 

# Disadvantages of encoding class w/ facets instead of color are that different w/
# different class is that the points for each category are on different plots, making
# it more difficult to directly compare the locations of individual points. Using the same
# x- and y- scales for all facets lessens this disadvantage. Since encoding class within color
# also places all points on the same plot, it visualizes the unconditional relationship b/w
# the x and y variables; with facets. the unconditional relationship is no longer visualized 
# since the points are spread across multiple plots.

# The benefits encoding a variable through facetting over color become more advantageous
# as either # of points or the # of categories increase. In the former, as the # of points increase,
# there is likely to be more overlap. 

# It is difficult to handle overlapping points with color. Jittering will work with color,
# but jittering will only work well if there are few points and the classes do not overlap much.
# Otherwise the colors of areas will no longer be distinct and 