options(stringsAsFactors=F)
socio      <- read.csv(file='./database/db_dati_sociometrici_survey_ver210318.csv')
opinioni   <- read.csv(file='./database/db_survey_opinions_ver210318.csv')
nodes      <- read.csv(file='./database/db_survey_opinions_ver210318.csv')

socio[,"diff"] <- 0
domanda_selezionata = 1
socio <- socio[socio$domanda==domanda_selezionata,]

for (i in c(1:nrow(socio))){
  tar <- socio[i,"target"]
  sou <- socio[i,"arrivo"]
  a <- opinioni[opinioni$Id_nome == tar,5]
  b <- opinioni[opinioni$Id_nome == sou,5]
  if (length(b) == 1 && length(a) == 1){
   socio[i,"diff"] <- (a - b)
  } else
  {
    if (length(a) == 1){
     socio[i,"diff"] <- a
    } else
      if (length(b) == 1){
        socio[i,"diff"] <- b 
      } else
      {
        socio[i,"diff"] <- 999 
      }
      
  }
  print(tar)
}