#CLASE 2- 18 DE MARZO

#Primero se importa el documento excel en "Import dataset"

#Una vez importado, llamaremos a los datos en el Excel data, creando un nuevo vector.

data <- Tabla_camelida
data <- Tabla_camelida

#Verificamos que esté todo OK llamando a data

data

#Ya que tenemos datos de ancho y largo de falanges de llama y guanaco, vamos a seleccionar y filtrar una de estas variables. Trabajaremos con ancho de falange de llama. Para poder filtrar necesitamos usar la función filter y %>% por lo que debemos instalar y abrir el package tidyverse.

install.packages("tidyverse") 

#Luego abrimos tidyverse desde la librería.

library (tidyverse)

#Posteriormente, filtraremos nuestros datos. En este caso buscamos filtrar el ancho de falange de llama. Primero que todo debemos separar llama de guanaco. Para esto crearemos un nuevo vector llamado llama para separar todos los datos asociados a esta categoría. Aquí, se incluirán todas las variables asociadas a llama como ancho y largo.  Para esto utilizamos el siguiente código con la función filter y %>%.

Llama<-data %>% filter(Taxon=="LLAMA")

Llama
summary(Llama)
IQR (Llama$Largo)
IQR (Llama$Ancho)
Guanaco <-data %>% filter (Taxon=="GUANACO")
Guanaco

#Llamamos a nuestro vector llama y sólo deberían aparecer los valores de ancho y largo asociados a esta categoría en específico. 

Llama

# Ya que logramos filtrar los datos de llama, ahora realizaremos un histograma con los datos de ancho de falange para nuestro nuevo vector. Esto con el objetivo de explorar nuestros datos y ver su distribución. Para realizar el histograma instalamos el package ggplot2. Este package nos permitirá hacer todo tipo de gráficos.

install.packages("ggplot2")

#Luego abrimos ggplot2 con library

library(ggplot2)


#Histograma. Usamos la función ggplot2 para crear gráficos. Nuestro set de datos será el nuevo vector Llama, por eso ponemos data=Llama. La función aes guarda relación con aesthetics y es donde definimos las variables a presentar en el gráfico, en este caso el Ancho. Queremos que la variable ancho se represente en el eje x ya que en el eje y tendremos las frecuencias de cada caso. Luego le decimos a ggplot que tipo de gráfico queremos, en este caso un histograma por lo que usamos la función geom_histogram. Dentro de geom_histogram podemos dar detalles de cómo queremos que se vea el gráfico, por ejemplo que las barras tengan un grosor de 1, que el borde sea negro y el relleno de color blanco. Ustedes pueden modificar esto con los colores que quieran.

ggplot(data=Llama, aes(x=Ancho))+geom_histogram(binwidth = 1, color="black", fill="hotpink") 


#Ahora ¿Qué pasa si no filtramos los datos y hacemos un histograma con todos los datos de llama y guanaco? Para esto ya no tenemos que usar el filtro llama. Llamamos a nuestros datos completos que definimos como “data”, es decir data=data. Ahora, para poder incluir a llama y guanaco en el mismo gráfico los separaremos por taxón dentro de la función aes, mencionando fill=Taxon. Ya que fill no se puede repetir, no podemos poner esta función dentro de geom_histogram.

ggplot(data=data, aes(x=Ancho, fill=Taxon))+geom_histogram(binwidth = 1, color="black")


#Estadísticas descriptivas

#Podemos obtener un resumen de las estadísticas descriptivas básicas con la función summary, que incluirá: Max, Min, 1er cuartil, 3er cuartil, mediana y  media.
#Para nuestro ejemplo, seguiremos trabajando con nuestro vector creado Llama

summary(Llama$Ancho)

#Sin embargo, también podemos obtener cada parámetro en forma independiente llamando las siguientes funciones.

#Media. Para esto usamos la función mean. Llamamos a nuestro vector llama y lo “unimos” a la variable Ancho a través del signo $. 
mean(Llama$Ancho)

#Mediana
median(Llama$Ancho)

#Cuartiles
quantile(Llama$Ancho)

#Rango Intercuartil o IQR
IQR(Llama$Ancho)

#Desviación estándar
sd(Llama$Ancho)

#Varianza
var(Llama$Ancho)

