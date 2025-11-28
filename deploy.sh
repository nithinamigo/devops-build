#!/bin/bash
ssh -o StrictHostKeyChecking=no ec2-user@15.134.213.219 '
  docker pull nickchinnas/devops-build:latest &&
  docker stop devops || true &&
  docker rm devops || true &&
  docker run -d --name devops -p 80:80 nickchinnas/devops-build:latest
'

