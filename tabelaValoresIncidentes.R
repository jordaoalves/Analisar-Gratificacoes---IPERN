tabelaValoresIncidentes <- function(parteTabela){
  
  parte1 <- parteTabela %>%   group_by(Ano,Rubrica) %>%   summarise(Valor = sum(Valor))
  
  spreadParte1 <- spread(parte1, Rubrica, Valor)
  
  spreadParte1 <- spreadParte1[is.na(spreadParte1$`501`) == FALSE,] ### seleciona apenas os meses que há contribuição RPPS
  
  tabelaOcorrencia <- cbind.data.frame(spreadParte1[,1],is.na(spreadParte1[,-1]))
  
  
  for (INDEX in 2:ncol(tabelaOcorrencia)) {
    
    tabelaOcorrencia[INDEX] [tabelaOcorrencia[INDEX]==FALSE] = colnames(tabelaOcorrencia[INDEX])
    tabelaOcorrencia[INDEX] [tabelaOcorrencia[INDEX]==TRUE] = NA
    
  }
  
  rubricas = c("11","15","17","19","21","25","29","31","33","35","37","43","47","51",
               "59","63","67","71","73","77","79","87","97","115","118","125","131",
               "133","137","139","147","149","151","157","158","161","162","163","169","179",
               "187","193","195","199","213","219","222","224","227","234","236","248","253",
               "261","263","265","267","289","290","291","293","295","299","303","305","307","315","319",
               "325","327","329","334","337","369","397","403","419","425","455","457","458","459","461","475","484")
  
  rubricasIncidentes <- c("Ano","1","5","9","103","165","301","355",rubricas)
  
  rubricasMatch = colnames(spreadParte1)[colnames(spreadParte1) %in% rubricasIncidentes]
  
  valoresIncidentes <- spreadParte1  %>% select(rubricasMatch)
  
  return(valoresIncidentes)
  
}
