lerPdf <- function(diretorio) {
  
  tabelaCompletaTotal <- data.frame()  ## criando uma tabela vazia
  tabelaEstruturadaTotal <- data.frame()  ## criando uma tabela vazia

#for (anoFolha in 1:length(diretorio)){
  
  nMaxPag <- pdf_info(diretorio)$pages 

for (nPag in 1:nMaxPag) {
  
  tabela <- tabulizer::extract_text(diretorio, pages = nPag) %>%
    readr::read_lines()

tabela <- tabela[-c(1:7,length(tabela))] ## tirando as primeiras colunas do cabecalho e a ultima linha que diz o n da pag

tabela <- str_split_fixed(tabela, " ",6)

tabela <- cbind.data.frame(tabela[,3],tabela[,5],tabela[,6])

tabela$`tabela[, 5]` <- as.factor(tabela$`tabela[, 5]`)


tabelaCompleta <- tabela[tabela$`tabela[, 5]` != "997",]
tabelaCompleta <- tabelaCompleta[tabelaCompleta$`tabela[, 5]` != "998",]
tabelaCompleta <- tabelaCompleta[tabelaCompleta$`tabela[, 5]` != "999",]

names(tabelaCompleta) <- c("Ano","Rubrica","Detalhe-Valor")


tabelaCompletaTotal <- rbind.data.frame(tabelaCompletaTotal,tabelaCompleta)

} ## end for ler pagina

#} # end for 2 

  tabelaCompleta = tabelaCompletaTotal
  
  colunaValorInvertida <- stri_reverse(tabelaCompleta$`Detalhe-Valor`)  
  colunaValorInvertida <- str_split_fixed(colunaValorInvertida, " ",2)
  colunaValor <- stri_reverse(colunaValorInvertida[,1]) 
  
  tabelaCompleta <- cbind.data.frame(tabelaCompleta[,1:2],colunaValor)
  
  names(tabelaCompleta) <- c("Ano","Rubrica","Valor")
  
  tabelaCompleta$Ano <- as.character.Date(tabelaCompleta$Ano)
  tabelaCompleta$Ano <- paste0("01/",tabelaCompleta$Ano)
  tabelaCompleta$Ano <- as.Date(tabelaCompleta$Ano, "%d/%m/%Y")
  
  tabelaCompleta$Rubrica <- as.factor(tabelaCompleta$Rubrica)
  
  
  tabelaCompleta$Valor <- str_replace(tabelaCompleta$Valor, "[.]", "")
  tabelaCompleta$Valor <- str_replace(tabelaCompleta$Valor, "[,]", ".")
  tabelaCompleta$Valor <- as.numeric(tabelaCompleta$Valor)
  
  names(tabelaCompleta) <- c("Ano","Rubrica","Valor")
  
  tabelaCompleta <- tabelaCompleta[order(tabelaCompleta$Ano),]  

return(tabelaCompleta)

}


