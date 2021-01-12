#!/bin/bash
cd terraform/environments/live
terraform init 
terraform plan --var-file=live.tfvars -out=liveplan
terraform apply "liveplan"
az aks get-credentials --resource-group liveResources --name aks_cluster
cd ~/QA-Final-Project