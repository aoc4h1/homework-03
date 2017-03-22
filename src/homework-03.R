#########################
# Házi feladat 3        #
# Programozás I.        #
# 2016/17. II. félév    #
# Mogyorósi Pálma       #
# 2017.03.22.           #
#########################

#---------------------------II.01 feladat---------------------------
# Készíts egy listát, ami 5 vektort tartalmaz. Mindegyik vektor hossza legyen 
# egy véletlenszerű 10 és 20 közötti szám. 
# A vektorok (1,2) intervallumon egyenletes eloszlásból származzanak.

#A lista hossza:
n <- 5

#A vektor minimális és maximális hossza:
v_min <- 10
v_max <- 20

lista <- NA

for (i in 1:n)
{
  #Az i. vektor hossza:
  j<-sample(v_min:v_max,1)
  lista[i]<-list(runif(j,min=1,max=2))
}

lista

#---------------------------II.02 feladat---------------------------
# Nézd meg for ciklussal, hogy az előbb létrehozott listának milyen 
# hosszúak az elemei! A végeredmény legyen egy vektor.

for (i in 1:n)
{
  j[i]<-sample(v_min:v_max,1)
  lista[i]<-list(runif(j[i],min=1,max=2))
}  

lista

hossz_vektor <- j
hossz_vektor

#---------------------------II.03 feladat---------------------------
# Nézd meg az apply függvénycsalád egy tagjával, hogy a 
# listának milyen hosszúak az elemei! A végeredmény legyen egy lista.

hossz_lista <- list(lapply(lista, length))

#---------------------------II.04 feladat---------------------------
# Nézd meg az apply függvénycsalád egy tagjával, hogy a listának milyen 
# hosszúak az elemei! A végeredmény legyen egy vektor.

hossz_vektor_sapply <- sapply(lista, length, simplify = TRUE)
hossz_vektor_sapply

#---------------------------III.01 feladat---------------------------
# Hívd be a chickwts datasetet, amit az R alapból tartalmaz.

data("chickwts")
chickwts
head(chickwts)

#---------------------------III.02 feladat---------------------------
# Nézd meg, mennyi az átlagsúlya a különbözőképp táplált csirkéknek! 
# Használd az aggregate függvényt!
  
df <- aggregate(chickwts$weight, by = list(feed = chickwts$feed), mean)
df

#---------------------------III.3 eladat---------------------------
# Az előbb kapott aggregált data frame-et rendezd az átlagsúly szerint 
# csökkenő sorrendbe!

df <- df[order(df$x, decreasing = TRUE), ]


