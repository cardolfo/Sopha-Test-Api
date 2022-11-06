

# Avaliação Sopha
Implementação do teste https://github.com/BrunoSDias/Sopha-Test-Api
## Pré-requisitos

- Ruby 2.7.1
- Docker

## Como subir banco e servidor de aplicação

- docker-compose up --build

## Como rodar os testes

Na pasta raiz da aplicação:

- Executar comando "bundle install"
- Executar comando "rails db:create db:migrate"
- Executar comando "rspec"

## Documentação para executar os endpoints (ainda não está executando pelo swagger)

- Acessar a seguinte URL http://ec2-3-89-242-61.compute-1.amazonaws.com/api-docs/index.html