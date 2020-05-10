#!/bin/bash

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 046706167201.dkr.ecr.us-east-2.amazonaws.com
aws ecr create-repository --repository-name testcar
docker push 046706167201.dkr.ecr.us-east-2.amazonaws.com/testcar:latest

aws ec2 create-security-group --group-name testcar-sg --description "Testcar SG"
aws ec2 authorize-security-group-ingress --group-name testcar-sg --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name testcar-sg --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 create-key-pair --key-name testcarkeys --query 'KeyMaterial' --output text > testcarkeys.pem
chmod 400 testcarkeys.pem
aws ec2 run-instances --image-id ami-0d9ef3d936a8fa1c6 --count 1 --instance-type t2.micro --key-name testcarkeys --security-groups testcar-sg > instance.txt
#  --region us-east-2 --placement AvailabilityZone=us-east-2a

INSTANCE_ID=$(grep InstanceId instance.txt | awk '{print $2}' | tr -d ',\"')
#aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].PublicIpAddress' --output text
INST_IP=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
ssh -o StrictHostKeyChecking=no -i testcarkeys.pem ec2-user@${INST_IP}

scp -o StrictHostKeyChecking=no -i testcarkeys.pem 03-deploy-on-vm.sh ec2-user@${INST_IP}:/home/ec2-user/
scp -r -o StrictHostKeyChecking=no -i testcarkeys.pem ~/.aws ec2-user@${INST_IP}:/home/ec2-user/
ssh -o StrictHostKeyChecking=no -i testcarkeys.pem ec2-user@${INST_IP} -f '/home/ec2-user/03-deploy-on-vm.sh'


