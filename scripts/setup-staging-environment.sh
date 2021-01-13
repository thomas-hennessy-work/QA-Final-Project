cd terraform/environments/live
terraform init 
terraform plan --var-file=staging.tfvars -out=stagingplan
terraform apply "liveplan"
az aks get-credentials --resource-group stagingResources --name aks_cluster
cd ../../../