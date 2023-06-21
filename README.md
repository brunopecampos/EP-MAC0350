# EP-MAC0350

A university management system. This project is part of the discipline MAC0350 (Introduction to Software Systems).

## Installation

This projects only require Docker for running. 
To install it follow this tutorial: https://docs.docker.com/engine/install/.

## Executing: 

```
docker compose up
```

## Technologies and Explanations

There are 3 containers in this application: postgresql, adminer and gradle.

- Adminer is used as a GUI interface for postgresql. Can be accessed in localhost:8000
- Postgresql is the database. It runs on localhost:5432 and has an initialization script, which is located in db-init/init.sql. It is only executed when a new container is created. To execute it, it's necessary to remove the current volume associated with it. To clean all containers and volumes and run the init script again, run:

```
docker system prune
docker volume rm $(docker volume list -q)
```
- Gradle is used to build and run the java application. It runs on localhost:8080

## Authors

- Bruno Pereira Campos
- André Nogueira Ribeiro