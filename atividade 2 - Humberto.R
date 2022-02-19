library("tidyverse")
library("basedosdados")
library("dplyr")
library("stringr")
library("ggplot2")

basedosdados::set_billing_id("ativ-2-ciencia-de-dados")

query <- bdplyr("br_inep_indicadores_educacionais.uf")
df <- bd_collect(query)

#Visualização 1 - Média de alunos por turma de Educação Infantial em MG entre 2017 e 2020:
visu_1 <- df %>%
  filter (ano > 2016, sigla_uf=="MG", localizacao=="total", rede=="total") %>%
  group_by (ano) %>%
  summarise(m1 = mean(atu_ei))
  
ggplot(visu_1, aes(x=ano, y=m1)) + 
  geom_bar(stat = "identity") +
  labs(title = "Média de Alunos por Turma EI MG 2017 a 2020", y = "Média de alunos", x = "Ano")

#Visualização 2 - Média de alunos por turma do Ensino Médio em MG entre 2011 e 2020:
visu_2 <- df %>%
  filter (ano > 2010, sigla_uf=="MG", localizacao=="total", rede=="total") %>%
  group_by (ano) %>%
  summarise(m1 = mean(atu_em))

ggplot(visu_2, aes(x=ano, y=m1)) + 
  geom_line(stat = "identity") +
  labs(title = "Média de Alunos por Turma Ensino Médio em MG 2011 a 2020", y = "Média de alunos", x = "Ano")

