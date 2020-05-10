#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo yum -y install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --update

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 046706167201.dkr.ecr.us-east-2.amazonaws.com
docker run -d -p 80:8080 046706167201.dkr.ecr.us-east-2.amazonaws.com/testcar:latest


