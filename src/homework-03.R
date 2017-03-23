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

#---------------------------IV.1 feladat---------------------------
# Hozz létre egy 50 soros, 10 oszlopos mátrixot, aminek az értékei normális 
# eloszlásból származnak. Minden sor szórása legyen egyenlő a sor számával.

#A mátrix:
m_sor <- 50
m_osz <- 10
m <- matrix(NA, nrow = m_sor, ncol = m_osz)

#Az értékek:
for (i in 1:m_sor) {
  m[i, ] <- rnorm(m_osz, mean=0, sd=i)
}


#---------------------------IV.2 feladat---------------------------
# Számold ki for ciklussal minden sor szórását! A végeredmény legyen egy vektor.

for (i in 1:m_sor)
  m_sd_sor[i] <- sd(m[i, ])

# Sajnos csak akkor látszik jól, ha az m_osz értékét 10 000-re emelem.
m_sd_sor

is.vector(m_sd_sor)

#---------------------------IV.3 feladat---------------------------
# Számold ki az apply függvénycsalád egy tagjával minden sor szórását! 
# A végeredmény legyen egy vektor.

m_sd_sor_apply <- apply(m, 1, sd)

is.vector(m_sd_sor_apply)

#---------------------------IV.4 feladat---------------------------
# Normalizáld a mátrix értékeit -1-től 1-ig tartó intervallumra és 
# nézd meg a sorok átlagát!

m_me_sor <- apply(m, 1, mean)
normalized <- (m - m_me_sor) / m_sd_sor
normalized



