lerPdf9500 <- function(diretorio) {
  
  tabelaCompletaTotal <- data.frame()  ## criando uma tabela vazia
  tabelaEstruturadaTotal <- data.frame()  ## criando uma tabela vazia

for (anoFolha in 1:length(diretorio)){


nMaxPag <- pdf_info(diretorio[anoFolha])$pages 


for (nPag in 1:nMaxPag) {
  
tabela <- tabulizer::extract_text(diretorio[anoFolha], pages = nPag) %>%
    readr::read_lines()

tabela <- tabela[-c(1:6,length(tabela))] ## tirando as primeiras colunas do cabecalho e a ultima linha que diz o n da pag
tabela <- str_split_fixed(tabela, " ",2)

colunaUM <- tabela[,1]
colunaUMrascunho <- tabela[,1]

tabelaREVColunaDois <- stringi::stri_reverse(tabela[,2])
tabelaREVColunaDois <- str_split_fixed(tabelaREVColunaDois, " ",2)

colunaBoolean = rep(NA,length(colunaUM))

tabelaCompleta <- cbind.data.frame(colunaUMrascunho,colunaUM,stringi::stri_reverse(tabelaREVColunaDois[,2]),stringi::stri_reverse(tabelaREVColunaDois[,1]),colunaBoolean)
tabelaCompleta$colunaBoolean = str_length(tabelaCompleta$colunaUM) == 3 | str_length(tabelaCompleta$colunaUM) == 7 | str_length(tabelaCompleta$colunaUM) == 1
tabelaCompleta <- tabelaCompleta[tabelaCompleta$colunaBoolean==TRUE,]
tabelaCompleta$colunaBoolean = str_length(tabelaCompleta$colunaUM) == 3 | str_length(tabelaCompleta$colunaUM) == 2 | str_length(tabelaCompleta$colunaUM) == 1

names(tabelaCompleta) <- c("Ano","Rubrica","Detalhe","Valor","colunaBoolean")

tabelaCompletaTotal <- rbind.data.frame(tabelaCompletaTotal,tabelaCompleta)

} ## end for ler pagina

} ## end for ler folha

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
                                      as.character(tabelaEstruturada$Valor))
names(tabelaEstruturada) <- c("Ano","Rubrica","Valor")

tabelaEstruturada$Ano <- as.factor(tabelaEstruturada$Ano)
tabelaEstruturada$Rubrica <- as.factor(tabelaEstruturada$Rubrica)

tabelaEstruturada$Ano <- as.character(tabelaEstruturada$Ano)
tabelaEstruturada$Ano <- paste0("01/",tabelaEstruturada$Ano)
tabelaEstruturada$Ano <- as.Date(tabelaEstruturada$Ano, "%d/%Y/%m")


tabelaEstruturada$Valor <- str_replace(tabelaEstruturada$Valor, "[.]", "")
tabelaEstruturada$Valor <- str_replace(tabelaEstruturada$Valor, "[,]", ".")
tabelaEstruturada$Valor <- as.numeric(tabelaEstruturada$Valor)

names(tabelaEstruturada) <- c("Ano","Rubrica","Valor")

tabelaEstruturadaTotal <- rbind.data.frame(tabelaEstruturadaTotal,tabelaEstruturada)

tabelaEstruturadaTotal <- tabelaEstruturadaTotal[order(tabelaEstruturadaTotal$Ano),] 

return(tabelaEstruturadaTotal)

} # end funcao
