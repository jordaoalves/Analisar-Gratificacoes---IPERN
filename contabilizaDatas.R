## função contabilizadora de datas

contabilizaDatas <- function(datas){

dataRange <- seq(datas[1], datas[length(datas)], by="months")

datas <- format( as.Date( datas ),"%d/%m/%Y")
dataRange <- format( as.Date( dataRange ),"%d/%m/%Y")


dataMatch <- match(dataRange,datas)

string <- paste(c(dataMatch),sep='',collapse=' ')

teste <- str_split(string, fixed('NA'))
teste <- cbind(teste[[1]]) ### warning!!!!
teste <- teste[teste != " "]
teste <- str_trim(teste) # REMOVE OS ESPAÇOS BRANCOS NO COMEÇO E NO FINAL DA STRING
teste <- str_replace_all(teste, "[ ]", ",")

buscarIndexString <- function(data){
  index <- str_split(data, fixed(','),simplify = TRUE)
  index <- as.numeric(index)
  return(index)
}

# cria um intervalo de datas continuas presentes no vetor
vetor = c() ## vetor nulo
for (variable in 1:length(teste)) {
  
  v <- paste(datas[buscarIndexString(teste[variable])][1],"a",datas[buscarIndexString(teste[variable])][length(datas[buscarIndexString(teste[variable])])])
  vetor <- c(vetor,v)
  
} # end for

# unifica periodos sem intervalo ex:01/07/2019 a 01/07/2019 para somente 01/07/2019
for (index in 1:length(vetor)) {
  
  if (str_sub(vetor[index], end = 10) == str_sub(vetor[index], start = 14)) {
    
    vetor[index] <-  str_sub(vetor[index], end = 10)
  } # end if
} # end for

vetor = str_replace(vetor, "01/01", "Jan") 
vetor = str_replace(vetor, "01/02", "Fev")
vetor = str_replace(vetor, "01/03", "Mar")
vetor = str_replace(vetor, "01/04", "Abr")
vetor = str_replace(vetor, "01/05", "Mai")
vetor = str_replace(vetor, "01/06", "Jun")
vetor = str_replace(vetor, "01/07", "Jul")
vetor = str_replace(vetor, "01/08", "Ago")
vetor = str_replace(vetor, "01/09", "Set")
vetor = str_replace(vetor, "01/10", "Out")
vetor = str_replace(vetor, "01/11", "Nov")
vetor = str_replace(vetor, "01/12", "Dez")

return(paste(vetor, collapse = '; '))

}
