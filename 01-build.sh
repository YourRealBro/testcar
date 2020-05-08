#!/bin/bash

docker build -t car .
#docker run -d -p 8080:8080 car
docker tag testcar:latest 046706167201.dkr.ecr.us-east-2.amazonaws.com/testcar:latest


