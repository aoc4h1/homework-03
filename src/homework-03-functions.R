#---------------------------V.3 feladat---------------------------

get_gender <- function(who) {
  i <- which(comic_characters$name==who)[1]
  if (is.na(comic_characters$gsm[i])) 
  { print(substring(comic_characters$sex[i],1,regexpr(" ",comic_characters$sex[i],fixed=T)-1)) 
  } else { print(comic_characters$gsm[i]) }
}