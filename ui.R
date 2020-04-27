useShinyjs()

dashboardPage(skin = "red",
                            dashboardHeader(title = "Analisar Gratificações - IPERN", titleWidth = 320,
                                            
                                            tags$li(class = "dropdown",
                                                    tags$a(href="http://www.ipe.rn.gov.br/", target="_blank", 
                                                           tags$img(height = "17px", alt="SNAP Logo", src='logoIpernPNG.png')
                                                    )
                                            ),
                                            
                                            
                                            tags$li(actionLink("openModal", 
                                               label = "", icon = icon("info")),
                                               class = "dropdown")),
              
              
                     dashboardSidebar(disable = TRUE),
              
                      
              
                     dashboardBody(   tags$head(tags$style(HTML(".multicol{font-size:12px;
                                                  height:auto;
                                                  -webkit-column-count: 2;
                                                  -moz-column-count: 2;
                                                  column-count: 2;
                                                  }

                                                  div.checkbox {margin-top: 0px;}"))), 
                                      
                                      
                                      
                  fluidRow(
                    
                    useShinyjs(),
                       
                       box(
                         title = "Entrada e saída dos arquivos"
                         ,status = "primary"
                         ,solidHeader = TRUE 
                         ,width = 2
                         ,fileInput("file1",h4("Selecione os contracheques em PDF de 01/1995 a 07/2001"),
                                    accept = c(".pdf"),multiple = TRUE
                         )
                         ,fileInput("file2",h4("Selecione os contracheques em PDF a partir de 08/2001"),
                                    accept = c(".pdf"),multiple = TRUE
                         )
                         ,actionButton("start", "Start")
                         ,tags$br()
                         ,tags$br()
                         ,downloadButton('baixarDespacho', 'Baixar Despacho')
                         ,tags$br()
                         ,radioButtons('format', NULL, c('HTML', 'Word'), selected = 'HTML',inline = TRUE)
                         ,tags$br()
                         ,downloadButton('baixarFichaFinanceira', 'Baixar Ficha Financeira')
                         ,tags$br()
                         ,tags$br()
                         ,downloadButton('baixarRelatorioAuxiliar', 'Baixar Relatório Auxiliar')
                         ),  
                       
                       box(
                         title = "Informações sobre o Despacho"
                         ,status = "primary"
                         ,solidHeader = TRUE 
                         ,width = 3
                        ,textInput("periodoPesquisa", h4("Período de pesquisa dos dados:"), 
                                    value = "Set/1995 a Dez/2001", placeholder = "Digite o período da pesquisa dos dados")
                        ,textInput("nProcesso", h4("Número do Processo:"), 
                                   value = "",
                                   placeholder = "Digite o número do Processo")
                        ,textInput("nomePessoa", h4("Nome do interessado:"), 
                                   value = "",
                                   placeholder = "Digite o nome do interessado")
                        ,selectInput("setorResponsavel", h4("Responsável pelo despacho:"), 
                                     choices = list("CCONTRI-IPERN" = "CCONTRI", "CFP-IPERN" = "CFP"), selected = "CCONTRI")
                        ,selectInput("destinatario", h4("Destinatário do processo:"), 
                                     choices = list("Gabinete da Presidência do IPERN" = "ao Gabinete da Presidência do IPERN", 
                                                    "Procuradoria Geral do IPERN" = "à Procuradoria Geral do IPERN"), 
                                     selected = "à Procuradoria Geral do IPERN")
                        ,dateInput("dataDespacho", h4("Data de criação do Despacho:"), value = NULL, min = NULL, max = NULL,
                                   format = "dd/mm/yyyy", startview = "month", weekstart = 0,
                                   language = "pt-BR")
                       ),  
                       
                     box(
                         title = "Rúbricas das gratificações a serem analisadas"
                         ,status = "primary"
                         ,solidHeader = TRUE 
                         ,width = 7
                         ,actionLink("selectall","Select All") 
                         ,tags$br()
                         ,tags$br()
                         ,tags$div(align = "left", 
                                   class = "multicol",
                                   checkboxGroupInput("rubricas",NULL,
                                                      c("GRATIFICACAO DE INSALUBRIDADE (cód. 113) < 08/01" = "113",
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
                                                      )))
                       )
                       
                     )
)

)