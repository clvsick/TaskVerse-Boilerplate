#!/bin/bash

# Detener todos los contenedores
docker stop $(docker ps -aq)

# Eliminar contenedores inactivos
docker container prune -f

# Eliminar imágenes no utilizadas
docker image prune -af

# Eliminar todas las imágenes, incluyendo las que están en uso
docker rmi -f $(docker images -q)

# Eliminar redes no utilizadas
docker network prune -f

# Eliminar volúmenes no utilizados
docker volume prune -f

