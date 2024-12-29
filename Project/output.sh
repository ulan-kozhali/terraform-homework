#!/bin/bash

TERRAFORM_DIR="/home/ubuntu/python-homework/project"
ANSIBLE_HOSTS_FILE="/home/ubuntu/terraform-homework/Project/hosts"

cd $TERRAFORM_DIR || { echo "Terraform directory not found!"; exit 1; }

INSTANCE_IP=$(terraform output -raw ec2) 

if [ -z "$INSTANCE_IP" ]; then
  echo "Failed to fetch the instance IP. Ensure Terraform output is configured correctly."
  exit 1
fi

echo "[webserver]" > $ANSIBLE_HOSTS_FILE
echo "$INSTANCE_IP" >> $ANSIBLE_HOSTS_FILE

echo "Ansible hosts file updated with the following IP:"
cat $ANSIBLE_HOSTS_FILE
