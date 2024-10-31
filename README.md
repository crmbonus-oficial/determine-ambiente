# Determine Ambiente

Este repositório contém uma GitHub Action que determina o ambiente a ser usado (Produção, Homologação ou Desenvolvimento) baseado na branch que foi commitada.

## Descrição

A ação lê a branch atual e define o ambiente correspondente:
- `main` -> Produção (`prd`)
- `hml` -> Homologação (`hml`)
- `dev` -> Desenvolvimento (`dev`)
- Qualquer outra branch -> Homologação (`hml`)

## Inputs
- `prd_branch`: Nome da branch para o ambiente de Produção (`default: main`)
- `hml_branch`: Nome da branch para o ambiente de Homologação (`default: hml`)
- `dev_branch`: Nome da branch para o ambiente de Desenvolvimento (`default: dev`)

## Outputs
    seleciona-ambiente: O ambiente determinado baseado na branch commitada.

## Exemplos de Saída

- Branch main
Determinando environment baseado na branch: refs/heads/main
Selected environment: prd

- Branch hml
Determinando environment baseado na branch: refs/heads/hml
Selected environment: hml

- Branch dev
Determinando environment baseado na branch: refs/heads/dev
Selected environment: dev

- Outra Branch
Determinando environment baseado na branch: refs/heads/feature-branch
Selected environment: hml

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



Exemplo de Uso

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



Autor
Victor Borges Silva

Licença
Este projeto está licenciado sob a GNU General Public License v3.0. Veja o arquivo LICENSE para mais detalhes.

