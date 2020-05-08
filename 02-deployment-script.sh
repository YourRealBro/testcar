#!/bin/bash

aws ecr create-repository --repository-name testcar2
docker push 046706167201.dkr.ecr.us-east-2.amazonaws.com/testcar:latest

