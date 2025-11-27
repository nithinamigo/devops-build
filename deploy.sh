#!/bin/bash

docker pull nickchinnas/devops-prod:latest
docker rm -f react-prod || true

docker run -d \
  --name react-prod \
  -p 80:80 \
  nickchinnas/devops-prod:latest

