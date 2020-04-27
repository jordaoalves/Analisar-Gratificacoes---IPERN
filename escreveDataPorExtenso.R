escreveDataPorExtenso <- function(data){

dia <- str_sub(data, start = 9)

mes <- str_sub(data, 6, 7)

ano <- str_sub(data, end = 4)

numeroNomeMes <- function(vetor){

vetor = str_replace(vetor, "01", "janeiro") 
vetor = str_replace(vetor, "02", "fevereiro")
vetor = str_replace(vetor, "03", "março")
vetor = str_replace(vetor, "04", "abril")
vetor = str_replace(vetor, "05", "maio")
vetor = str_replace(vetor, "06", "junho")
vetor = str_replace(vetor, "07", "julho")
vetor = str_replace(vetor, "08", "agosto")
vetor = str_replace(vetor, "09", "setembro")
vetor = str_replace(vetor, "10", "outubro")
vetor = str_replace(vetor, "11", "novembro")
vetor = str_replace(vetor, "12", "dezembro")

return(vetor)
}

mesNome <- numeroNomeMes(mes)

return(paste(dia, "de", mesNome, "de", ano))

}