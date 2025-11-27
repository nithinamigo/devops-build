#!/bin/bash

IMAGE="nickchinnas/devops-build"

docker buildx create --use --name=m2builder 2>/dev/null || true

echo "Building image for linux/amd64..."
docker buildx build --platform linux/amd64 -t $IMAGE:latest --push .

