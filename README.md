# Game List
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/DeivinsonPereira/dslist/blob/main/LICENSE)

# Sobre o projeto

Game List é uma aplicação backend construida durante o **Intensivão Java Spring** (#dslist-backend). O evento foi organizado pela [DevSuperior](https://devsuperior.com "Site da DevSuperior"). 

A aplicação consiste em criar uma lista de jogos dentro de uma aplicação web, e fazer toda a funcionalidade backend para que a api consiga capturar os dados do banco de dados, assim como: capturar toda a lista de jogos, capturar jogo por id, capturar jogo pelo id da lista(listas de categorias de jogos), capturar listas por id. Além disso também foi desenvolvido uma funcionalidade para mover os jogos dentro da lista alterando o id deles respectivamente utilizando o banco H2 para testes e o PostgreSQL para a homologação.

## Modelo de Domínio

Este é o modelo de domínio utilizado para o projeto.

![Modelo Conceitual](https://github.com/DeivinsonPereira/dslist/blob/main/assets/dslist-model.png)

## Get Games

Captura dos jogos cadastrados no banco de dados.

![Get Games](https://github.com/DeivinsonPereira/dslist/blob/main/assets/postman-get-games.png)

## Get Games By Id

Captura do jogo identificado pelo id dentro do banco de dados.

![Get Games By Id](https://github.com/DeivinsonPereira/dslist/blob/main/assets/postman-get-by-id.png)

## Get List

Captura das listas(categorias de jogos) salvas no banco de dados.

![Get List](https://github.com/DeivinsonPereira/dslist/blob/main/assets/postman-get-list.png)

## Get List By Id

Captura dos jogos referente ao id da lista(categoria) em que eles pertencem.

![Get List By Id](https://github.com/DeivinsonPereira/dslist/blob/main/assets/postman-get-list-by-id.png)

## Movendo os jogos dentro da lista

Movendo os jogos dentro da lista modificando o id.

![Move Game 1](https://github.com/DeivinsonPereira/dslist/blob/main/assets/h1-2.png)![Move Game 2](https://github.com/DeivinsonPereira/dslist/blob/main/assets/h2-2.png)

## Homologação PostgreSQL

Após a relização dos testes no banco H2 os dados foram homologados para o Banco Postgres.

![Homolog Postgres](https://github.com/DeivinsonPereira/dslist/blob/main/assets/postgres.png)


# Tecnologias utilizadas

- Java
- Spring Boot
- Spring Data JPA / Hibernate
- Maven
- Postman
- H2 Database
- Postgres

# Como executar o projeto

## Back end
Pré-requisitos: Java 17

```bash
# clonar repositório
git clone https://github.com/DeivinsonPereira/dslist.git

# entrar na pasta do projeto back end
cd backend

# executar o projeto
./mvnw spring-boot:run
```

# Autor

Deivinson Robes Pereira

https://www.linkedin.com/in/deivinsonpereira/
