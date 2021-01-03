library(plotly)
#scatter plot with color as factor
plot_ly(mtcars, x= mtcars$wt, y = mtcars$mpg, mode = "markers", color = as.factor(mtcars$cyl))

#with continuous color pallete
plot_ly(mtcars, x= mtcars$wt, y = mtcars$mpg, mode = "markers", color = mtcars$disp)

#size ofpoints vary 
plot_ly(mtcars, x= mtcars$wt, y = mtcars$mpg, mode = "markers", color = as.factor(mtcars$cyl) , size = mtcars$hp)

#3d scatterplots
set.seed(11111)
temp <- rnorm(100, mean = 30 , sd= 5)
pressure <- rnorm(100)
dtime <- 1:100
plot_ly(x = temp, y = pressure, z = dtime , type = "scatter3d",mode = "markers", color = temp)


##line graphs
data("airmiles")
plot_ly(x = time(airmiles), y= airmiles)


##multilien graph
library(plotly)
library(dplyr)
library(tidyr)
data("EuStockMarkets")

stocks<- as.data.frame(EuStockMarkets) %>% gather(index,price) %>% mutate(time = rep(time(EuStockMarkets),4))

plot_ly( stocks ,  x= stocks$time, y = stocks$price, color = stocks$index)

#histogram
plot_ly(x=precip, type ="histogram")

#boxplot
plot_ly(iris, y= iris$Petal.Length , color = iris$Species, type ="box")

#heatmap
terrain1 <- matrix(rnorm(100*100), nrow = 100, ncol = 100)
plot_ly(z = terrain1 , type="heatmap")

#3dSurface
terrain1 <- matrix(rnorm(100*100), nrow = 100, ncol = 100)
plot_ly(z = terrain1 , type="surface")


#Choropleth Maps
state_pop <- data.frame(State= state.abb, Pop= as.vector(state.x77[,1]))
state_pop$hover <- with (state_pop,paste (State,'<br>',"Population:",Pop))
borders <- list(color = toRGB("red"))
map_options <- list(scope='usa',projection=list(type='albers usa'), snowlakes=TRUE,lakecolor=toRGB("white"))
plot_ly(state_pop, z= state_pop$Pop, text = state_pop$hover, locations = state_pop$State, type = "choropleth" ,locationmode="USA-states",
        color=state_pop$Pop, colors = 'Blues', marker = list(line =borders)) %>% 
    layout(title ="US Population in 1975" , geo = map_options )


##ggplotly(ggplotobject) for making ggplot as interactive







