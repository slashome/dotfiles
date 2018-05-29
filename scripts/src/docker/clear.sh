#!/bin/bash
#Clear docker container and images
echo "Delete containers"
docker rm -f $(docker ps -a -q)

echo "Delete images"
docker rmi -f $(docker images -q)
