tabelaValoresIncidentes9501 <- function(parte1){
  
   
  spreadParte1 <- spread(parte1, Rubrica, Valor)
  
  tabelaOcorrencia9501 <- cbind.data.frame(spreadParte1[,1],is.na(spreadParte1[,-1]))
  
  
  for (INDEX in 2:ncol(tabelaOcorrencia9501)) {
    
    tabelaOcorrencia9501[INDEX] [tabelaOcorrencia9501[INDEX]==FALSE] = colnames(tabelaOcorrencia9501[INDEX])
    tabelaOcorrencia9501[INDEX] [tabelaOcorrencia9501[INDEX]==TRUE] = NA
    
  }
  
  rubricas <- c("113","185","188","190","191","200","208","331","336","401","408","441","442","465","478","907")
  
  rubricasIncidentes <- c("Ano","101","116","410",rubricas)
  
  rubricasMatch = colnames(spreadParte1)[colnames(spreadParte1) %in% rubricasIncidentes]
  
  valoresIncidentes <- spreadParte1  %>% select(rubricasMatch)
  
  return(valoresIncidentes)
  
}