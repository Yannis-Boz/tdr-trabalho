# Trabalho Intermediário — Projeto Reprodutível (Receitas 2023–2025)

Este repositório contém a resolução do Trabalho Intermediário da disciplina **Tecnologia de Dados**. O objetivo é transformar a análise das receitas das farmácias em um pipeline automatizado, reprodutível e integrado.

## 🛠️ Infraestrutura e Ferramentas

- **`targets`**: Pipeline modular de dados (`_targets.R` e `R/funcoes.R`).
- **`renv`**: Gerenciamento e isolamento de dependências (`renv.lock`).
- **`Quarto`**: Geração dinâmica do relatório compilado (`relatorio.qmd`).
- **`GitHub Actions`**: Integração Contínua (CI/CD) em `.github/workflows/relatorio.yaml`.

## 🤖 Declaração de Uso de Inteligência Artificial (LLM)

Declara-se que este trabalho contou com o suporte da ferramenta de Inteligência Artificial Gemini Notebook / LLM para:

- Auxílio na estruturação das funções puras em R e do script `_targets.R`.
- Orientação sobre a configuração do ambiente reprodutível `renv` e do workflow do GitHub Actions.
- Boas práticas de versionamento granular no Git (commit por etapa).

---
Desenvolvido por Yannis Boz.