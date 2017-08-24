setwd("C:/Users/Usuario/Desktop/Andres Florez/Kaggle/astro/")
library(readxl)
library(dplyr)
library(arules)
astro_sol <- read_excel("C:/Users/Usuario/Desktop/Andres Florez/Kaggle/astro/astro sol.xlsx", 
     sheet = "Hoja3", col_types = c("text", 
      "text", "text", "text", "text", "text", 
      "numeric", "date"))
astro_sol$Val1 <- as.factor(astro_sol$Val1)
astro_sol$Val2 <- as.factor(astro_sol$Val2)
astro_sol$Val3 <- as.factor(astro_sol$Val3)
astro_sol$Val4 <- as.factor(astro_sol$Val4)
astro_sol$Signo <- recode_factor(astro_sol$Signo, "Acuario" ="ACUARIO","Acurio" = 
          "ACUARIO","ACUARIO"="ACUARIO","Aries"="ARIES","ARIES"="ARIES",
          "Cancer"="CANCER","Capricornio"= "CAPRICORNIO","Escorpio"="ESCORPION",
          "Escorpion"="ESCORPION","Geminis"="GEMINIS","GEMINIS"= "GEMINIS",
          "Leo"="LEO","LEO"="LEO","Libra"="LIBRA","Piscis"="PISCIS",
          "Sagitario"="SAGITARIO","SAGITARIO"="SAGITARIO","Tauro"="TAURO",
          "TAURO"="TAURO","Virgo"="VIRGO","VIRGO"="VIRGO")
astro_sol <- na.omit(astro_sol)
summary(astro_sol$Val1)
summary(astro_sol$Val2)
summary(astro_sol$Val3)
summary(astro_sol$Val4)
difer_Val1_2 <- as.numeric(astro_sol$Val1) - as.numeric(astro_sol$Val2)
temp <- ifelse(difer==9|difer==-9,1,difer)
temp2 <- subset(astro_sol,select=c(-Numero,-Sorteo,-Fecha,-Signo))
write.csv(temp2, file = 'sorteos.csv', row.names = F)
trans <- read.transactions("sorteos.csv",sep = ",",rm.duplicates = F)
