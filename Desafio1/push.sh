#!/bin/bash

if [ -f .env ]; then
  export $(cat .env | grep -v '^#' | awk '/=/ {print $1}')
fi

IMAGE_NAME="$DOCKER_HUB_USERNAME/weather-app"

echo $DOCKER_HUB_PASS | docker login --username $DOCKER_HUB_USERNAME --password-stdin

echo "Building Docker image..."
docker build --no-cache -t $IMAGE_NAME .

docker push $IMAGE_NAME