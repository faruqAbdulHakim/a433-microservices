#!/bin/bash

# Set the docker image name
DOCKER_IMAGE_NAME="order-service"

# Set the docker image tag
DOCKER_IMAGE_TAG="latest"

# Set the docker image name with github packages format
GHCR_IMAGE_NAME="ghcr.io/faruqabdulhakim/a433-microservices/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"

# Create a docker image from this project
docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .

# Prepare a docker image for github package
docker tag $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG $GHCR_IMAGE_NAME

# Login to github Packages (already set Personal Access Token in GitHub)
echo $CR_PAT | docker login ghcr.io -u faruqAbdulHakim --password-stdin

# Push/upload the image to docker hub
docker push $GHCR_IMAGE_NAME
