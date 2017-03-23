#########################
# Házi feladat 3        #
# Programozás I.        #
# 2016/17. II. félév    #
# Mogyorósi Pálma       #
# 2017.03.24.           #
#########################

#---------------------------II.01 feladat---------------------------
# Készíts egy listát, ami 5 vektort tartalmaz. Mindegyik vektor hossza legyen 
# egy véletlenszerű 10 és 20 közötti szám. 
# A vektorok (1,2) intervallumon egyenletes eloszlásból származzanak.

n <- 5

v_min <- 10
v_max <- 20

lista <- NA

for (i in 1:n)
{
  #Az [i] vektor hossza:
  j <- sample(v_min:v_max,1)
  lista[i] <- list(runif(j, min = 1, max = 2))
}

lista

#---------------------------II.02 feladat---------------------------
# Nézd meg for ciklussal, hogy az előbb létrehozott listának milyen 
# hosszúak az elemei! A végeredmény legyen egy vektor.

# Annyiban más az előző ciklustól, hogy itt a j egy vektor, nem írodik felül. 
# Annyi elemet csinál a runif, amennyit a j[i] megad, vagyis ötöt.

for (i in 1:n)
{
  j[i] <- sample(v_min:v_max, 1)
  lista[i] <- list(runif(j[i], min = 1, max = 2))
}  

lista

hossz_vektor <- j
hossz_vektor

is.vector(hossz_vektor)

#---------------------------II.03 feladat---------------------------
# Nézd meg az apply függvénycsalád egy tagjával, hogy a 
# listának milyen hosszúak az elemei! A végeredmény legyen egy lista.

hossz_lista <- list(lapply(lista, length))
hossz_lista

is.list(hossz_lista)

#---------------------------II.04 feladat---------------------------
# Nézd meg az apply függvénycsalád egy tagjával, hogy a listának milyen 
# hosszúak az elemei! A végeredmény legyen egy vektor.

hossz_vektor_sapply <- sapply(lista, length, simplify = TRUE)
hossz_vektor_sapply

is.vector(hossz_vektor_sapply)


#---------------------------III.01 feladat---------------------------
# Hívd be a chickwts datasetet, amit az R alapból tartalmaz.

data("chickwts")
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
df

#---------------------------IV.1 feladat---------------------------
# Hozz létre egy 50 soros, 10 oszlopos mátrixot, aminek az értékei normális 
# eloszlásból származnak. Minden sor szórása legyen egyenlő a sor számával.

m_sor <- 50
m_osz <- 10
m <- matrix(NA, nrow = m_sor, ncol = m_osz)
m

for (i in 1:m_sor) {
  m[i, ] <- rnorm(m_osz, mean=0, sd=i)
}

#---------------------------IV.2 feladat---------------------------
# Számold ki for ciklussal minden sor szórását! A végeredmény legyen egy vektor.


m_sd_sor = NA

for (i in 1:m_sor)
  m_sd_sor[i] <- sd(m[i, ])

m_sd_sor

# Sajnos csak akkor látszik jól, ha az m_osz értékét 10 000-re emelem.

is.vector(m_sd_sor)

#---------------------------IV.3 feladat---------------------------
# Számold ki az apply függvénycsalád egy tagjával minden sor szórását! 
# A végeredmény legyen egy vektor.

m_sd_sor_apply <- apply(m, 1, sd)
m_sd_sor_apply

is.vector(m_sd_sor_apply)

#---------------------------IV.4 feladat---------------------------
# Normalizáld a mátrix értékeit -1-től 1-ig tartó intervallumra és 
# nézd meg a sorok átlagát!

m_me_sor <- apply(m, 1, mean)
normalized <- (m - m_me_sor) / m_sd_sor
normalized

#---------------------------V.1 feladat---------------------------
# Hívd be a előző házikban is használt fivethirtyeight package-et és 
# olvasd be a comic_characters datasetet!

install.packages("fivethirtyeight")
require("fivethirtyeight")

data(comic_characters)
comic_characters

# Függvények behívása
source("src/homework-03-functions.R")


#---------------------------V.2 feladat---------------------------
# Alakítsd át a name nevű oszlopot úgy, hogy minden karakternek csak az 
# elsődleges neve maradjon ott mindenféle zárójeles rész nélkül. 
# Például "Spider-Man (Peter Parker)" helyett "Spider-Man", "Benjamin Grimm 
# (Earth-616)" helyett "Benjamin Grimm" maradjon. Használhatod a feladathoz 
# pl. az strsplit függvényt és az apply függvénycsalád egy tagját, de használj 
# nyugodtan mást is, csak arra figyelj, hogy a megoldásodban ne legyen for ciklus!

comic_characters$name <- substring(comic_characters$name,1,
                                   regexpr("(",comic_characters$name,fixed=T)-2)


#---------------------------V.3 feladat---------------------------
# Írj egy függvény get_gender néven, aminek az a célja, hogy egy karakter 
# nevének megadásakor visszaadja a karakter genderét. A karakter genderét úgy 
# add vissza, hogy ha a gsm oszlopban NA érték van, akkor a sex oszlop tartalmát 
# írja ki a függvény, viszont ha a gsm oszlop értéke nem NA, akkor a gsm oszlop 
# tartalmát írja ki. A gender kiírásakor vágd le a " Characters" részt, 
# tehát pl. "Male Characters" helyett "Male"-t, "Female Characters" helyett 
# "Female"-t írjon ki a függvény. A függvényben ne legyen for ciklus! Figyelj 
# arra is, hogy a 2. feladatban végrehajtott átalakítás miatt egy név többször 
# is szerepelhet a name oszlopban. Ilyen esetekben minden egyező név esetén 
# nézze meg a gendert és vektorként térjen vissza az értékeikkel.

get_gender

#---------------------------V.4 feladat---------------------------
# Nézd meg az előzőleg írt get_gender függvénnyel, hogy milyen genderű Thor, 
# Katherine Pryde és Loki Laufeyson! Thornál és Lokinál egy vektort kell kapnod.

get_gender("Thor")
get_gender("Katherine Pryde")
get_gender("Loki Laufeyson")

is.vector(get_gender("Thor"))
is.vector(get_gender("Loki Laufeyson"))
