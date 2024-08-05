#!/bin/bash

if [ -f .env ]; then
  export $(cat .env | grep -v '^#' | awk '/=/ {print $1}')
fi

IMAGE_NAME="german01/weather-app"

docker pull $IMAGE_NAME

docker ps -a | grep $IMAGE_NAME | awk '{print $1}' | xargs -r docker stop | xargs -r docker rm

echo "Deploying new application..."
docker run -d -p 80:3000 --name weather-app $IMAGE_NAME

echo "Application is running and you can access to it from http://localhost"
