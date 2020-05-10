#!/bin/bash

docker build -t testcar .
docker tag testcar:latest 046706167201.dkr.ecr.us-east-2.amazonaws.com/testcar:latest
