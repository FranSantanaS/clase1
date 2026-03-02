---
title: "Clase 2 Arqueología Cuantitativa"
author: "Francisca Santana"
date: "2026-03-02"
output: 
  html_document: 
    keep_md: true
---

Configura un mirror de CRAN (Cloud funciona en todo el mundo)


``` r
options(repos = c(CRAN = "https://cloud.r-project.org"))
```

Primero se importa el documento excel en "Import dataset" #Una vez importado, llamaremos a los datos en el Excel data, creando un nuevo vector.


``` r
install.packages("readxl")
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/x3/qv2_x5xj4jx90qc3xvr06vlm0000gn/T//RtmpXV9C8g/downloaded_packages
```

``` r
library(readxl)
data<- read_excel("~/Library/Mobile Documents/com~apple~CloudDocs/Documents/Documentos - Francisca’s MacBook Air/GitHub/Cuanti/clase1/intento1/Tabla camelida.xlsx")
data
```

```
## # A tibble: 33 × 3
##    Taxon Largo Ancho
##    <chr> <dbl> <dbl>
##  1 LLAMA  80.3  35.4
##  2 LLAMA  71.6  21.2
##  3 LLAMA  70.9  22.0
##  4 LLAMA  70.6  22.3
##  5 LLAMA  69.1  22.7
##  6 LLAMA  68.7  20.8
##  7 LLAMA  67.8  20  
##  8 LLAMA  66.6  21  
##  9 LLAMA  65.9  20.3
## 10 LLAMA  65.8  21.2
## # ℹ 23 more rows
```

Ya que tenemos datos de ancho y largo de falanges de llama y guanaco, vamos a seleccionar y filtrar una de estas variables. Trabajaremos con ancho de falange de llama. Para poder filtrar necesitamos usar la función filter y %\>% por lo que debemos instalar y abrir el package tidyverse.


``` r
install.packages("tidyverse")
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/x3/qv2_x5xj4jx90qc3xvr06vlm0000gn/T//RtmpXV9C8g/downloaded_packages
```

``` r
library (tidyverse)
```

```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.2.0     ✔ readr     2.2.0
## ✔ forcats   1.0.1     ✔ stringr   1.6.0
## ✔ ggplot2   4.0.2     ✔ tibble    3.3.1
## ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
## ✔ purrr     1.2.1     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

Posteriormente, filtraremos nuestros datos. En este caso buscamos filtrar el ancho de falange de llama. Primero que todo debemos separar llama de guanaco. Para esto crearemos un nuevo vector llamado llama para separar todos los datos asociados a esta categoría. Aquí, se incluirán todas las variables asociadas a llama como ancho y largo. Para esto utilizamos el siguiente código con la función filter y %\>%.


``` r
Llama<-data %>% filter(Taxon=="LLAMA")
Llama
```

```
## # A tibble: 20 × 3
##    Taxon Largo Ancho
##    <chr> <dbl> <dbl>
##  1 LLAMA  80.3  35.4
##  2 LLAMA  71.6  21.2
##  3 LLAMA  70.9  22.0
##  4 LLAMA  70.6  22.3
##  5 LLAMA  69.1  22.7
##  6 LLAMA  68.7  20.8
##  7 LLAMA  67.8  20  
##  8 LLAMA  66.6  21  
##  9 LLAMA  65.9  20.3
## 10 LLAMA  65.8  21.2
## 11 LLAMA  65.1  21.6
## 12 LLAMA  64.6  19.3
## 13 LLAMA  64.2  20.0
## 14 LLAMA  61.5  18.7
## 15 LLAMA  61.1  20.3
## 16 LLAMA  60.8  18.8
## 17 LLAMA  60.6  19.9
## 18 LLAMA  60.5  18.9
## 19 LLAMA  56.9  18.8
## 20 LLAMA  40.2  15.2
```

``` r
summary(Llama)
```

```
##     Taxon               Largo           Ancho      
##  Length:20          Min.   :40.20   Min.   :15.20  
##  Class :character   1st Qu.:61.00   1st Qu.:19.20  
##  Mode  :character   Median :65.42   Median :20.28  
##                     Mean   :64.63   Mean   :20.92  
##                     3rd Qu.:68.80   3rd Qu.:21.31  
##                     Max.   :80.30   Max.   :35.40
```

``` r
IQR (Llama$Largo)
```

```
## [1] 7.8025
```

``` r
IQR (Llama$Ancho)
```

```
## [1] 2.115
```

Filtro para GUANACO.


``` r
Guanaco <-data %>% filter (Taxon=="GUANACO")
Guanaco
```

```
## # A tibble: 13 × 3
##    Taxon   Largo Ancho
##    <chr>   <dbl> <dbl>
##  1 GUANACO  72    21  
##  2 GUANACO  73    21  
##  3 GUANACO  73    21  
##  4 GUANACO  75    22  
##  5 GUANACO  72    23  
##  6 GUANACO  75    22  
##  7 GUANACO  62.9  20.1
##  8 GUANACO  63    20.2
##  9 GUANACO  64.3  20.1
## 10 GUANACO  61.9  18.7
## 11 GUANACO  67.2  21.2
## 12 GUANACO  66.4  22.6
## 13 GUANACO  67.4  21.2
```

``` r
summary(Guanaco)
```

```
##     Taxon               Largo           Ancho      
##  Length:13          Min.   :61.93   Min.   :18.67  
##  Class :character   1st Qu.:64.30   1st Qu.:20.20  
##  Mode  :character   Median :67.35   Median :21.00  
##                     Mean   :68.70   Mean   :21.08  
##                     3rd Qu.:73.00   3rd Qu.:22.00  
##                     Max.   :75.00   Max.   :23.00
```

``` r
IQR (Guanaco$Largo)
```

```
## [1] 8.7
```

``` r
IQR (Guanaco$Ancho)
```

```
## [1] 1.8
```

Ya que logramos filtrar los datos de llama, ahora realizaremos un histograma con los datos de ancho de falange para nuestro nuevo vector. Esto con el objetivo de explorar nuestros datos y ver su distribución. Para realizar el histograma instalamos el package ggplot2. Este package nos permitirá hacer todo tipo de gráficos.


``` r
install.packages("ggplot2")
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/x3/qv2_x5xj4jx90qc3xvr06vlm0000gn/T//RtmpXV9C8g/downloaded_packages
```

``` r
library(ggplot2)
ggplot(data=Llama, aes(x=Ancho))+geom_histogram(binwidth = 1, color="black", fill="hotpink")
```

![](HOLA_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
