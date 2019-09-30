##********************************************************
##  ---- Ejemplo de como usar el nuevo gganamite()   -----
##********************************************************


#Link ejemplo: https://robjhyndman.com/hyndsight/ftsviz/
#Link gganimate/github: https://github.com/thomasp85/gganimate


#_____________________
### 1.- Librerias ----
#_____________________
library(tidyverse)
library(demography)

#install.packages(c("transformr", "devtools"))
#devtools::install_github("thomasp85/gganimate")
library(gganimate)


#_______________________________________________
### 2.- Base de datos (libreria demography) ----
#_______________________________________________

frmort <- set.upperage(fr.mort, 100)
# Create tibble
frmort <- tibble(
  year = rep(frmort$year, rep(length(frmort$age), length(frmort$year))),
  age = rep(frmort$age, length(frmort$year)),
  female = c(frmort$rate$female),
  male = c(frmort$rate$male)) %>%
  gather(male, female, key = "sex", value = "mortrate")

head(frmort)

#_____________________________
## 3.- Gráfico en ggplot2 ----
#_____________________________

#Gráfico original en ggplot2
frmort %>%
  ggplot(aes(x = age, y = mortrate, group = year, col = year)) +
  geom_line() +
  facet_grid(~sex) +
  scale_y_log10() +
  xlab("Age") + ylab("Log mortality") +
  scale_color_gradientn(colours = rainbow(10))

#_______________________________
## 4.- ggplot2 + gganimate  ----
#_______________________________

#se debe guardar en un objeto en R, para despues crear el archivo en el pc
(p <- frmort %>%
  filter(year > 1900) %>%
  ggplot(aes(x = age, y = mortrate, group = year, col = year)) +
  geom_line() +
  xlab("Age") + ylab("Log mortality") +
  facet_grid(~sex) +
  scale_y_log10() +
  scale_color_gradientn(colours = rainbow(10)) +
  #gganimet code
  transition_time(year) +
  ease_aes('linear') +
  shadow_mark(colour = "grey70") +
  labs(title = 'Year: {frame_time}')
)

#guardar GIF
anim_save("C:/Users/aguzman/Desktop/ejemplo.gif", p,  width = 1000, height = 500)
