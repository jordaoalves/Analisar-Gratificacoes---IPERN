leitorPDF9501 <- function(diretorioLISTA){

dfTotal <- data.frame()

for (index in 1:length(diretorioLISTA)) {
  
  tabelaEntrada <- tabulizer::extract_text(diretorioLISTA[index], pages = 1) %>% readr::read_lines()
  ano <- NULL
  tabela <- tabelaEntrada[-c(1:6,length(tabelaEntrada))] ## tirando as primeiras colunas do cabecalho e a ultima linha que diz o n da pag
  tabela <- str_split_fixed(tabela, " ",2)
  ano <- str_sub(tabela[1,][1], end = 4)
  ano
  
  df <- if (ano == "2001") {
    
    lerPdf01(diretorioLISTA[index])
    
  }else {lerPdf9500(diretorioLISTA[index]) }# END ELSE    
  
  dfTotal <- rbind.data.frame(dfTotal,df)
  
} # end for


return(dfTotal)

}




