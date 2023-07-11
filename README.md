# EP-MAC0350

Um sistema de gestão universitária. Este projeto faz parte da disciplina MAC0350 (Introdução a Sistemas de Software).

## Autores

- Bruno Pereira Campos (11806764)
- André Nogueira Ribeiro (12542230)

## Instalação

Este projeto requer apenas o Docker para ser executado.
Para instalá-lo, siga este tutorial: https://docs.docker.com/engine/install/.

## Execução: 

```
docker compose up
```

## Modelos do Banco
Os modelos do banco estão localizados na pasta db-init. 

Lá é possível encontrar:
- O modelo conceitual em modelo_conceitual.pdf
- O modelo lógico em modelo_logico.pdf
- O modelo físico em init.sql

## Rotas da Aplicação

A aplicação roda em **localhost:8080**. A partir dessa url básica é possível acessar todas as 4 consultas do enunciado:

- Consulta 1 em **localhost:8080/consulta1**
- Consulta 2 em **localhost:8080/consulta2**
- Consulta 3 em **localhost:8080/consulta3**
- Consulta 4 em **localhost:8080/consulta4**

Além disso, foram adicionadas páginas para vizualizar, cadastras, deletar e atualizar cada uma das entidades do banco. Elas podem ser encontradas em:

- Entidade **pessoa**: **localhost:8080/pessoas**
- Entidade **docente**: **localhost:8080/docentes**
- Entidade **funcionario**: **localhost:8080/funcionarios**
- Entidade **aluno**: **localhost:8080/alunos**
- Entidade **perfilpessoa**: **localhost:8080/perfilpessoas**
- Entidade **historico**: **localhost:8080/historico**
- Entidade **disciplina**: **localhost:8080/disciplinas**
- Entidade **oferecimento**: **localhost:8080/oferecimentos**

O código java de cada entidade pode ser encontrado em app/demo/src/main/java/com
O html das página pode ser encontrado em app/demo/src/main/resources/templates


## Tecnologias

Existem 3 containers nesta aplicação: postgresql, adminer e gradle.

- O Adminer é usado como uma interface gráfica para o postgresql. Pode ser acessado em localhost:8000.
- O Postgresql é o banco de dados. Ele é executado em localhost:5432 e possui um script de inicialização, localizado em db-init/init.sql. O script de inicialização só é executado quando um novo container é criado. Para executá-lo, é necessário remover o volume atual associado a ele. Para limpar todos os containers e volumes e executar o script de inicialização novamente, execute:


```
docker rm -f $(docker ps -aq) && docker volume rm -f $(docker volume ls -q) && docker compose up
```
- O Gradle é usado para construir e executar a aplicação Java. Ele é executado em localhost:8080.

- O arquivo docker-compose.yaml na raiz do projeto descreve os contêineres e suas funcionalidade
- A imagem do contêiner gradle está em app/Dockerfile


