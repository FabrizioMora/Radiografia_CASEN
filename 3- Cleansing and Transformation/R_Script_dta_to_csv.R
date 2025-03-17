install.packages("haven")  # Para leer archivos STATA
install.packages("data.table")  # Para manejar grandes volúmenes de datos más rápido
library(haven)
library(data.table)
# Definir la ruta del archivo STATA
ruta_archivo <- "C:\Users\fabri\Desktop\Base de datos Casen 2022 STATA_18 marzo 2024.dta"
ruta_archivo <- "C:/Users/fabri/Desktop/Base de datos Casen 2022 STATA_18 marzo 2024.dta"
# Cargar el archivo en un dataframe
df <- read_dta(ruta_archivo)
# Mostrar primeras filas
head(df)
# Exportar dataset completo a CSV
fwrite(df, "C:/Users/fabri/Desktop/casen_2022.csv", sep = ",")