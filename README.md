

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

## Documentação dos Endpoints

- Após ter rodado os testes, acessar a seguinte URL http://localhost:3000/api-docs/index.html
