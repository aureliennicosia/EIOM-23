# title: "Visualisation"
# author: "Aurelien Nicosia"
# date: "Fevrier 2023"

# ---- Base de donn?es ----

# on a utiliser la de donn?es Dataset

library(readr)
library(dplyr)

dat <- read_delim("Dataset 1.csv", ",", escape_double = FALSE, 
                  trim_ws = TRUE) %>% sample_n(1000)

# ---- Construction de graphique ----

library(ggplot2)

# data
p <- ggplot(data = dat)
p

#2e etape:  aesthetic
p <- ggplot(data = dat, aes(x = ANNUAL_KM, y = AGE)) # les noms de variables sont mis 'brut', si vous avez des espaces dans le nom de la variable, il faut le mettre en un guillement inversé
p

# geom
p + geom_point()

# ajout couleur
p + geom_point(aes(color = GENDER)) # on aurait pu le mettre directement dans le aes() de la fonction ggplot(.)

# ajout transparence


p + geom_point(aes(color = GENDER, alpha = COMMUTE_DISTANCE)) # la transparence des points est géré par 'alpha'


# ajout de la taille des points

p + geom_point(aes(color = GENDER, size = COMMUTE_DISTANCE))  # la taille des points est géré par 'size'



# ajout titre et sous titre
p <- ggplot(data = dat, aes(x = ANNUAL_KM, y = AGE))+
      geom_point()+ # ajout de point
      labs(title = 'Mon titre', subtitle = 'sous-titre')+ # ajout de titre et sous-titre
      xlab("nombre de km annuel")+ ylab("Age du conducteur")
p

# on decoupe selon les saisons facet_grid(x ~ y) : decouper le graph en x ligne et y colonnes

p + facet_grid(SEASON~.) # le point (.) signifie "rien", on découpe pas selon la variable avec le point

p + facet_grid(.~SEASON) 

# si facet_grid(x ~ .) ca découpe en ligne par x
# si facet_grid( . ~ y) ca découpe en colonne par y



# on decoupe selon les saisons et status marital
p + facet_grid(SEASON~MARITAL_STATUS)

# on change de theme
p + facet_grid(SEASON~MARITAL_STATUS) + 
  theme_bw()

# dans la library Esquisse, il y a un addins ggplot builder

