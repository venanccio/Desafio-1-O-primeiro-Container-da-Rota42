#!/bin/bash

docker volume create nginx_logs

docker run -d --name nginx-container -p 8080:80 -v nginx_logs:/var/log/nginx nginx
sleep 5
curl http://localhost:8080
docker stop nginx-container
docker rm nginx-container

docker run -d --name nginx-container-2 -p 8080:80 -v nginx_logs:/var/log/nginx nginx

echo "Validando logs antigos no volume 'nginx_logs'..."

# Verificar arquivos no volume
docker run --rm -v nginx_logs:/data alpine ls /data

# Validar se o volume está montado no novo contêiner
docker inspect nginx-container-2 | grep '"Source":' | grep 'nginx_logs'

echo "Validação concluída."
