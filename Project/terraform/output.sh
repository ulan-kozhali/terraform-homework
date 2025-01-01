#!/bin/bash

TERRAFORM_DIR="/home/ubuntu/terraform-homework/Project/terraform"
ANSIBLE_HOSTS_FILE="/home/ubuntu/terraform-homework/Project/roles/hosts"
ANSIBLE_VARS_FILE="/home/ubuntu/terraform-homework/Project/roles/grafana/defaults/main.yaml"

cd $TERRAFORM_DIR || { echo "Terraform directory not found!"; exit 1; }

INSTANCE_IP=$(terraform output -raw ec2)

if [ -z "$INSTANCE_IP" ]; then
  echo "Failed to fetch the instance IP. Ensure Terraform output is configured correctly."
  exit 1
fi

echo "[webserver]" > $ANSIBLE_HOSTS_FILE
echo "$INSTANCE_IP" >> $ANSIBLE_HOSTS_FILE

sed -i "s|^prometheus_url:.*|prometheus_url: http://$INSTANCE_IP:9090|g" $ANSIBLE_VARS_FILE


