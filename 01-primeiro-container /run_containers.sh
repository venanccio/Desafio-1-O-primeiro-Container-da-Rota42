#!/bin/bash

echo "Baixando a imagem nginx..."
docker pull nginx

echo "Iniciando o container nginx com o nome 'meu-servidor'..."
docker run --name meu-servidor -d -p 8080:80 nginx

echo "Listando containers em execução..."
docker ps

echo "Parando o container 'meu-servidor'..."
docker stop meu-servidor

echo "Removendo o container 'meu-servidor'..."
docker rm meu-servidor

echo "Listando todos os containers (incluindo os parados)..."
docker ps -a

echo "Script concluído com sucesso!"
