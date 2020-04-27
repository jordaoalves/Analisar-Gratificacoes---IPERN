
lerPdf01 <- function(diretorio) {
  
  tabelaCompletaTotal <- data.frame()  ## criando uma tabela vazia
  tabelaEstruturadaTotal <- data.frame()  ## criando uma tabela vazia

nMaxPag <- pdf_info(diretorio)$pages 

nPag <- 2

for (nPag in 1:nMaxPag) {
  
tabela <- tabulizer::extract_text(diretorio, pages = nPag) %>%
    readr::read_lines()

tabela <- tabela[-c(1:6,length(tabela))] ## tirando as primeiras colunas do cabecalho e a ultima linha que diz o n da pag
tabela <- str_split_fixed(tabela, " ",2)

colunaBoolean = rep(NA,dim(tabela)[1])

tabelaCompleta <- cbind.data.frame(tabela[,1],tabela,colunaBoolean)
tabelaCompleta$colunaBoolean = str_length(tabelaCompleta$`tabela[, 1]`) == 3 | str_length(tabelaCompleta$`tabela[, 1]`) == 7 | str_length(tabelaCompleta$`tabela[, 1]`) == 1

tabelaCompleta <- tabelaCompleta[tabelaCompleta$colunaBoolean==TRUE,]

tabelaCompleta$colunaBoolean = str_length(tabelaCompleta$`tabela[, 1]`) == 3 | str_length(tabelaCompleta$`tabela[, 1]`) == 2 | str_length(tabelaCompleta$`tabela[, 1]`) == 1

names(tabelaCompleta) <- c("Ano","Rubrica","Detalhe-Valor","colunaBoolean")

tabelaCompletaTotal <- rbind.data.frame(tabelaCompletaTotal,tabelaCompleta)

} ## end for ler pagina


#### completando valores para formar uma coluna somente com anos

for (nLinha in 1:dim(tabelaCompletaTotal)[1]) {
  
  x = tabelaCompletaTotal$Ano [nLinha]
  
  if (str_length(x) <= 3) {
    tabelaCompletaTotal$Ano[nLinha] <- tabelaCompletaTotal$Ano[nLinha-1]
    
  } ## end if 
  
} # end for


tabelaEstruturada <- tabelaCompletaTotal[tabelaCompletaTotal$colunaBoolean == TRUE,]
tabelaEstruturada <- cbind.data.frame(as.character(tabelaEstruturada$Ano),
                                      as.character(tabelaEstruturada$Rubrica),
                                      as.character(tabelaEstruturada$`Detalhe-Valor`))
names(tabelaEstruturada) <- c("Ano","Rubrica","Detalhe-Valor")

colunaMista <- tabelaEstruturada$`Detalhe-Valor`
colunaMista <- tabela <- str_split_fixed(colunaMista, ",",2)

centavos <- str_sub(colunaMista[,2], end = 2)

valor <- paste0(colunaMista[,1], ",",centavos)

tabelaEstruturada <- cbind.data.frame(tabelaEstruturada[,-3],valor)

names(tabelaEstruturada) <- c("Ano","Rubrica","Valor")

#tabelaEstruturada$Ano <- as.factor(tabelaEstruturada$Ano)

tabelaEstruturada$Ano <- as.character(tabelaEstruturada$Ano)
tabelaEstruturada$Ano <- paste0("01/",tabelaEstruturada$Ano)
tabelaEstruturada$Ano <- as.Date(tabelaEstruturada$Ano, "%d/%Y/%m")

tabelaEstruturada$Rubrica <- as.factor(tabelaEstruturada$Rubrica)

tabelaEstruturada$Valor <- str_replace(tabelaEstruturada$Valor, "[.]", "")
tabelaEstruturada$Valor <- str_replace(tabelaEstruturada$Valor, "[,]", ".")
tabelaEstruturada$Valor <- as.numeric(tabelaEstruturada$Valor)

names(tabelaEstruturada) <- c("Ano","Rubrica","Valor")

tabelaEstruturada <- tabelaEstruturada[order(tabelaEstruturada$Ano),] 

return(tabelaEstruturada)


} # end funcao

