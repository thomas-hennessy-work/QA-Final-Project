#!/bin/bash
cd terraform 
terraform init
terraform apply -auto-approve
az aks get-credentials --resource-group liveResources --name aks_cluster

