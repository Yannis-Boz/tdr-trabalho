library(targets)
library(tarchetypes)

tar_option_set(
  packages = c("readr", "dplyr", "tidyr", "stringr", "purrr", "ggplot2"), 
  format = "rds"
)

# Carregar funcoes customizadas
tar_source("R/funcoes.R")

list(
  # 1. Rastrear arquivos de entrada
  tar_target(arquivo_2023, "dados/receitas_2023.csv", format = "file"),
  tar_target(arquivo_2024, "dados/receitas_2024.csv", format = "file"),
  tar_target(arquivo_2025, "dados/receitas_2025.csv", format = "file"),
  
  # 2. Ler e limpar cada dataset
  tar_target(dados_2023, ler_e_limpar_receitas(arquivo_2023)),
  tar_target(dados_2024, ler_e_limpar_receitas(arquivo_2024)),
  tar_target(dados_2025, ler_e_limpar_receitas(arquivo_2025)),
  
  # 3. Consolidar dados
  tar_target(
    dados_consolidados, 
    consolidar_receitas(
      lista_df = list(dados_2023, dados_2024, dados_2025), 
      anos = c(2023, 2024, 2025)
    )
  )
)