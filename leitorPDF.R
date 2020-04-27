leitorPDF <- function(diretorioLISTA){

dfTotal <- data.frame()

for (index in 1:length(diretorioLISTA)) {
  
  df<- lerPdf(diretorioLISTA[index])
    
  dfTotal <- rbind.data.frame(dfTotal,df)
  
} # end for


return(dfTotal)

}


#diretorioLISTA <- c("C:\\Users\\Jordão Alves\\Desktop\\analisarAtestadoGratificacao\\2001-2010.pdf",
#                   "C:\\Users\\Jordão Alves\\Desktop\\analisarAtestadoGratificacao\\2011-2020.pdf")


#a <-leitorPDF(diretorioLISTA)

#legal <- tabelaContribuicaoTotalCompleta(a)

#tabelaValoresIncidentes(a)
