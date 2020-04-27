function(input, output, session){
  
 # shinyjs::hidden(id = 'downloadReport') ### esconde o botão de donwload
  
  shinyjs::hide('baixarDespacho')
  shinyjs::hide('baixarFichaFinanceira')
  shinyjs::hide('baixarRelatorioAuxiliar')
  shinyjs::hide('format')
  
  
  
  observe({
    if(input$selectall == 0) return(NULL) 
    else if (input$selectall%%2 == 0)
    {
      updateCheckboxGroupInput(session,"rubricas",NULL,choices=c("GRATIFICACAO DE INSALUBRIDADE (cód. 113) < 08/01" = "113",
                                                                  "COMPL.SALARIAL DEC.6045 (cód. 185) < 08/01" = "185",
                                                                  "GRATIFICACAO PLANTAO (cód. 188) < 08/01" = "188",
                                                                  "GRATIFICACAO ADICIONAL NOTURNO  (cód. 190) < 08/01" = "190",
                                                                  "GRATIFICACAO PERMAN.LEI 5.334  (cód. 191) < 08/01" = "191",
                                                                  "VANTAGEM PESSOAL LEI 6.192 Art. 11 (cód. 200) < 08/01" = "200",
                                                                  "GRADES - ART 1º LEI 6271 (cód. 208) < 08/01" = "208",
                                                                  "LIMINAR JUDICIAL (cód. 331) < 08/01" = "331",
                                                                  "GRAT. ASS. ESP. - GRAE (cód. 336) < 08/01" = "336",
                                                                  "VENCIMENTOS (cód. 401) < 08/01" = "401",
                                                                  "GRATIFICACAO DE INSALUBRIDADE  (cód. 408) < 08/01" = "408",
                                                                  "GRATIFICACAO DE PLANTAO  (cód. 441) < 08/01" = "441",
                                                                  "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 442) < 08/01" = "442",
                                                                  "GRADES ART. 1 L 6271  (cód. 465) < 08/01" = "465",
                                                                  "GRAT. ASS. ESP. - GRAE (cód. 478) < 08/01" = "478",
                                                                  "GRAT ARC. (cód. 907) < 08/01" = "907",
                                                                  
                                                                  "GRATIFICACAO DE PLANTAO EM UNIDADE DE SAUDE (cód. 35)  > 07/01" = "35",
                                                                  "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 37)  > 07/01" = "37",
                                                                  "GRATIFICACAO DE INSALUBRIDADE (cód. 47)  > 07/01" = "47",
                                                                  "GRATIFICACAO DE DESEMPENHO EM SERVICO DE SAUDE - GRADES (cód. 51)  > 07/01" = "51",
                                                                  "VANTAGEM PESSOAL DO ART 15 DA LC Nº 333/2006 (PCCR DA SESAP) (cód. 118)  > 07/01" = "118",
                                                                  "PLANTAO EVENTUAL (cód. 131)  > 07/01" = "131",
                                                                  "GDAAC INCORPORADA - GRAT DESEMP ATIV ALTA COMPLEXIDADE (cód. 162)  > 07/01" = "162",
                                                                  "DIFERENCA DE NIVEL - VENCIMENTO (cód. 224)  > 07/01" = "224",
                                                                  "GRATIFICACAO DE JORNADA ESPECIAL (cód. 291)  > 07/01" = "291",
                                                                  "GRATIFICACAO ESPECIAL DE LOCALIZACAO GEOGRAFICA (cód. 293)  > 07/01" = "293",
                                                                  "GRATIFICACAO ATIVIDADE ESTADUAL - GAEST (cód. 295)  > 07/01" = "295",
                                                                  "GRAT DESEMPENHO DE ATIVIDADE DE ALTA COMPLEXIDADE - GDAAC (cód. 299)  > 07/01" = "299",
                                                                  "INDENIZACAO (cód. 403)  > 07/01" = "403"
      ),selected=c("GRATIFICACAO DE INSALUBRIDADE (cód. 113) < 08/01" = "113",
                    "COMPL.SALARIAL DEC.6045 (cód. 185) < 08/01" = "185",
                    "GRATIFICACAO PLANTAO (cód. 188) < 08/01" = "188",
                    "GRATIFICACAO ADICIONAL NOTURNO  (cód. 190) < 08/01" = "190",
                    "GRATIFICACAO PERMAN.LEI 5.334  (cód. 191) < 08/01" = "191",
                    "VANTAGEM PESSOAL LEI 6.192 Art. 11 (cód. 200) < 08/01" = "200",
                    "GRADES - ART 1º LEI 6271 (cód. 208) < 08/01" = "208",
                    "LIMINAR JUDICIAL (cód. 331) < 08/01" = "331",
                    "GRAT. ASS. ESP. - GRAE (cód. 336) < 08/01" = "336",
                    "VENCIMENTOS (cód. 401) < 08/01" = "401",
                    "GRATIFICACAO DE INSALUBRIDADE  (cód. 408) < 08/01" = "408",
                    "GRATIFICACAO DE PLANTAO  (cód. 441) < 08/01" = "441",
                    "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 442) < 08/01" = "442",
                    "GRADES ART. 1 L 6271  (cód. 465) < 08/01" = "465",
                    "GRAT. ASS. ESP. - GRAE (cód. 478) < 08/01" = "478",
                    "GRAT ARC. (cód. 907) < 08/01" = "907",
                    
                    "GRATIFICACAO DE PLANTAO EM UNIDADE DE SAUDE (cód. 35)  > 07/01" = "35",
                    "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 37)  > 07/01" = "37",
                    "GRATIFICACAO DE INSALUBRIDADE (cód. 47)  > 07/01" = "47",
                    "GRATIFICACAO DE DESEMPENHO EM SERVICO DE SAUDE - GRADES (cód. 51)  > 07/01" = "51",
                    "VANTAGEM PESSOAL DO ART 15 DA LC Nº 333/2006 (PCCR DA SESAP) (cód. 118)  > 07/01" = "118",
                    "PLANTAO EVENTUAL (cód. 131)  > 07/01" = "131",
                    "GDAAC INCORPORADA - GRAT DESEMP ATIV ALTA COMPLEXIDADE (cód. 162)  > 07/01" = "162",
                    "DIFERENCA DE NIVEL - VENCIMENTO (cód. 224)  > 07/01" = "224",
                    "GRATIFICACAO DE JORNADA ESPECIAL (cód. 291)  > 07/01" = "291",
                    "GRATIFICACAO ESPECIAL DE LOCALIZACAO GEOGRAFICA (cód. 293)  > 07/01" = "293",
                    "GRATIFICACAO ATIVIDADE ESTADUAL - GAEST (cód. 295)  > 07/01" = "295",
                    "GRAT DESEMPENHO DE ATIVIDADE DE ALTA COMPLEXIDADE - GDAAC (cód. 299)  > 07/01" = "299",
                    "INDENIZACAO (cód. 403)  > 07/01" = "403"
      ))
    }
    else
    {
      updateCheckboxGroupInput(session,"rubricas",NULL,choices=c("GRATIFICACAO DE INSALUBRIDADE (cód. 113) < 08/01" = "113",
                                                                  "COMPL.SALARIAL DEC.6045 (cód. 185) < 08/01" = "185",
                                                                  "GRATIFICACAO PLANTAO (cód. 188) < 08/01" = "188",
                                                                  "GRATIFICACAO ADICIONAL NOTURNO  (cód. 190) < 08/01" = "190",
                                                                  "GRATIFICACAO PERMAN.LEI 5.334  (cód. 191) < 08/01" = "191",
                                                                  "VANTAGEM PESSOAL LEI 6.192 Art. 11 (cód. 200) < 08/01" = "200",
                                                                  "GRADES - ART 1º LEI 6271 (cód. 208) < 08/01" = "208",
                                                                  "LIMINAR JUDICIAL (cód. 331) < 08/01" = "331",
                                                                  "GRAT. ASS. ESP. - GRAE (cód. 336) < 08/01" = "336",
                                                                  "VENCIMENTOS (cód. 401) < 08/01" = "401",
                                                                  "GRATIFICACAO DE INSALUBRIDADE  (cód. 408) < 08/01" = "408",
                                                                  "GRATIFICACAO DE PLANTAO  (cód. 441) < 08/01" = "441",
                                                                  "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 442) < 08/01" = "442",
                                                                  "GRADES ART. 1 L 6271  (cód. 465) < 08/01" = "465",
                                                                  "GRAT. ASS. ESP. - GRAE (cód. 478) < 08/01" = "478",
                                                                  "GRAT ARC. (cód. 907) < 08/01" = "907",
                                                                  
                                                                  "GRATIFICACAO DE PLANTAO EM UNIDADE DE SAUDE (cód. 35)  > 07/01" = "35",
                                                                  "GRATIFICACAO DE ADICIONAL NOTURNO (cód. 37)  > 07/01" = "37",
                                                                  "GRATIFICACAO DE INSALUBRIDADE (cód. 47)  > 07/01" = "47",
                                                                  "GRATIFICACAO DE DESEMPENHO EM SERVICO DE SAUDE - GRADES (cód. 51)  > 07/01" = "51",
                                                                  "VANTAGEM PESSOAL DO ART 15 DA LC Nº 333/2006 (PCCR DA SESAP) (cód. 118)  > 07/01" = "118",
                                                                  "PLANTAO EVENTUAL (cód. 131)  > 07/01" = "131",
                                                                  "GDAAC INCORPORADA - GRAT DESEMP ATIV ALTA COMPLEXIDADE (cód. 162)  > 07/01" = "162",
                                                                  "DIFERENCA DE NIVEL - VENCIMENTO (cód. 224)  > 07/01" = "224",
                                                                  "GRATIFICACAO DE JORNADA ESPECIAL (cód. 291)  > 07/01" = "291",
                                                                  "GRATIFICACAO ESPECIAL DE LOCALIZACAO GEOGRAFICA (cód. 293)  > 07/01" = "293",
                                                                  "GRATIFICACAO ATIVIDADE ESTADUAL - GAEST (cód. 295)  > 07/01" = "295",
                                                                  "GRAT DESEMPENHO DE ATIVIDADE DE ALTA COMPLEXIDADE - GDAAC (cód. 299)  > 07/01" = "299",
                                                                  "INDENIZACAO (cód. 403)  > 07/01" = "403"
      )
      )
    }
  })
  
  
  
  observeEvent(input$start, {
    
  data1 <- reactive ({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    

  })
  
  
  print(is.null(input$file2))

  diretorioImp9501 = input$file1$datapath
  print(input$file1$datapath)
  
  diretorioImp = input$file2$datapath
  print(input$file1$datapath)
  
  nProcesso = input$nProcesso
  rubricas = input$rubricas
  print(rubricas)
  
  dataRage = input$periodoPesquisa
  responsavel = input$setorResponsavel
  dataDespacho = input$dataDespacho
  destinatario = input$destinatario
  
  
  
  valoresIncidentesCompleta <- data.frame()

  
  if (is.null(input$file1) == FALSE) {
    
    diretorioImp9501 = input$file1$datapath
    print(input$file1$datapath)
    
    data9501 = leitorPDF9501(diretorioImp9501)
    
    valoresIncidentes <- tabelaValoresIncidentes9501(data9501)
    valoresIncidentesCompleta <- dplyr::bind_rows(valoresIncidentesCompleta,valoresIncidentes)
    
    tabelaContribuicaoTotal9501 <- tabelaContribuicaoTotalCompleta9501(data9501)
    #tabelaContribuicaoTotalCompleta <- dplyr::bind_rows(tabelaContribuicaoTotalCompleta,tabelaContribuicaoTotal)
  }
  
  if (is.null(input$file2) == FALSE) {
    
    diretorioImp = input$file2$datapath
    print(input$file2$datapath)
    
    data = leitorPDF(diretorioImp)
    
    valoresIncidentes <- tabelaValoresIncidentes(data)
    valoresIncidentesCompleta <- dplyr::bind_rows(valoresIncidentesCompleta,valoresIncidentes)
    
    tabelaContribuicaoTotal <- tabelaContribuicaoTotalCompleta(data)
    
  }
  
  #view(tabelaContribuicaoTotal9501)
  #print(tabelaContribuicaoTotal9501)
 # view(tabelaContribuicaoTotal)
 # print(tabelaContribuicaoTotal)
 # write.csv(tabelaContribuicaoTotal,"tabelaContribuicaoTotal.csv")
  
  
  rubricasIncidentesMatch = colnames(valoresIncidentesCompleta)[colnames(valoresIncidentesCompleta) %in% rubricas]
  valoresIncidentesDespacho <- valoresIncidentesCompleta  %>% select(rubricasIncidentesMatch)
  valoresIncidentesDespacho <- cbind.data.frame(valoresIncidentesCompleta[1],valoresIncidentesDespacho)
  
  
  output$baixarDespacho <- downloadHandler(
    filename = function() {
      paste(paste0('DESPACHO ATESTANDO GRATIFICACAO ',toupper(input$nomePessoa)) , sep = '.', switch(
        input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      ))
    },
    
    content = function(file) {
      src <- normalizePath('asmaksn.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'asmaksn.Rmd', overwrite = TRUE)
      
      out <- render('asmaksn.Rmd', switch(
        input$format,
        PDF = pdf_document(), HTML = html_document(), Word = word_document()
      ))
      file.rename(out, file)
    }
  )
  
  
  
   folhasPDF = c(input$file1$datapath,input$file2$datapath)
  
 
      
  output$baixarFichaFinanceira <- downloadHandler(
    filename = function() { 
      paste(paste0('FICHA FINANCEIRA ',toupper(input$nomePessoa)), ".pdf", sep="")
    },
    
    content = function(file) {
      
      pdf_combine(folhasPDF, output = file)
      #PDF = pdf_document(), HTML = html_document(), Word = word_document()
      #dev.off()
      
    }
  )
      

  output$baixarRelatorioAuxiliar <- downloadHandler(
    filename = function() {
      paste(paste0('RELATORIO AUXILIAR ',toupper(input$nomePessoa)) , sep = '.', "html")
    },
    
    content = function(file) {
      src <- normalizePath('relatorio.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'relatorio.Rmd', overwrite = TRUE)
      
      out <- render('relatorio.Rmd', html_document()  )
      file.rename(out, file)
    }
  )
  
  
  
  shinyjs::show(id = 'baixarDespacho', anim = TRUE)
  shinyjs::show(id = 'baixarFichaFinanceira', anim = TRUE)
  shinyjs::show('baixarRelatorioAuxiliar', anim = TRUE)
  shinyjs::show('format', anim = TRUE)
  
  
  
 # render('asmaksn.Rmd', html_document(),encoding="UTF-8")
  
  }) 
  
  
  
  observeEvent(input$openModal, {
    showModal(
      modalDialog(title = "Sobre o App",
                  p("CCONTRI/CFP - IPERN"),
                  p(),
                  p("Este aplicativo atesta gratificações e reporta relatórios detalhados sobre o que foi contribuído de acordo com as rúbricas e fichas financeiras analisadas."),
                  p(),
                  p("Criado por: www.jordaoalves.xyz"))
    )
  })

  
  
  }