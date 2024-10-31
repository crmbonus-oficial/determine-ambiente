# Determine Ambiente

Este repositório contém uma GitHub Action que determina o ambiente a ser usado (Produção, Homologação ou Desenvolvimento) baseado na branch que foi commitada.

## Descrição

A ação lê a branch atual e define o ambiente correspondente:
- `main` -> Produção (`prd`)
- `hml` -> Homologação (`hml`)
- `dev` -> Desenvolvimento (`dev`)
- Qualquer outra branch -> Homologação (`hml`)

## Uso

Para usar esta ação em seu workflow, adicione o seguinte passo ao seu arquivo de workflow:

```yaml
name: CI

on:
  push:
    branches:
      - main
      - hml
      - dev
      - '*'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Determinar Ambiente
        uses: ./
        with:
          prd_branch: 'main'
          hml_branch: 'hml'
          dev_branch: 'dev'

      - name: Exibir Ambiente Selecionado
        run: echo "Ambiente selecionado: ${{ steps.set-environment.outputs.seleciona-ambiente }}"