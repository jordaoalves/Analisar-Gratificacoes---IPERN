# Gratificação de Insalubridade (cód. 113 e/ou cód. 47) no período de set/95 a fev/20; 

mensagemRubrica <- function(rubrica){
  
  options(Encoding="UTF-8")
  
  switch(rubrica, 
         "113" = "Gratificação de Insalubridade (cód. 113) no período de ", 
         "47" = "Gratificação de Insalubridade (cód. 47) no período de ", 
         "37" = "Gratificação de Adicional Noturno (cód. 47) no período de ", 
         "200" = "Vantagem Pessoal Lei 6.192 Art. 11 (cód. 200) no período de ",
         "59" = "Vantagem Pessoal Lei 6.192 Art. 11 (cód. 59) no período de ",
         "291" = "Gratificação de Jornada Especial (cód. 291) no período de ",
         "293" = "Gratificação Especial de Localização Geográfica (cód. 293) no período de ",
         "295" = "Gratificação Atividade Estadual - GAEST (cód. 295) no período de ")

}


