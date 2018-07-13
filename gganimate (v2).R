##
##  gganimate
##

#https://github.com/thomasp85/gganimate
#https://www.data-imaginist.com/slides/user2018/assets/player/keynotedhtmlplayer#0


library(ggplot2)

#install.packages('devtools')
#devtools::install_github('thomasp85/gganimate')
library(gganimate)

head(mtcars)
str(mtcars)

#1
ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  transition_manual(gear)

#2
ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 1) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

#3
ggplot(mtcars, aes(factor(cyl), mpg, fill=factor(cyl))) + 
  geom_boxplot(outlier.colour = NA) +
  geom_jitter(shape=21, alpha=.5, size=5, colour="black")+
  theme_minimal()+
  theme(legend.position = "none")+
  # Here comes the gganimate code
  labs(title = 'GEAR',
       subtitle = "Agregar subtitulo",
       x = 'cyl', 
       y = 'mgp2') +
  transition_states(
    gear,
    transition_length = 2,
    state_length = 3) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

#3b
ggplot(mtcars, aes(factor(cyl), mpg, fill=factor(cyl))) + 
  geom_boxplot(outlier.colour = NA) +
  geom_jitter(shape=21, alpha=.5, size=5, colour="black")+
  theme_minimal()+
  theme(legend.position = "none")+
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 3) +
  labs(title = 'Fuel consumption for {closest_state} gears',
       subtitle = "Agregar subtitulo",
       x = 'cyl', 
       y = 'mgp2') +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

#3c
ggplot(mtcars, aes(factor(cyl), mpg, fill=factor(cyl))) + 
  geom_boxplot(outlier.colour = NA) +
  theme_minimal()+
  theme(legend.position = "none")+
  # Here comes the gganimate code
  transition_states(gear,
    transition_length = 2,
    state_length = 3) +
  labs(title = 'Fuel consumption for {closest_state} gears',
       subtitle = "Agregar subtitulo",
       x = 'cyl', 
       y = 'mgp2') +
  enter_manual(function(x) {
    x$x <- x$x + 3
    x$xmin <- x$xmin + 3
    x$xmax <- x$xmax + 3
    x
  }) + 
  exit_fade() +
  ease_aes('sine-in-out')




#4 ransition_time
library(gapminder)
str(gapminder)

# 1
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, colour=country)) +
  geom_point(alpha=.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(title= "Year: {frame_time}",
       subtitle= "Agregar subtitulo",
       x="GDP per capita",
       y="life expectancy") +
  transition_time(year) +
  ease_aes("linear")

# 2 shadow_
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, colour=country)) +
  geom_point(show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(title= "Year: {frame_time}",
       subtitle= "Agregar subtitulo",
       x="GDP per capita",
       y="life expectancy") +
  transition_time(year) +
  ease_aes("linear") +
  shadow_wake(0.15, wrap = FALSE)

ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, colour=country)) +
  geom_point(show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(title= "Year: {frame_time}",
       subtitle= "Agregar subtitulo",
       x="GDP per capita",
       y="life expectancy") +
  transition_time(year) +
  ease_aes("linear") +
  shadow_trail()


ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, colour=country)) +
  geom_point(show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(title= "Year: {frame_time}",
       subtitle= "Agregar subtitulo",
       x="GDP per capita",
       y="life expectancy") +
  transition_time(year) +
  ease_aes("linear") +
  shadow_mark()





ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

