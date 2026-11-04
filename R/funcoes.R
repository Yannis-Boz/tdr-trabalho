#' Leitura e limpeza dos dados de receitas de um ano
ler_e_limpar_receitas <- function(caminho_csv) { 
  readr::read_csv2(caminho_csv, show_col_types = FALSE) |> 
    dplyr::mutate(dplyr::across(dplyr::everything(), as.character)) |> 
    tidyr::pivot_longer(
      cols = -1, 
      names_to = "mes", 
      values_to = "receita"
    ) |> 
    dplyr::rename(farmacia = 1) |> 
    dplyr::mutate( 
      receita = stringr::str_replace_all(receita, "-", NA_character_), 
      receita = stringr::str_replace_all(receita, "\\.", ""), 
      receita = stringr::str_replace_all(receita, ",", "."), 
      receita = as.numeric(receita) 
    ) 
} 

#' Combinar e resumir todas as receitas por farmacia e ano
consolidar_receitas <- function(lista_df, anos) { 
  purrr::map2_dfr(lista_df, anos, ~ dplyr::mutate(.x, ano = .y)) |> 
    dplyr::group_by(farmacia, ano) |> 
    dplyr::summarise( 
      total_receita = sum(receita, na.rm = TRUE), 
      media_mensal = mean(receita, na.rm = TRUE), 
      meses_com_dados = sum(!is.na(receita)), 
      .groups = "drop" 
    ) 
}