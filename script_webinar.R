### Ir a Settings y obtener API Key
alphacast_api_key <- "COLOCAR_TU_API_KEY"

## Instalar desde Github la librería de Alphacast

devtools::install_github("alphacastio/alphacast-r", force=TRUE)

library(Alphacast)

## Obtener todos los datasets disponibles con mi API key

datasets <- get_datasets(alphacast_api_key)

## Generar el dataset deseado en LONG

remuneraciones <- get_dataframe(6228, alphacast_api_key, TRUE)

library(ggplot2)

ggplot(remuneraciones[grepl("Índice", remuneraciones$variable), ])+
  geom_line(aes(Year, value, color = variable))

## Ver repos

repos <- get_repos(alphacast_api_key)

## Ver datasets de ese Repo

arg_macro_basics <- get_repos_datasets(20, alphacast_api_key)

## Lucky dataset

lucky_words <- c("argentina", "construya", "Long")
construya <- get_lucky_dataset(lucky_words,
                               alphacast_api_key = alphacast_api_key)

ggplot(construya)+
  geom_line(aes(Year, value, color = Entity))

#Cómo subir un csv

devtools::install_github("jfulponi/transporteAR")
library(transporteAR)
library(dplyr)

subsidios <- getsubsidiosycomp(annual=FALSE)

colnames(subsidios)[1] <- "Date"

library(reshape2)

subsidios <- dcast(subsidios, Date ~ tipo)

subsidios$country <- "Argentina"
subsidios <- subsidios[ ,c(7,1:6)]
readr::write_csv(subsidios, "subsidios_webinar.csv")

##DATASET LISTO, HAY QUE CREAR UN REPO

create_repo("Alphacast R Webinar", "Prueba para el Webinar", slug = "alphacast-r-webinar",
            alphacast_api_key = alphacast_api_key)
repo_id <- 876 ##TOMO EL ID DEL REPO

### SUBIMOS EL DATASET

create_dataset("subsidios_webinar.csv", "Subsidios al Transporte Público (2002-2019)", repo_id, alphacast_api_key)

get_dataframe(7171, alphacast_api_key)

alphacast_subsidios <- get_dataframe(7171, alphacast_api_key, long = TRUE)

ggplot(alphacast_subsidios)+
  geom_col(aes(Year, value, color = variable, fill = variable))
