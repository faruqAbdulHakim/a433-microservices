#!/bin/bash

# Create a docker image from this project with name item-app and tag v1
docker build -t item-app:v1 .

# See all docker image locally
docker image ls -a

# Change docker name align with dockerhub format
docker tag item-app:v1 faruqabdulhakim/item-app:v1

# Login to docker with specified credentials (make sure the password already set with env variable)
echo $PASSWORD_DOCKER_HUB | docker login -u faruqabdulhakim --password-stdin

# Push/upload the image to docker hub
docker push faruqabdulhakim/item-app:v1